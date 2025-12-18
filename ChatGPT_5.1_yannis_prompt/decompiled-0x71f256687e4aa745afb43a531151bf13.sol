// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

/// @notice High-level reconstruction of a privileged cToken farming loop.
/// Hardcoded controller address: 0x4bd44ab605d3e88579a1cf5a18c1a805e648f5e8 (only caller).
/// Interacts with two ERC20 tokens and a cToken-like contract (stored in slots).
contract CTokenFarmer {
    address public constant CONTROLLER = 0x4bd44ab605d3e88579a1cf5a18c1a805e648f5e8;

    address public underlying; // stor_1
    address public payoutToken; // stor_4
    address public cToken;      // stor_5

    modifier onlyController() {
        require(msg.sender == CONTROLLER, "not controller");
        _;
    }

    receive() external payable {}

    /// @notice Mint cTokens by calling the cToken's mint(amount) as the controller.
    function approve(address /*spender*/, uint256 amount) external onlyController {
        ICtoken(cToken).mint(amount);
    }

    /// @notice Transfer any balance of an arbitrary token held by this contract to controller.
    function sweepToken(address token) external onlyController {
        uint256 bal = IERC20(token).balanceOf(address(this));
        IERC20(token).transfer(CONTROLLER, bal);
    }

    /// @notice Transfer all underlying held by this contract to controller.
    function sweepUnderlying() external onlyController {
        uint256 bal = IERC20(underlying).balanceOf(address(this));
        IERC20(underlying).transfer(CONTROLLER, bal);
    }

    /// @notice Runs a repetitive redeemUnderlying loop, ensuring profit exceeds an estimated gas cost.
    /// The loop redeems 200 times, minting extra cTokens first if balance is low.
    function transfer(address /*wallet*/) external onlyController {
        uint256 beforeBal = IERC20(payoutToken).balanceOf(address(this));

        // Get current exchange rate
        uint256 rate = ICtoken(cToken).exchangeRateStored(); // scaled by 1e18

        // Compute target redeem amount v5; formula mirrors decompiled math.
        uint256 tmp = (rate * 199) / 1e20; // adjust by ~1.99 and scaling
        uint256 redeemAmt = (tmp * 101);

        // Gas cost estimate check: rate*199/1e20 * 101 * 0x7c8683448 /1e18 must exceed gas*0x5265c0*3000/1e16
        uint256 estOut = (redeemAmt * 0x7c8683448) / 1e18;
        uint256 estCost = (msg.gas * 0x5265c0 * 3000) / 1e16;
        require(estOut > estCost, "unprofitable");

        // If cToken balance below 100, mint more
        if (ICtoken(cToken).balanceOf(address(this)) < 100) {
            ICtoken(cToken).mint(redeemAmt);
        }

        // Redeem underlying repeatedly
        for (uint256 i = 0; i < 200; i++) {
            ICtoken(cToken).redeemUnderlying(redeemAmt);
        }

        uint256 afterBal = IERC20(payoutToken).balanceOf(address(this));
        require(afterBal > beforeBal, "no gain");
    }

    /// @notice Refunds all ETH to controller.
    function refund() external onlyController {
        (bool ok, ) = CONTROLLER.call{value: address(this).balance}("");
        require(ok, "refund failed");
    }
}

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
}

interface ICtoken {
    function mint(uint256) external returns (uint256);
    function redeemUnderlying(uint256) external returns (uint256);
    function exchangeRateStored() external returns (uint256);
    function balanceOf(address) external view returns (uint256);
}
