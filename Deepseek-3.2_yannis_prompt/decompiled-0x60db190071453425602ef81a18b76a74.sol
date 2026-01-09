// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract FlashLoanArbitrageBot is Ownable, ReentrancyGuard {
    using SafeERC20 for IERC20;
    
    uint256 private constant UNLOCKED = 1;
    uint256 private constant LOCKED = 2;
    
    uint256 private _minProfit;
    mapping(address => bool) private _approvedRouters;
    
    // Fixed addresses
    address private constant WETH_ADDRESS = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address private constant UNISWAP_V3_ROUTER = 0xE592427A0AEce92De3Edee1F18E0157C05861564;
    address private constant SUSHISWAP_ROUTER = 0xd9e1cE17f2641f24aE83637ab66a2cca9C378B9F;
    address private constant OTHER_ROUTER = 0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45;
    
    event ArbitrageExecuted(
        address indexed tokenIn,
        address indexed tokenOut,
        uint256 amountIn,
        uint256 amountOut,
        uint256 profit,
        uint256 timestamp
    );
    event EmergencyWithdraw(address indexed token, uint256 amount);
    
    error ZeroAddress();
    error ZeroAmount();
    error SwapFailed();
    error InsufficientProfit();
    error InvalidPath();
    
    constructor(address initialOwner) Ownable(initialOwner) {
        // Initialize approved routers
        _approvedRouters[UNISWAP_V3_ROUTER] = true;
        _approvedRouters[SUSHISWAP_ROUTER] = true;
        _approvedRouters[OTHER_ROUTER] = true;
    }
    
    // Main arbitrage execution function
    function executeArbitrage(
        address tokenIn,
        address tokenOut,
        uint256 amount,
        address firstRouter,
        address secondRouter,
        bytes calldata firstSwapData,
        bytes calldata secondSwapData,
        uint256 minProfitOverride
    ) external nonReentrant onlyOwner {
        // Validate inputs
        if (tokenIn == address(0) || tokenOut == address(0)) revert ZeroAddress();
        if (amount == 0) revert ZeroAmount();
        
        // Validate routers
        if (!_approvedRouters[firstRouter] || !_approvedRouters[secondRouter]) {
            revert InvalidPath();
        }
        
        // Get initial balance of tokenIn
        uint256 initialBalance = IERC20(tokenIn).balanceOf(address(this));
        
        // Transfer tokenIn to first router and execute first swap
        IERC20(tokenIn).safeTransfer(firstRouter, amount);
        (bool success, ) = firstRouter.call(firstSwapData);
        if (!success) revert SwapFailed();
        
        // Get balance of tokenOut after first swap
        uint256 intermediateBalance = IERC20(tokenOut).balanceOf(address(this));
        
        // Transfer tokenOut to second router and execute second swap
        IERC20(tokenOut).safeTransfer(secondRouter, intermediateBalance);
        (bool secondSuccess, ) = secondRouter.call(secondSwapData);
        if (!secondSuccess) revert SwapFailed();
        
        // Get final balance of tokenIn
        uint256 finalBalance = IERC20(tokenIn).balanceOf(address(this));
        
        // Calculate profit
        uint256 profit = finalBalance > initialBalance ? finalBalance - initialBalance : 0;
        
        // Check if profit meets minimum requirements
        uint256 minProfitRequired = minProfitOverride > _minProfit ? minProfitOverride : _minProfit;
        if (profit < minProfitRequired) revert InsufficientProfit();
        
        emit ArbitrageExecuted(
            tokenIn,
            tokenOut,
            amount,
            finalBalance,
            profit,
            block.timestamp
        );
    }
    
    // Flash loan execution from Uniswap V3
    function executeFlashLoan(
        address token,
        uint256 amount,
        bytes calldata swapData
    ) external nonReentrant onlyOwner {
        if (token == address(0)) revert ZeroAddress();
        if (amount == 0) revert ZeroAmount();
        require(IERC20(token).code.length > 0, "Token has no code");
        
        // Call flash loan on the token (assuming it's a flash loanable token)
        (bool success, ) = token.call(
            abi.encodeWithSignature(
                "flash(address,uint256,uint256,bytes)",
                address(this),
                amount,
                0,
                swapData
            )
        );
        require(success, "Flash loan failed");
    }
    
    // Uniswap V3 flash callback
    function uniswapV3FlashCallback(
        uint256 fee0,
        uint256 fee1,
        bytes calldata data
    ) external {
        // Decode callback data
        (
            address token0,
            address token1,
            uint256 amount0,
            uint256 amount1,
            bytes memory swapData
        ) = abi.decode(data, (address, address, uint256, uint256, bytes));
        
        // Execute the swap
        (bool success, ) = token1.call(swapData);
        if (!success) revert SwapFailed();
        
        // Repay flash loan with fee
        uint256 repaymentAmount = amount0 + fee0;
        IERC20(token0).safeTransfer(msg.sender, repaymentAmount);
    }
    
    // Multi-step arbitrage through a path of routers
    function executeMultiStepArbitrage(
        bytes calldata pathData,
        uint256 amount,
        uint256 minProfit
    ) external nonReentrant onlyOwner {
        // This function decodes a complex path structure and executes multiple swaps
        // The pathData contains an array of swap instructions
        // Each instruction contains: token, router, and swap data
        
        // Implementation would decode the pathData and execute multiple swaps
        // Similar logic to executeArbitrage but with multiple steps
        
        revert("Not fully implemented in reconstruction");
    }
    
    // Admin functions
    function setApprovedRouter(address router, bool isActive) external onlyOwner {
        if (router == address(0)) revert ZeroAddress();
        _approvedRouters[router] = isActive;
    }
    
    function setMinProfit(uint256 minAcceptableProfit) external onlyOwner {
        _minProfit = minAcceptableProfit;
    }
    
    function emergencyWithdraw(address token) external onlyOwner {
        if (token == address(0)) {
            // Withdraw ETH
            uint256 balance = address(this).balance;
            (bool success, ) = owner().call{value: balance}("");
            require(success, "ETH transfer failed");
            emit EmergencyWithdraw(address(0), balance);
        } else {
            // Withdraw ERC20
            uint256 balance = IERC20(token).balanceOf(address(this));
            IERC20(token).safeTransfer(owner(), balance);
            emit EmergencyWithdraw(token, balance);
        }
    }
    
    // View functions
    function approvedRouters(address router) external view returns (bool) {
        return _approvedRouters[router];
    }
    
    function minProfit() external view returns (uint256) {
        return _minProfit;
    }
    
    function WETH() external pure returns (address) {
        return WETH_ADDRESS;
    }
    
    function UNISWAP_V3_ROUTER_ADDRESS() external pure returns (address) {
        return UNISWAP_V3_ROUTER;
    }
    
    function SUSHISWAP_ROUTER_ADDRESS() external pure returns (address) {
        return SUSHISWAP_ROUTER;
    }
    
    function OTHER_ROUTER_ADDRESS() external pure returns (address) {
        return OTHER_ROUTER;
    }
    
    // Internal helper functions
    function _safeIncreaseAllowance(
        address token,
        address spender,
        uint256 amount
    ) internal {
        uint256 currentAllowance = IERC20(token).allowance(address(this), spender);
        IERC20(token).safeIncreaseAllowance(spender, amount);
        
        // Fallback: If increaseAllowance fails, try resetting to 0 then setting to amount
        if (IERC20(token).allowance(address(this), spender) < currentAllowance + amount) {
            IERC20(token).safeApprove(spender, 0);
            IERC20(token).safeApprove(spender, currentAllowance + amount);
        }
    }
    
    receive() external payable {}
}