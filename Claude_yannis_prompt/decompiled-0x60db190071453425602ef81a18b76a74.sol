// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

interface IUniswapV3Pool {
    function flash(
        address recipient,
        uint256 amount0,
        uint256 amount1,
        bytes calldata data
    ) external;
}

contract ArbitrageBot is Ownable, ReentrancyGuard {
    using SafeERC20 for IERC20;

    // Constants
    address public constant WETH = 0xC02aaA39b223FE8D0a0e5C4F27eAD9083C756Cc2;
    address public constant UNISWAP_V3_ROUTER = 0xE592427A0AEce92De3Edee1F18E0157C05861564;
    address public constant SUSHISWAP_ROUTER = 0xd9e1cE17f2641f24aE83637ab66a2cca9C378B9F;
    address public constant UNISWAP_V2_ROUTER = 0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45;

    // State variables
    uint256 public minProfit;
    mapping(address => bool) public approvedRouters;

    // Events
    event EmergencyWithdraw(address indexed token, uint256 amount);
    event ArbitrageExecuted(
        address indexed tokenIn,
        address indexed tokenOut,
        uint256 amountIn,
        uint256 profit,
        uint256 finalBalance,
        uint256 timestamp
    );

    // Errors
    error ZeroAddress();
    error ZeroAmount();
    error InvalidPath();
    error SwapFailed();
    error InsufficientProfit();

    constructor() {
        // Constructor logic if needed
    }

    // ===== Admin Functions =====

    function setMinProfit(uint256 _minAcceptableProfit) external onlyOwner {
        minProfit = _minAcceptableProfit;
    }

    function setApprovedRouter(address _manager, bool _isActive) external onlyOwner {
        require(_manager != address(0), ZeroAddress());
        approvedRouters[_manager] = _isActive;
    }

    function emergencyWithdraw(address _token) external onlyOwner {
        if (_token == address(0)) {
            // Withdraw ETH
            uint256 balance = address(this).balance;
            (bool success, ) = owner().call{value: balance}("");
            require(success, "ETH transfer failed");
            emit EmergencyWithdraw(address(0), balance);
        } else {
            // Withdraw ERC20 token
            uint256 balance = IERC20(_token).balanceOf(address(this));
            IERC20(_token).safeTransfer(owner(), balance);
            emit EmergencyWithdraw(_token, balance);
        }
    }

    // ===== Flash Loan Callback =====

    function uniswapV3FlashCallback(
        uint256 fee0,
        uint256 fee1,
        bytes calldata data
    ) external {
        // Decode callback data
        (
            address tokenBorrowed,
            address router,
            uint256 amountBorrowed,
            bytes memory swapData
        ) = abi.decode(data, (address, address, uint256, bytes));

        // Approve router to spend tokens
        _approveRouter(tokenBorrowed, router, amountBorrowed);

        // Execute the swap
        (bool success, ) = router.call(swapData);
        require(success, SwapFailed());

        // Repay flash loan with fee
        uint256 amountToRepay = amountBorrowed + fee0;
        IERC20(tokenBorrowed).safeTransfer(msg.sender, amountToRepay);
    }

    // ===== Arbitrage Execution Functions =====

    /**
     * @notice Execute arbitrage using Uniswap V3 flash loan
     * @param pool The Uniswap V3 pool to flash loan from
     * @param tokenIn The token to borrow
     * @param amount The amount to borrow
     * @param callbackData Encoded data for the callback
     */
    function executeFlashArbitrage(
        address pool,
        address tokenIn,
        uint256 amount,
        bytes calldata callbackData
    ) external onlyOwner nonReentrant {
        require(pool != address(0) && tokenIn != address(0), ZeroAddress());
        require(amount > 0, ZeroAmount());

        // Initiate flash loan
        IUniswapV3Pool(pool).flash(address(this), amount, 0, callbackData);
    }

    /**
     * @notice Execute two-hop arbitrage without flash loan
     * @param tokenIn Input token
     * @param tokenOut Output token
     * @param amountIn Amount to swap
     * @param router1 First DEX router
     * @param router2 Second DEX router
     * @param swapData1 Swap call data for first router
     * @param swapData2 Swap call data for second router
     * @param minProfitOverride Minimum profit for this trade (0 = use default)
     */
    function executeTwoHopArbitrage(
        address tokenIn,
        address tokenOut,
        uint256 amountIn,
        address router1,
        address router2,
        bytes calldata swapData1,
        bytes calldata swapData2,
        uint256 minProfitOverride
    ) external onlyOwner nonReentrant {
        require(tokenIn != address(0) && tokenOut != address(0), ZeroAddress());
        require(amountIn > 0, ZeroAmount());
        require(approvedRouters[router1] && approvedRouters[router2], InvalidPath());

        // Record initial balance
        uint256 initialBalance = IERC20(tokenIn).balanceOf(address(this));

        // First swap: tokenIn -> tokenOut
        _approveRouter(tokenIn, router1, amountIn);
        (bool success1, ) = router1.call(swapData1);
        require(success1, SwapFailed());

        // Second swap: tokenOut -> tokenIn
        uint256 intermediateBalance = IERC20(tokenOut).balanceOf(address(this));
        _approveRouter(tokenOut, router2, intermediateBalance);
        (bool success2, ) = router2.call(swapData2);
        require(success2, SwapFailed());

        // Check profit
        uint256 finalBalance = IERC20(tokenIn).balanceOf(address(this));
        uint256 profit = finalBalance > initialBalance ? finalBalance - initialBalance : 0;
        
        uint256 minProfitRequired = minProfitOverride > minProfit ? minProfitOverride : minProfit;
        require(profit >= minProfitRequired, InsufficientProfit());

        emit ArbitrageExecuted(
            tokenIn,
            tokenOut,
            amountIn,
            profit,
            finalBalance,
            block.timestamp
        );
    }

    /**
     * @notice Execute multi-hop arbitrage across multiple DEXes
     * @param path Array of swap configurations
     * @param amountIn Initial amount to trade
     * @param minProfitOverride Minimum acceptable profit
     */
    function executeMultiHopArbitrage(
        SwapConfig[] calldata path,
        uint256 amountIn,
        uint256 minProfitOverride
    ) external onlyOwner nonReentrant {
        require(path.length >= 2, InvalidPath());
        require(amountIn > 0, ZeroAmount());

        SwapConfig memory firstConfig = path[0];
        address startToken = firstConfig.tokenIn;

        // Record initial balance
        uint256 initialBalance = IERC20(startToken).balanceOf(address(this));

        // Execute each swap in sequence
        for (uint256 i = 0; i < path.length; i++) {
            SwapConfig memory config = path[i];
            
            require(approvedRouters[config.router], InvalidPath());

            uint256 balance = IERC20(config.tokenIn).balanceOf(address(this));
            _approveRouter(config.tokenIn, config.router, balance);

            (bool success, ) = config.router.call(config.swapData);
            require(success, SwapFailed());
        }

        // Check final profit
        uint256 finalBalance = IERC20(startToken).balanceOf(address(this));
        uint256 profit = finalBalance > initialBalance ? finalBalance - initialBalance : 0;
        
        require(profit >= minProfitOverride, InsufficientProfit());

        emit ArbitrageExecuted(
            startToken,
            startToken,
            amountIn,
            profit,
            finalBalance,
            block.timestamp
        );
    }

    // ===== Internal Helper Functions =====

    function _approveRouter(
        address token,
        address router,
        uint256 amount
    ) private {
        uint256 currentAllowance = IERC20(token).allowance(address(this), router);
        uint256 newAllowance = currentAllowance + amount;

        // Try to approve
        IERC20(token).safeApprove(router, newAllowance);
    }

    // ===== Receive ETH =====

    receive() external payable {}

    // ===== Structs =====

    struct SwapConfig {
        address tokenIn;
        address router;
        bytes swapData;
    }
}