// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Mock interfaces based on decompiled logic
interface IPoolManager {
    function unlock(bytes calldata data) external returns (bytes memory);
    function swap(
        address key0,
        address key1,
        uint24 fee,
        int24 tickSpacing,
        address hooks,
        bool zeroForOne,
        int256 amountSpecified,
        uint160 sqrtPriceLimitX96,
        bytes calldata hookData
    ) external returns (int256, int256);
    function sync(address currency) external returns (uint256);
    function take(address currency, address to, uint256 amount) external;
    function settle() external returns (uint256);
    function exttload(bytes32 key) external view returns (uint256);
}

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract SwapRouter {
    address constant POOL_MANAGER = 0x4444c5dc75cb358380d2e3de08a90;

    struct PoolKey {
        address currency0;
        address currency1;
        uint24 fee;
        int24 tickSpacing;
        address hooks;
    }

    struct SwapParams {
        bool zeroForOne;
        int256 amountSpecified;
        uint160 sqrtPriceLimitX96;
    }

    struct CallbackData {
        address sender;
        PoolKey key;
        SwapParams params;
        bytes hookData;
    }

    error NotPoolManager();

    modifier onlyPoolManager() {
        if (msg.sender != POOL_MANAGER) revert NotPoolManager();
        _;
    }

    function poolManager() public pure returns (address) {
        return POOL_MANAGER;
    }

    function swap(
        PoolKey memory key,
        SwapParams memory params,
        bytes memory hookData
    ) public returns (int256 delta) {
        // Encoding callback data
        bytes memory callbackData = abi.encode(CallbackData({
            sender: msg.sender,
            key: key,
            params: params,
            hookData: hookData
        }));

        bytes memory result = IPoolManager(POOL_MANAGER).unlock(callbackData);
        return abi.decode(result, (int256));
    }

    function unlockCallback(bytes calldata rawData) external onlyPoolManager returns (bytes memory) {
        CallbackData memory data = abi.decode(rawData, (CallbackData));

        (address currency0, address currency1) = (data.key.currency0, data.key.currency1);
        
        // Determine input/output based on direction
        // Logic roughly maps to the decompiled flow
        // It seems to do a transferFrom, then sync, settle, swap, and take.
        
        // This suggests an exactInput swap where tokens are pulled first.
        
        // Note: The decompilation shows conditional logic MEM[v1.word2] which corresponds to zeroForOne
        address inputCurrency = data.params.zeroForOne ? currency0 : currency1;
        address outputCurrency = data.params.zeroForOne ? currency1 : currency0;
        
        uint256 amountToTransfer = uint256(-data.params.amountSpecified); // amountSpecified is negative for exact input in V4

        // Pull tokens
        IERC20(inputCurrency).transferFrom(data.sender, POOL_MANAGER, amountToTransfer);
        
        // Sync and Settle
        IPoolManager(POOL_MANAGER).sync(inputCurrency);
        IPoolManager(POOL_MANAGER).settle();

        // Perform Swap
        (int256 delta0, int256 delta1) = IPoolManager(POOL_MANAGER).swap(
            data.key.currency0,
            data.key.currency1,
            data.key.fee,
            data.key.tickSpacing,
            data.key.hooks,
            data.params.zeroForOne,
            data.params.amountSpecified,
            data.params.sqrtPriceLimitX96,
            data.hookData
        );

        // Take output tokens
        // Check delta for output
        // Decompiled: v24 = 0x5e7(v7, this, address(0x4444c5dc75cb358380d2e3de08a90));
        // v24 seems to be amount to take.
        // It reads from exttload.
        
        // Note: In simplified Gemini version, we might skip the exact exttload reconstruction 
        // if we assume standard V4 behavior, but let's try to preserve it.
        // It reads a value keyed by (this, outputCurrency) from transient storage?
        // Actually the decompilation shows `keccak256(varg1, varg0)` where varg1=this, varg0=outputCurrency.
        // This matches ERC6909 or transient accounting logic.
        
        uint256 amountToTake = IPoolManager(POOL_MANAGER).exttload(keccak256(abi.encodePacked(address(this), outputCurrency)));
        
        IPoolManager(POOL_MANAGER).take(outputCurrency, data.sender, amountToTake);

        return abi.encode(delta0); // Or whatever logic returns. Decompilation returns v26, v29, v23 (delta1?)
    }
}
