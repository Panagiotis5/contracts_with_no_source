// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

/// @notice High-level reconstruction of a Uniswap v4-style swap adapter that unlocks via PoolManager.
/// PoolManager is hardcoded to 0x4444c5dc75cb358380d2e3de08a90.
contract UnlockingSwapRouter {
    address public constant POOL_MANAGER = 0x4444c5dc75cb358380d2e3de08a90;

    error NotPoolManager();

    struct PoolKey {
        address currency0;
        address currency1;
        uint24 fee;
        int24 tickSpacing;
        address hook;
    }

    struct SwapParams {
        bool zeroForOne;
        int256 amountSpecified;
        address recipient;
    }

    struct UnlockData {
        address payer;
        PoolKey key;
        SwapParams params;
        bytes data;
    }

    // --- External API ---

    receive() external payable {}

    fallback() external payable {
        revert();
    }

    function poolManager() external pure returns (address) {
        return POOL_MANAGER;
    }

    /// @notice Entry point users call to perform a swap.
    /// The contract passes the request to PoolManager.unlock, which will trigger unlockCallback below.
    function swap(
        PoolKey calldata key,
        SwapParams calldata params,
        bytes calldata data
    ) external returns (bytes memory) {
        UnlockData memory payload = UnlockData({
            payer: msg.sender,
            key: key,
            params: params,
            data: data
        });

        (bool ok, bytes memory ret) = POOL_MANAGER.call(
            abi.encodeWithSignature("unlock(bytes)", abi.encode(payload))
        );
        require(ok, _bubble(ret));
        return ret;
    }

    /// @notice PoolManager calls this during `unlock`.
    /// Transfers input tokens from the payer to the PoolManager, performs the swap, then settles output to the recipient.
    function unlockCallback(bytes calldata rawData)
        external
        returns (bytes memory)
    {
        if (msg.sender != POOL_MANAGER) revert NotPoolManager();

        UnlockData memory u = abi.decode(rawData, (UnlockData));

        (address tokenIn, address tokenOut) = u.params.zeroForOne
            ? (u.key.currency0, u.key.currency1)
            : (u.key.currency1, u.key.currency0);

        uint256 amountIn = _abs(u.params.amountSpecified);

        // Pull input tokens into PoolManager
        _callTransferFrom(tokenIn, u.payer, POOL_MANAGER, amountIn);

        // Sync & settle inside PoolManager prior to the swap
        _call(POOL_MANAGER, abi.encodeWithSignature("sync(address)", tokenIn));
        _call(POOL_MANAGER, abi.encodeWithSignature("settle()"));

        // Execute swap
        (bool swapOk, bytes memory swapRet) = POOL_MANAGER.call(
            abi.encodeWithSignature(
                "swap((address,address,uint24,int24,address),(bool,int256,address),bytes)",
                u.key,
                u.params,
                u.data
            )
        );
        require(swapOk, _bubble(swapRet));

        // Read owed balance (PoolManager-specific storage slot).
        uint256 owed = _extTLoad(tokenOut);

        // Deliver output to recipient
        _call(
            POOL_MANAGER,
            abi.encodeWithSignature(
                "take(address,address,uint256)",
                tokenOut,
                u.params.recipient,
                owed
            )
        );

        return abi.encode(owed, swapRet);
    }

    // --- Internal helpers ---

    function _abs(int256 v) private pure returns (uint256) {
        return uint256(v >= 0 ? v : -v);
    }

    function _extTLoad(address token) private view returns (uint256 balance) {
        // PoolManager stores balances as tload(keccak256(address(this), token))
        bytes32 slot = keccak256(abi.encode(address(this), token));
        (bool ok, bytes memory ret) = POOL_MANAGER.staticcall(
            abi.encodeWithSignature("exttload(bytes32)", slot)
        );
        require(ok && ret.length >= 32, "exttload failed");
        balance = abi.decode(ret, (uint256));
    }

    function _call(address target, bytes memory data) private {
        (bool ok, bytes memory ret) = target.call(data);
        require(ok, _bubble(ret));
    }

    function _callTransferFrom(
        address token,
        address from,
        address to,
        uint256 amount
    ) private {
        (bool ok, bytes memory ret) = token.call(
            abi.encodeWithSignature("transferFrom(address,address,uint256)", from, to, amount)
        );
        require(ok && (ret.length == 0 || abi.decode(ret, (bool))), "transferFrom failed");
    }

    function _bubble(bytes memory ret) private pure returns (string memory) {
        if (ret.length < 4) return "call failed";
        assembly {
            revert(add(ret, 32), mload(ret))
        }
    }
}
