// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
}

interface IFeeRegistry {
    function getFeeCollector() external view returns (address);
}

error OwnableUnauthorizedAccount(address account);
error OwnableInvalidOwner(address owner);
error Panic(uint256 code);
error SwapFailed();
error SendFailed();
error TransferFailed();
error InsufficientOutput();
error InvalidRouter();
error InvalidAmount();
error InvalidRecipient();

contract SwapRouter {
    address private _owner;
    
    // Constants
    address public constant WRAPPED_NATIVE = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; // WETH
    address public constant FEE_REGISTRY = 0xbb968d878F3d30b3AA957874f7b8a5B11069332b;
    
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event FeeCollected(address indexed feeCollector, address token, uint256 amount);
    
    // Custom event for the swap function
    event SwapExecuted(address indexed fromToken, address indexed toToken, uint256 amountIn, uint256 amountOut);
    
    receive() external payable {}
    
    constructor() {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), msg.sender);
    }
    
    modifier onlyOwner() {
        if (msg.sender != _owner) revert OwnableUnauthorizedAccount(msg.sender);
        _;
    }
    
    function owner() public view returns (address) {
        return _owner;
    }
    
    function transferOwnership(address newOwner) public onlyOwner {
        if (newOwner == address(0)) revert OwnableInvalidOwner(address(0));
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
    
    function renounceOwnership() public onlyOwner {
        address oldOwner = _owner;
        _owner = address(0);
        emit OwnershipTransferred(oldOwner, address(0));
    }
    
    function getContractBalance(address token) public view returns (uint256) {
        if (token == address(0)) {
            return address(this).balance;
        } else {
            return IERC20(token).balanceOf(address(this));
        }
    }
    
    function withdrawNative(uint256 amount, address to) public onlyOwner {
        if (to == address(0)) revert InvalidRecipient();
        
        (bool success, ) = to.call{value: amount}("");
        if (!success) revert SendFailed();
    }
    
    function withdrawToken(address token, uint256 amount, address sendTo) public onlyOwner {
        if (sendTo == address(0)) revert InvalidRecipient();
        
        bool success = IERC20(token).transfer(sendTo, amount);
        if (!success) revert TransferFailed();
    }
    
    // Main swap function - named based on the selector 0xe94af684
    function swap(
        address fromToken,
        address toToken,
        uint256 amountIn,
        uint256 amountOutMin,
        address router,
        bytes calldata swapData,
        bool takeFee
    ) external payable {
        if (router == address(0)) revert InvalidRouter();
        if (amountIn == 0) revert InvalidAmount();
        if (amountIn <= amountOutMin) revert("fullExit");
        
        if (fromToken != address(0)) {
            // ERC20 token swap
            bool success = IERC20(fromToken).transferFrom(msg.sender, address(this), amountIn);
            if (!success) revert TransferFailed();
            
            _executeSwap(takeFee, toToken, amountIn, amountOutMin, router, swapData);
            emit SwapExecuted(fromToken, toToken, amountIn, amountOutMin);
        } else {
            // Native token swap
            if (msg.value < amountIn) revert("InsufficientNativeToken");
            
            _executeSwap(takeFee, toToken, amountIn, amountOutMin, router, swapData);
            emit SwapExecuted(address(0), toToken, amountIn, amountOutMin);
        }
    }
    
    function _executeSwap(
        bool takeFee,
        address toToken,
        uint256 amountIn,
        uint256 amountOutMin,
        address router,
        bytes calldata swapData
    ) private {
        if (takeFee) {
            // Path with fee collection
            uint256 amountAfterFee = _safeSub(amountIn, amountOutMin);
            
            if (toToken != address(0)) {
                // Token to token swap with fee
                _swapWithFee(toToken, amountIn, amountOutMin, router, swapData);
            } else {
                // Token to native swap with fee
                _swapToNativeWithFee(amountIn, amountOutMin, router, swapData);
            }
        } else {
            // Path without fee
            if (toToken != address(0)) {
                // Simple token swap
                _simpleSwap(toToken, amountIn, amountOutMin, router, swapData);
            } else {
                // Swap to native
                _swapToNative(amountIn, amountOutMin, router, swapData);
            }
        }
    }
    
    function _swapWithFee(
        address toToken,
        uint256 amountIn,
        uint256 amountOutMin,
        address router,
        bytes calldata swapData
    ) private {
        // Check allowance and approve if needed
        uint256 allowance = IERC20(toToken).allowance(address(this), router);
        if (allowance < amountIn) {
            if (allowance > 0) {
                IERC20(toToken).approve(router, 0);
            }
            IERC20(toToken).approve(router, type(uint256).max);
        }
        
        // Execute swap
        (bool success, ) = router.call(swapData);
        if (!success) revert SwapFailed();
        
        // Get resulting balance
        uint256 balance = IERC20(toToken).balanceOf(address(this));
        if (balance <= amountOutMin) revert InsufficientOutput();
        
        // Calculate fee
        uint256 feeAmount = _safeSub(balance, amountOutMin);
        
        // Collect fee
        _collectFee(toToken, feeAmount);
        
        // Transfer remaining to user
        bool transferSuccess = IERC20(toToken).transfer(msg.sender, amountOutMin);
        if (!transferSuccess) revert TransferFailed();
    }
    
    function _swapToNativeWithFee(
        uint256 amountIn,
        uint256 amountOutMin,
        address router,
        bytes calldata swapData
    ) private {
        // Execute swap
        (bool success, ) = router.call{value: amountIn}(swapData);
        if (!success) revert SwapFailed();
        
        // Check native balance
        uint256 balance = address(this).balance;
        if (balance <= amountOutMin) revert InsufficientOutput();
        
        // Calculate fee
        uint256 feeAmount = _safeSub(balance, amountOutMin);
        
        // Collect fee in native token
        _collectFee(address(0), feeAmount);
        
        // Transfer remaining to user
        (bool sendSuccess, ) = msg.sender.call{value: amountOutMin}("");
        if (!sendSuccess) revert SendFailed();
    }
    
    function _simpleSwap(
        address toToken,
        uint256 amountIn,
        uint256 amountOutMin,
        address router,
        bytes calldata swapData
    ) private {
        // Similar to _swapWithFee but without fee collection
        uint256 allowance = IERC20(toToken).allowance(address(this), router);
        if (allowance < amountIn) {
            if (allowance > 0) {
                IERC20(toToken).approve(router, 0);
            }
            IERC20(toToken).approve(router, type(uint256).max);
        }
        
        (bool success, ) = router.call(swapData);
        if (!success) revert SwapFailed();
        
        uint256 balance = IERC20(toToken).balanceOf(address(this));
        bool transferSuccess = IERC20(toToken).transfer(msg.sender, balance);
        if (!transferSuccess) revert TransferFailed();
    }
    
    function _swapToNative(
        uint256 amountIn,
        uint256 amountOutMin,
        address router,
        bytes calldata swapData
    ) private {
        (bool success, ) = router.call{value: amountIn}(swapData);
        if (!success) revert SwapFailed();
        
        (bool sendSuccess, ) = msg.sender.call{value: address(this).balance}("");
        if (!sendSuccess) revert SendFailed();
    }
    
    function _collectFee(address token, uint256 amount) private {
        address feeCollector = IFeeRegistry(FEE_REGISTRY).getFeeCollector();
        
        if (token == address(0)) {
            // Native token fee
            (bool success, ) = feeCollector.call{value: amount}("");
            if (!success) revert TransferFailed();
        } else {
            // ERC20 token fee
            bool success = IERC20(token).transfer(feeCollector, amount);
            if (!success) revert TransferFailed();
        }
        
        emit FeeCollected(feeCollector, token, amount);
    }
    
    function _safeSub(uint256 a, uint256 b) private pure returns (uint256) {
        require(a - b <= a, "Panic: arithmetic overflow");
        return a - b;
    }
}