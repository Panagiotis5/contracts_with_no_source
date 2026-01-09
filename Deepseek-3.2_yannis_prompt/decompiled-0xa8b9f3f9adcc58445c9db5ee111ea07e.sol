// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";

interface IPool {
    function flashLoanSimple(
        address receiverAddress,
        address asset,
        uint256 amount,
        bytes calldata params,
        uint16 referralCode
    ) external;

    function liquidationCall(
        address collateralAsset,
        address debtAsset,
        address user,
        uint256 debtToCover,
        bool receiveAToken
    ) external;
}

interface ISwapRouter {
    function exactInputSingle(
        address tokenIn,
        address tokenOut,
        uint24 fee,
        address recipient,
        uint256 deadline,
        uint256 amountIn,
        uint256 amountOutMinimum,
        uint160 sqrtPriceLimitX96
    ) external returns (uint256 amountOut);
}

contract FlashLoanLiquidator is Ownable, ReentrancyGuard {
    using SafeERC20 for IERC20;

    // Constants
    address public constant POOL = 0x87870Bca3F3fD6335C3F4ce8392D69350B4fA4E2;
    address public constant ADDRESSES_PROVIDER = 0x2f39d218133AFaB8F2B819B1066c7E434Ad94E9e;
    address public constant SWAP_ROUTER = 0xE592427A0AEce92De3Edee1F18E0157C05861564;
    uint256 public constant MAX_SLIPPAGE = 300; // 3%
    uint256 public constant REFERRAL_CODE = 0;

    // State variables
    bool public active;
    uint256 public minAcceptableProfit;
    mapping(address => bool) public allowedCallers;

    // Custom errors
    error UnauthorizedCaller();
    error NotActive();
    error InvalidParams();
    error InsufficientProfit(uint256 expected, uint256 actual);
    error SwapFailed();
    error ReentrancyGuardReentrantCall();

    // Events
    event MinProfitSet(uint256 newMinProfit);
    contractActiveSet(bool active);
    event CallerAllowanceSet(address caller, bool allowed);
    event LiquidationExecuted(
        address indexed user,
        address indexed collateralAsset,
        address indexed debtAsset,
        uint256 debtToCover,
        uint256 collateralSeized,
        uint256 profit
    );
    event ProfitWithdrawn(address token, uint256 amount);

    constructor() {
        // Initialize as active
        active = true;
        // Initialize reentrancy guard
        _nonReentrantBefore();
    }

    // =========== ADMIN FUNCTIONS ===========

    function setActive(bool isActive_) external onlyOwner {
        active = isActive_;
        emit contractActiveSet(isActive_);
    }

    function setMinProfit(uint256 _minAcceptableProfit) external onlyOwner {
        minAcceptableProfit = _minAcceptableProfit;
        emit MinProfitSet(_minAcceptableProfit);
    }

    function setCallerAllowance(address _caller, bool _isAllowed) external onlyOwner {
        allowedCallers[_caller] = _isAllowed;
        emit CallerAllowanceSet(_caller, _isAllowed);
    }

    function withdrawProfit(address _token) external onlyOwner {
        uint256 balance = IERC20(_token).balanceOf(address(this));
        if (balance > 0) {
            IERC20(_token).safeTransfer(owner(), balance);
            emit ProfitWithdrawn(_token, balance);
        }
    }

    function withdrawETH() external onlyOwner {
        uint256 balance = address(this).balance;
        if (balance > 0) {
            (bool success,) = owner().call{value: balance}("");
            require(success, "Transfer failed");
        }
    }

    function rescueTokens(address _tokenAddr, uint256 _amount) external onlyOwner {
        IERC20(_tokenAddr).safeTransfer(owner(), _amount);
    }

    // =========== PUBLIC FUNCTIONS ===========

    function initiateLiquidation(
        address collateralAsset,
        address debtAsset,
        address user,
        address swapTokenIn,
        address swapTokenOut,
        uint256 debtToCover,
        uint256 minCollateralSeized,
        uint24 swapFee
    ) external nonReentrant {
        require(active, "NotActive");
        require(allowedCallers[msg.sender], "UnauthorizedCaller");
        require(user != address(0), "InvalidParams");

        // Prepare parameters for flash loan
        bytes memory params = abi.encode(
            swapTokenIn,
            swapTokenOut,
            user,
            debtToCover,
            minCollateralSeized,
            swapFee
        );

        // Execute flash loan
        IPool(POOL).flashLoanSimple(
            address(this),
            debtAsset,
            debtToCover,
            params,
            REFERRAL_CODE
        );
    }

    // =========== FLASH LOAN CALLBACK ===========

    function executeOperation(
        address asset,
        uint256 amount,
        uint256 premium,
        address initiator,
        bytes calldata params
    ) external returns (bool) {
        require(msg.sender == POOL, "UnauthorizedCaller");
        require(initiator == address(this), "UnauthorizedCaller");

        // Decode parameters
        (
            address swapTokenIn,
            address swapTokenOut,
            address user,
            uint256 debtToCover,
            uint256 minCollateralSeized,
            uint24 swapFee
        ) = abi.decode(params, (address, address, address, uint256, uint256, uint24));

        // Execute liquidation and swap
        uint256 profit = _executeLiquidation(
            premium,
            amount,
            swapTokenIn,
            swapTokenOut,
            user,
            debtToCover,
            minCollateralSeized,
            swapFee
        );

        require(profit >= minAcceptableProfit, "InsufficientProfit");

        // Repay flash loan
        uint256 totalDebt = amount + premium;
        IERC20(asset).safeIncreaseAllowance(POOL, totalDebt);
        IERC20(asset).safeTransfer(POOL, totalDebt);

        return true;
    }

    // =========== INTERNAL FUNCTIONS ===========

    function _executeLiquidation(
        uint256 premium,
        uint256 loanAmount,
        address swapTokenIn,
        address swapTokenOut,
        address user,
        uint256 debtToCover,
        uint256 minCollateralSeized,
        uint24 swapFee
    ) internal returns (uint256) {
        // Approve debt asset for liquidation
        _approveToken(swapTokenOut, POOL, debtToCover);

        // Get initial balance of collateral
        uint256 initialBalance = IERC20(swapTokenIn).balanceOf(address(this));

        // Execute liquidation
        IPool(POOL).liquidationCall(
            swapTokenIn,
            swapTokenOut,
            user,
            debtToCover,
            false
        );

        // Calculate seized collateral
        uint256 seizedCollateral = IERC20(swapTokenIn).balanceOf(address(this)) - initialBalance;
        require(seizedCollateral >= minCollateralSeized, "InsufficientProfit");

        // Swap collateral back to debt asset
        uint256 amountOut = _swapCollateral(
            swapFee,
            seizedCollateral,
            swapTokenOut,
            swapTokenIn
        );

        // Calculate profit
        uint256 totalDebt = loanAmount + premium;
        require(amountOut >= totalDebt, "InsufficientProfit");
        uint256 profit = amountOut - totalDebt;

        emit LiquidationExecuted(
            user,
            swapTokenIn,
            swapTokenOut,
            debtToCover,
            seizedCollateral,
            profit
        );

        return profit;
    }

    function _swapCollateral(
        uint24 fee,
        uint256 amountIn,
        address tokenOut,
        address tokenIn
    ) internal returns (uint256) {
        // Approve token for swap
        _approveToken(tokenIn, SWAP_ROUTER, amountIn);

        // Calculate minimum amount out with slippage
        uint256 minAmountOut = (amountIn * (10000 - MAX_SLIPPAGE)) / 10000;

        // Execute swap
        uint256 amountOut = ISwapRouter(SWAP_ROUTER).exactInputSingle(
            tokenIn,
            tokenOut,
            fee,
            address(this),
            block.timestamp,
            amountIn,
            minAmountOut,
            0
        );

        require(amountOut > 0, "SwapFailed");
        return amountOut;
    }

    function _approveToken(address token, address spender, uint256 amount) internal {
        uint256 currentAllowance = IERC20(token).allowance(address(this), spender);
        if (currentAllowance < amount) {
            IERC20(token).safeApprove(spender, 0);
            IERC20(token).safeApprove(spender, type(uint256).max);
        }
    }

    // =========== VIEW FUNCTIONS ===========

    function isAllowedCaller(address caller) external view returns (bool) {
        return allowedCallers[caller];
    }

    // Getter for private variable alias
    function getMinProfit() external view returns (uint256) {
        return minAcceptableProfit;
    }

    // =========== FALLBACK ===========

    receive() external payable {}
}