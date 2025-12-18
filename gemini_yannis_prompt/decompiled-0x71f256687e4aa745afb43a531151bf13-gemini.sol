// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICToken {
    function mint(uint256 mintAmount) external returns (uint256);
    function redeemUnderlying(uint256 redeemAmount) external returns (uint256);
    function balanceOf(address owner) external view returns (uint256);
    function exchangeRateStored() external view returns (uint256);
}

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
}

contract CompoundStrategy {
    address public constant OWNER = 0x4bd44ab605d3e88579a1cf5a18c1a805e648f5e8;
    address public cToken; // Storage 5, _approve in decomp
    address public underlying; // Storage 4

    modifier onlyOwner() {
        require(msg.sender == OWNER, "Not owner");
        _;
    }

    function approve(address spender, uint256 amount) public onlyOwner {
        // Decomp: calls cToken.mint(amount)?
        // Wait, function selector 0x95ea7b3 is approve(address,uint256).
        // But body calls `_approve.mint(amount)`.
        // This implies `approve` here actually deposits into Compound?
        // Or `_approve` is the cToken address.
        ICToken(cToken).mint(amount);
    }

    function withdraw(address wallet) public payable onlyOwner {
        // Decomp: transfer(address) -> selector 0x1a695230
        // Calls redeemUnderlying loop?
        // 0x1a695230 in decomp matches `transfer(address)`.
        
        uint256 bal = ICToken(cToken).balanceOf(address(this));
        if (bal > 0) {
             ICToken(cToken).redeemUnderlying(bal); // simplified
        }
        
        uint256 underlyingBal = IERC20(underlying).balanceOf(address(this));
        if (underlyingBal > 0) {
            IERC20(underlying).transfer(OWNER, underlyingBal);
        }
    }

    function rescueToken(address token) public onlyOwner {
        uint256 bal = IERC20(token).balanceOf(address(this));
        IERC20(token).transfer(OWNER, bal);
    }

    function refund() public onlyOwner {
        payable(OWNER).transfer(address(this).balance);
    }
    
    // Fallback
    fallback() external payable {}
}
