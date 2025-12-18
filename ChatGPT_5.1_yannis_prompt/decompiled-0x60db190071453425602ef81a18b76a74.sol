// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

/// @notice High-level reconstruction of an owner-only flash/arbitrage helper with router allowlist.
/// Supports:
/// - Setting minProfit and approved routers
/// - Initiating UniV3 flash loans (be34c766)
/// - Performing two-hop arbitrage with two routers (62337027)
/// - Performing multi-hop arbitrary router sequence (0x005769e8)
/// - uniswapV3FlashCallback to execute payload and repay loan
/// - Emergency withdraw of tokens or ETH
contract FlashArb {
    address private _owner;
    uint256 private _status; // reentrancy: 1=unlocked,2=entered
    uint256 private _minProfit;
    mapping(address => bool) private _approvedRouters;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event EmergencyWithdraw(address indexed token, uint256 amount);
    event Arbitrage(address indexed tokenIn, address indexed tokenOut, uint256 amountIn, uint256 profit, uint256 timestamp);

    error OwnableUnauthorizedAccount(address);
    error OwnableInvalidOwner(address);
    error ReentrancyGuardReentrantCall();
    error ZeroAddress();
    error ZeroAmount();
    error InvalidPath();
    error SwapFailed();
    error InsufficientProfit();
    error SafeERC20FailedOperation(address);
    error AddressEmptyCode(address);
    error FailedInnerCall();
    error ZeroAddressRouter();
    error ZeroAmountFlash();

    modifier onlyOwner() {
        if (msg.sender != _owner) revert OwnableUnauthorizedAccount(msg.sender);
        _;
    }

    modifier nonReentrant() {
        if (_status == 2) revert ReentrancyGuardReentrantCall();
        _status = 2;
        _;
        _status = 1;
    }

    constructor() {
        _owner = msg.sender;
        _status = 1;
    }

    // --- Views ---
    function owner() external view returns (address) {
        return _owner;
    }

    function minProfit() external view returns (uint256) {
        return _minProfit;
    }

    function approvedRouters(address r) external view returns (bool) {
        return _approvedRouters[r];
    }

    function WETH() external pure returns (address) {
        return 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2;
    }

    function UNISWAP_V3_ROUTER() external pure returns (address) {
        return 0xe592427a0aece92de3edee1f18e0157c05861564;
    }

    function SUSHISWAP_ROUTER() external pure returns (address) {
        return 0xd9e1ce17f2641f24ae83637ab66a2cca9c378b9f;
    }

    function PERMIT2_ROUTER() external pure returns (address) {
        return 0x68b3465833fb72a70ecdf485e0e4c7bd8665fc45;
    }

    // --- Owner actions ---
    function setApprovedRouter(address router, bool active) external onlyOwner {
        if (router == address(0)) revert ZeroAddress();
        _approvedRouters[router] = active;
    }

    function setMinProfit(uint256 minAcceptableProfit) external onlyOwner {
        _minProfit = minAcceptableProfit;
    }

    function transferOwnership(address newOwner) external onlyOwner {
        if (newOwner == address(0)) revert OwnableInvalidOwner(address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

    function renounceOwnership() external onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    // --- Flash entry (UniV3-style) ---
    /// @notice Initiates a UniV3 flash loan by calling `flash` on pool `pool`.
    function startFlash(address pool, address tokenBorrow, uint256 amount, bytes calldata payload) external onlyOwner nonReentrant {
        if (pool == address(0) || tokenBorrow == address(0)) revert ZeroAddress();
        if (amount == 0) revert ZeroAmountFlash();
        IUniV3Pool(pool).flash(address(this), amount, 0, payload);
    }

    /// @notice UniV3 flash callback: executes encoded call on a router and repays principal+fee.
    /// payload encoding: abi.encode(address tokenIn, address router, uint256 amountOwed, bytes callData)
    function uniswapV3FlashCallback(
        uint256 fee0,
        uint256 /*fee1*/,
        bytes calldata data
    ) external nonReentrant {
        (address tokenIn, address router, uint256 principal, bytes memory callData) =
            abi.decode(data, (address, address, uint256, bytes));

        _safeApprove(tokenIn, router, principal + fee0);

        (bool ok, ) = router.call(callData);
        if (!ok) revert SwapFailed();

        _safeTransfer(tokenIn, msg.sender, principal + fee0); // repay pool
    }

    // --- Two-hop arbitrage ---
    /// @notice Swap tokenIn -> mid via routerA, then mid -> tokenIn via routerB; require profit >= minProfit.
    function twoHopArb(
        address tokenIn,
        address tokenMid,
        uint256 amountIn,
        address routerA,
        address routerB,
        bytes calldata dataA,
        bytes calldata dataB,
        uint256 minProfitOverride
    ) external onlyOwner nonReentrant {
        if (tokenIn == address(0) || tokenMid == address(0)) revert ZeroAddress();
        if (amountIn == 0) revert ZeroAmount();
        if (!_approvedRouters[routerA] || !_approvedRouters[routerB]) revert InvalidPath();

        uint256 balStart = IERC20(tokenIn).balanceOf(address(this));

        _safeApprove(tokenIn, routerA, amountIn);
        _call(routerA, dataA);

        uint256 midBal = IERC20(tokenMid).balanceOf(address(this));
        _safeApprove(tokenMid, routerB, midBal);
        _call(routerB, dataB);

        uint256 balEnd = IERC20(tokenIn).balanceOf(address(this));
        uint256 profit = balEnd > balStart ? balEnd - balStart : 0;
        uint256 minP = minProfitOverride > 0 ? minProfitOverride : _minProfit;
        if (profit < minP) revert InsufficientProfit();

        emit Arbitrage(tokenIn, tokenMid, amountIn, profit, block.timestamp);
    }

    // --- Multi-hop arbitrary sequence ---
    /// @notice Generalized multi-hop path: params is an array of (tokenIn, tokenOut, router, calldata).
    struct Hop {
        address tokenIn;
        address tokenOut;
        address router;
        bytes data;
    }

    function multiHopArb(Hop[] calldata hops, uint256 minProfitRequired) external onlyOwner nonReentrant {
        if (hops.length < 1) revert InvalidPath();
        uint256 startingBal = IERC20(hops[0].tokenIn).balanceOf(address(this));

        address currentToken = hops[0].tokenIn;
        for (uint256 i = 0; i < hops.length; i++) {
            Hop calldata h = hops[i];
            if (h.tokenIn != currentToken) revert InvalidPath();
            if (!_approvedRouters[h.router]) revert InvalidPath();

            uint256 bal = IERC20(h.tokenIn).balanceOf(address(this));
            _safeApprove(h.tokenIn, h.router, bal);
            _call(h.router, h.data);
            currentToken = h.tokenOut;
        }

        uint256 endingBal = IERC20(hops[hops.length - 1].tokenOut).balanceOf(address(this));
        uint256 profit = endingBal > startingBal ? endingBal - startingBal : 0;
        if (profit < minProfitRequired) revert InsufficientProfit();
        emit Arbitrage(hops[0].tokenIn, hops[hops.length - 1].tokenOut, startingBal, profit, block.timestamp);
    }

    // --- Emergency ---
    function emergencyWithdraw(address token) external onlyOwner {
        if (token == address(0)) {
            uint256 amt = address(this).balance;
            (bool ok, ) = _owner.call{value: amt}("");
            require(ok, "ETH transfer failed");
            emit EmergencyWithdraw(address(0), amt);
        } else {
            uint256 bal = IERC20(token).balanceOf(address(this));
            _safeTransfer(token, _owner, bal);
            emit EmergencyWithdraw(token, bal);
        }
    }

    receive() external payable {}

    // --- Internal helpers ---
    function _safeApprove(address token, address spender, uint256 value) private {
        (bool ok, bytes memory ret) = token.call(abi.encodeWithSelector(0x095ea7b3, spender, value));
        if (!(ok && (ret.length == 0 || abi.decode(ret, (bool))))) revert SafeERC20FailedOperation(token);
    }

    function _safeTransfer(address token, address to, uint256 value) private {
        (bool ok, bytes memory ret) = token.call(abi.encodeWithSelector(0xa9059cbb, to, value));
        if (!(ok && (ret.length == 0 || abi.decode(ret, (bool))))) revert SafeERC20FailedOperation(token);
    }

    function _call(address target, bytes memory data) private {
        (bool ok, bytes memory ret) = target.call(data);
        if (!ok) {
            if (ret.length == 0) revert SwapFailed();
            assembly {
                revert(add(ret, 32), mload(ret))
            }
        }
    }
}

interface IUniV3Pool {
    function flash(address recipient, uint256 amount0, uint256 amount1, bytes calldata data) external;
}

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
}
