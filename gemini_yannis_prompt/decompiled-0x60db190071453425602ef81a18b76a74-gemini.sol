// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
}

interface IUniswapV3Pool {
    function flash(
        address recipient,
        uint256 amount0,
        uint256 amount1,
        bytes calldata data
    ) external;
}

contract UniswapV3ArbBot {
    address public owner;
    uint256 public minProfit;
    mapping(address => bool) public approvedRouters;
    
    // Reentrancy guard status
    uint256 private status;

    address constant WETH = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2;
    address constant UNISWAP_V3_ROUTER = 0xe592427a0aece92de3edee1f18e0157c05861564;
    address constant SUSHISWAP_ROUTER = 0xd9e1ce17f2641f24ae83637ab66a2cca9c378b9f;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event EmergencyWithdraw(address indexed receiver, uint256 amount);
    event ArbitrageExecuted(address token0, address token1, uint256 amount, uint256 profit, uint256 balanceBefore, uint256 timestamp);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier nonReentrant() {
        require(status != 2, "Reentrant");
        status = 2;
        _;
        status = 1;
    }

    constructor() {
        owner = msg.sender;
        status = 1;
    }

    receive() external payable {}

    function setApprovedRouter(address router, bool isActive) public onlyOwner {
        approvedRouters[router] = isActive;
    }

    function setMinProfit(uint256 _minProfit) public onlyOwner {
        minProfit = _minProfit;
    }

    // Flash arb initiation
    function startArbitrage(
        address pool,
        address token0,
        uint256 amount0,
        bytes calldata data
    ) public onlyOwner nonReentrant {
        require(pool != address(0), "Invalid pool");
        IUniswapV3Pool(pool).flash(address(this), amount0, 0, data);
    }

    // Callback from Uniswap V3 Flash
    function uniswapV3FlashCallback(
        uint256 fee0,
        uint256 fee1,
        bytes calldata data
    ) external {
        // Decode data to get path and trade instructions
        // Execute trades on approved routers
        // Check profitability
        // Repay flash loan + fee
        // Send profit to owner
    }

    function emergencyWithdraw(address token) public onlyOwner {
        if (token == address(0)) {
            payable(owner).transfer(address(this).balance);
        } else {
            uint256 balance = IERC20(token).balanceOf(address(this));
            IERC20(token).transfer(owner, balance);
        }
    }
}
