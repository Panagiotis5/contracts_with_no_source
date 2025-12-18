// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

/// @notice High-level reconstruction of a minimal ERC20-like stub (6 decimals).
/// Balances are always zero; transfers only emit events. Metadata strings were
/// embedded in bytecode; placeholders are used here.
contract StubToken6 {
    // Immutable deployment-time storage values
    string private _signature;      // slot 1
    address private _transferFrom;  // slot 0

    event Transfer(address indexed from, address indexed to, uint256 value);

    // --- Metadata ---
    string private constant NAME = "";
    string private constant SYMBOL = "";
    uint8 public constant decimals = 6;

    function name() public pure returns (string memory) {
        return NAME;
    }

    function symbol() public pure returns (string memory) {
        return SYMBOL;
    }

    // Duplicates present in the bytecode
    function _name() external pure returns (string memory) {
        return NAME;
    }

    function _symbol() external pure returns (string memory) {
        return SYMBOL;
    }

    function _decimals() external pure returns (uint8) {
        return decimals;
    }

    // --- Supply ---

    uint256 public constant totalSupply = 0x16cd9fdb90ec9d5;

    function _totalSupply() external pure returns (uint256) {
        return totalSupply;
    }

    // --- Views ---

    function balanceOf(address /*account*/) public pure returns (uint256) {
        return 0;
    }

    function signature() external view returns (string memory) {
        return _signature;
    }

    // --- Transfers ---

    function transfer(address recipient, uint256 amount) external returns (bool) {
        emit Transfer(tx.origin, recipient, amount);
        return true;
    }

    /// @dev Only succeeds if the transaction origin matches the stored `_transferFrom` address.
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool) {
        require(tx.origin == _transferFrom, "not authorized");
        emit Transfer(sender, recipient, amount);
        return true;
    }

    // --- Fallback ---

    fallback() external payable {
        revert();
    }
}
