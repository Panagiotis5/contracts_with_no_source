// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.30;

interface IFeeManager {
    function getFeeCollector() external view returns (address);
    function isAuthorizedPaymaster(address) external view returns (bool);
    function getWrappedNative() external view returns (address);
}

contract SwapExecutor {
    
    // Storage
    mapping(bytes32 => bool) public orderIndexUsed; // mapping_0
    
    // Constants
    address public constant FEE_MANAGER = 0xBb968D878F3d30b3Aa957874F7B8a5b11069332B;
    address public constant WRAPPED_NATIVE = 0xC02aaA39b223FE8D0a0e5C4F27eAD9083C756Cc2;
    
    // Events
    event SwapExecuted(address indexed tokenIn, address indexed tokenOut, uint256 amountIn, uint256 fee);
    event FeeCollected(address indexed feeCollector, address token, uint256 amount);
    event OrderExecuted(bytes callData, bytes orderIndex);
    
    // Errors
    error ECDSAInvalidSignature();
    error ECDSAInvalidSignatureLength(uint256 length);
    error ECDSAInvalidSignatureS(uint256 s);
    
    // Modifiers and internal checks
    modifier onlySelf() {
        require(msg.sender == address(this), "Only self-call allowed");
        _;
    }
    
    receive() external payable {}
    
    // Main swap execution function with optional fee-before or fee-after logic
    function executeSwap(
        address tokenIn,
        address tokenOut,
        uint256 amountIn,
        uint256 feeAmount,
        address router,
        bytes calldata swapData,
        bool feeAfterSwap
    ) external payable onlySelf {
        require(router != address(0), "Invalid router");
        require(amountIn > 0, "Invalid amount");
        require(amountIn > feeAmount, "Fee exceeds amount");
        
        if (!feeAfterSwap) {
            // Fee-before-swap logic
            uint256 swapAmount = amountIn - feeAmount;
            
            // Collect fee first
            if (feeAmount > 0) {
                _collectFee(tokenIn, feeAmount);
            }
            
            // Execute swap
            if (tokenIn != address(0)) {
                // ERC20 token swap
                address wrappedNative = IFeeManager(FEE_MANAGER).getWrappedNative();
                _approveToken(tokenIn, wrappedNative, type(uint256).max);
                
                (bool success, bytes memory returnData) = router.call(swapData);
                require(success, "Swap failed");
            } else {
                // Native token swap
                (bool success, bytes memory returnData) = router.call{value: swapAmount}(swapData);
                require(success, "Swap failed");
            }
            
        } else {
            // Fee-after-swap logic
            
            // Execute swap first with full amount
            if (tokenIn != address(0)) {
                // ERC20 token swap
                address wrappedNative = IFeeManager(FEE_MANAGER).getWrappedNative();
                _approveToken(tokenIn, wrappedNative, type(uint256).max);
                
                (bool success, bytes memory returnData) = router.call(swapData);
                require(success, "Swap failed");
            } else {
                // Native token swap
                (bool success, bytes memory returnData) = router.call{value: amountIn}(swapData);
                require(success, "Swap failed");
            }
            
            // Check output and collect fee
            if (tokenOut != address(0)) {
                // ERC20 output
                uint256 balance = IERC20(tokenOut).balanceOf(address(this));
                require(balance > feeAmount, "Insufficient output");
                
                if (feeAmount > 0) {
                    _collectFee(tokenOut, feeAmount);
                }
            } else {
                // Native token output
                uint256 balance = address(this).balance;
                require(balance > feeAmount, "Insufficient output");
                
                if (feeAmount > 0) {
                    _collectFee(address(0), feeAmount);
                }
            }
        }
        
        emit SwapExecuted(tokenIn, tokenOut, amountIn, feeAmount);
    }
    
    // Transfer with fee collection
    function transferWithFee(
        address token,
        address from,
        address recipient,
        uint256 amount,
        uint256 feeAmount
    ) external payable onlySelf {
        require(from == address(this), "Invalid from address");
        require(recipient != address(0), "Invalid recipient");
        require(amount > 0, "Invalid amount");
        require(amount > feeAmount, "Fee exceeds amount");
        
        uint256 transferAmount = amount - feeAmount;
        address feeCollector = IFeeManager(FEE_MANAGER).getFeeCollector();
        
        if (token != address(0)) {
            // ERC20 transfer
            uint256 balance = IERC20(token).balanceOf(address(this));
            require(balance >= amount, "Insufficient token balance");
            
            bool success = IERC20(token).transfer(recipient, transferAmount);
            require(success, "Transfer failed");
            
            if (feeAmount > 0) {
                success = IERC20(token).transfer(feeCollector, feeAmount);
                require(success, "Fee transfer failed");
                emit FeeCollected(feeCollector, token, feeAmount);
            }
        } else {
            // Native token transfer
            require(address(this).balance >= amount, "Insufficient native token");
            
            (bool success, ) = recipient.call{value: transferAmount}("");
            require(success, "Transfer failed");
            
            if (feeAmount > 0) {
                (success, ) = feeCollector.call{value: feeAmount}("");
                require(success, "Fee transfer failed");
                emit FeeCollected(feeCollector, address(0), feeAmount);
            }
        }
    }
    
    // Execute signed order
    function executeOrder(
        bytes calldata callData,
        bytes calldata signature,
        bytes calldata orderIndex
    ) external payable {
        // Check authorization
        bool authorized = IFeeManager(FEE_MANAGER).isAuthorizedPaymaster(msg.sender);
        require(authorized, "Unauthorized paymaster");
        
        // Check order hasn't been used
        bytes32 orderHash = keccak256(orderIndex);
        require(!orderIndexUsed[orderHash], "OrderIndex already used");
        
        // Verify signature
        bytes32 dataHash = keccak256(callData);
        bytes32 messageHash = keccak256(abi.encodePacked(
            orderIndex,
            dataHash,
            address(this),
            block.chainid
        ));
        
        address signer = _recoverSigner(messageHash, signature);
        require(signer == address(this), "Invalid signature");
        
        // Mark order as used
        orderIndexUsed[orderHash] = true;
        
        // Execute the call
        (bool success, bytes memory returnData) = address(this).call{value: msg.value}(callData);
        require(success, "Execution failed");
        
        emit OrderExecuted(callData, orderIndex);
    }
    
    // Get contract balance
    function getContractBalance(address token) external view returns (uint256) {
        if (token != address(0)) {
            return IERC20(token).balanceOf(address(this));
        } else {
            return address(this).balance;
        }
    }
    
    // Check if order index has been used (by hash)
    function isOrderIndexUsedByHash(bytes32 orderHash) external view returns (bool) {
        return orderIndexUsed[orderHash];
    }
    
    // Check if order index has been used (by bytes)
    function isOrderIndexUsed(bytes calldata orderIndex) external view returns (bool) {
        return orderIndexUsed[keccak256(orderIndex)];
    }
    
    // Internal functions
    
    function _collectFee(address token, uint256 amount) private {
        address feeCollector = IFeeManager(FEE_MANAGER).getFeeCollector();
        
        if (token != address(0)) {
            // ERC20 fee
            bool success = IERC20(token).transfer(feeCollector, amount);
            require(success, "Fee transfer failed");
        } else {
            // Native token fee
            (bool success, ) = feeCollector.call{value: amount}("");
            require(success, "Fee transfer failed");
        }
        
        emit FeeCollected(feeCollector, token, amount);
    }
    
    function _approveToken(address token, address spender, uint256 amount) private {
        (bool success, ) = token.call(
            abi.encodeWithSelector(IERC20.approve.selector, spender, amount)
        );
        require(success, "Approval failed");
    }
    
    function _recoverSigner(bytes32 messageHash, bytes memory signature) private pure returns (address) {
        if (signature.length != 65) {
            _handleECDSAError(2, signature.length);
        }
        
        bytes32 r;
        bytes32 s;
        uint8 v;
        
        assembly {
            r := mload(add(signature, 0x20))
            s := mload(add(signature, 0x40))
            v := byte(0, mload(add(signature, 0x60)))
        }
        
        // Check s value (prevent signature malleability)
        if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
            _handleECDSAError(3, uint256(s));
        }
        
        bytes32 ethSignedHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", messageHash));
        address signer = ecrecover(ethSignedHash, v, r, s);
        
        if (signer == address(0)) {
            _handleECDSAError(1, 0);
        }
        
        return signer;
    }
    
    function _handleECDSAError(uint256 errorType, uint256 value) private pure {
        require(errorType < 4, "Invalid error type");
        
        if (errorType == 0) {
            return;
        } else if (errorType == 1) {
            revert ECDSAInvalidSignature();
        } else if (errorType == 2) {
            revert ECDSAInvalidSignatureLength(value);
        } else if (errorType == 3) {
            revert ECDSAInvalidSignatureS(value);
        }
    }
}

// Minimal IERC20 interface
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}