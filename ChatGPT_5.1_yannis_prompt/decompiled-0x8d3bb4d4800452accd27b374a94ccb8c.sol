// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

/// @notice High-level reconstruction of a dummy responder that mostly echoes input or reverts with calldata.
/// Many functions return empty bytes; `approve` and `transferOwnership` return the passed address as bytes.
contract CalldataEcho {
    // Fallback: revert and bubble the calldata back.
    fallback() external payable {
        bytes memory data = msg.data;
        assembly {
            revert(add(data, 32), mload(data))
        }
    }

    receive() external payable {}

    // Returns the spender address encoded as bytes (20 bytes).
    function approve(address spender, uint256 /*amount*/) external payable returns (bytes memory) {
        return abi.encodePacked(spender);
    }

    // Returns empty bytes for the remaining methods (mirroring the original no-op behavior).
    function withdraw(address /*_dao*/, address /*member*/, address /*tokenAddr*/, uint256 /*amount*/) external payable returns (bytes memory) {
        return bytes("");
    }

    function _11a806dc(address /*v0*/, uint32 /*v1*/, uint64 /*v2*/, uint64 /*v3*/, bool /*v4*/) external payable returns (bytes memory) {
        return bytes("");
    }

    function _3d7d693e(address /*v0*/, uint64 /*v1*/) external payable returns (bytes memory) {
        return bytes("");
    }

    function _7213f469(address /*v0*/, address /*v1*/, uint64 /*v2*/) external payable returns (bytes memory) {
        return bytes("");
    }

    function _496b7c3e(address /*v0*/, uint32 /*v1*/, uint64 /*v2*/) external payable returns (bytes memory) {
        return bytes("");
    }

    function _5db372b2(address /*v0*/, address /*v1*/, address /*v2*/, uint64 /*v3*/) external payable returns (bytes memory) {
        return bytes("");
    }

    function acceptOwnership() external payable returns (bytes memory) {
        return bytes("");
    }

    function _94b0ec10(address /*v0*/, address /*v1*/, uint256 /*v2*/) external payable returns (bytes memory) {
        return bytes("");
    }

    function _fde171a7(address /*v0*/, address /*v1*/, uint64 /*v2*/, uint64 /*v3*/) external payable returns (bytes memory) {
        return bytes("");
    }

    // Returns the new owner address encoded as bytes (20 bytes).
    function transferOwnership(address newOwner) external payable returns (bytes memory) {
        return abi.encodePacked(newOwner);
    }

    function _f861570d(address /*v0*/, uint256 /*v1*/) external payable returns (bytes memory) {
        return bytes("");
    }
}
