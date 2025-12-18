// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

/// @notice High-level reconstruction of a USDC-only bridge wrapper using Circle's CCTP-like interface.
contract UsdcBridgeWrapper {
    address private _owner;

    // Hardcoded constants from bytecode
    address public constant USDC = 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48;
    address public constant CCTP_ROUTER = 0x28b5a0e9c621a5badaa536219b3a228c8168cf5d;
    address public constant HOOK = 0xb21d281dedb17ae5b501f6aa8256fe38c4e45757;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    modifier onlyOwner() {
        require(msg.sender == _owner, "OwnableUnauthorizedAccount");
        _;
    }

    constructor() {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), msg.sender);
    }

    function owner() external view returns (address) {
        return _owner;
    }

    /// @notice Returns the CCTP router address (matches selector 0xa19b0ac0).
    function cctpRouter() external pure returns (address) {
        return CCTP_ROUTER;
    }

    /// @notice Returns the hook contract (matches selector 0x0b5c5bbc).
    function hook() external pure returns (address) {
        return HOOK;
    }

    /// @notice Convenience: returns USDC address.
    function usdc() external pure returns (address) {
        return USDC;
    }

    /// @notice Build the hook payload used in bridge call (selector 0x9085dca2).
    function buildHookPayload(address to) public pure returns (bytes memory) {
        // Encodes: uint256 length=56, bytes16 "cctp-forward", uint24 0x18, address recipient
        return abi.encodePacked(
            uint32(56),
            bytes16("cctp-forward"),
            bytes24(0x18),
            bytes20(to)
        );
    }

    /// @notice Bridge USDC to destination chain.
    /// @param _token must be USDC, otherwise reverts.
    /// @param _to recipient address on destination chain.
    /// @param _amount USDC amount; if type(uint256).max, uses full contract balance.
    function bridge(address _token, address _to, uint256 _amount) external onlyOwner {
        if (_token != USDC) revert("Invalid asset");

        uint256 amount = _amount;
        if (amount == type(uint256).max) {
            amount = IERC20(USDC).balanceOf(address(this));
        }

        _safeApprove(USDC, CCTP_ROUTER, amount);

        bytes memory hookData = buildHookPayload(_to);

        // Call CCTP router method with selector 0x779b432d
        // Args observed: amount, destinationDomain=19, fee=uint256(v14 placeholder), token=USDC,
        //                another amount placeholder (v14), gasLimit=0x7a120, feeBps=2000, hookData
        // We mirror the call; v14 was derived from an unused var; set to 0 to keep parity.
        uint256 feePlaceholder = 0;
        (bool ok, bytes memory ret) = CCTP_ROUTER.call(
            abi.encodeWithSelector(
                bytes4(0x779b432d),
                amount,
                uint32(19), // destination domain (example)
                feePlaceholder,
                USDC,
                feePlaceholder,
                uint256(0x7a120), // 500k gas
                uint256(2000),    // fee basis points?
                hookData
            )
        );
        if (!ok) _revertWith(ret);
    }

    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "OwnableInvalidOwner");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

    function renounceOwnership() external onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    // --- Internal helpers ---
    function _safeApprove(address token, address spender, uint256 value) private {
        (bool ok, bytes memory ret) = token.call(abi.encodeWithSelector(0x095ea7b3, spender, value));
        if (!(ok && (ret.length == 0 || abi.decode(ret, (bool))))) revert("SafeERC20FailedOperation");
    }

    function _revertWith(bytes memory ret) private pure {
        if (ret.length == 0) revert("Bridge failed");
        assembly {
            revert(add(ret, 32), mload(ret))
        }
    }
}

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
}
