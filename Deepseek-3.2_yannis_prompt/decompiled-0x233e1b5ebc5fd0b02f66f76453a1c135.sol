// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract UniswapV4Hook {
    address public constant POOL_MANAGER = 0x4444c5dc75cb358380d2e3de08a90;
    
    struct PoolKey {
        address token0;
        address token1;
        uint24 fee;
        int24 tickLower;
        address recipient;
    }
    
    struct SwapParams {
        bool zeroForOne;
        uint256 amountSpecified;
        address tokenIn;
    }
    
    struct CallbackData {
        address sender;
        PoolKey poolKey;
        SwapParams swapParams;
        bytes path;
    }
    
    fallback() external payable {
        revert();
    }
    
    receive() external payable {
        revert();
    }
    
    function poolManager() external pure returns (address) {
        return POOL_MANAGER;
    }
    
    function swap(
        PoolKey memory poolKey,
        SwapParams memory swapParams,
        bytes memory path
    ) external returns (uint256) {
        CallbackData memory callbackData = CallbackData({
            sender: msg.sender,
            poolKey: poolKey,
            swapParams: swapParams,
            path: path
        });
        
        // Encode the callback data
        bytes memory encodedData = abi.encode(
            callbackData.sender,
            callbackData.poolKey.token0,
            callbackData.poolKey.token1,
            callbackData.poolKey.fee,
            callbackData.poolKey.tickLower,
            callbackData.poolKey.recipient,
            callbackData.swapParams.zeroForOne,
            callbackData.swapParams.amountSpecified,
            callbackData.swapParams.tokenIn,
            callbackData.path
        );
        
        // Call unlock on pool manager with callback data
        (bool success, bytes memory result) = POOL_MANAGER.call(
            abi.encodeWithSignature("unlock(bytes)", encodedData)
        );
        require(success, "Pool manager unlock failed");
        
        // Parse and return the result
        return abi.decode(result, (uint256));
    }
    
    function unlockCallback(bytes calldata rawData) external {
        require(msg.sender == POOL_MANAGER, "NOT_POOL_MANAGER");
        
        // Decode the callback data
        CallbackData memory data = abi.decode(rawData, (CallbackData));
        
        // Determine token to transfer based on swap direction
        address transferToken;
        if (data.swapParams.zeroForOne) {
            transferToken = data.poolKey.token0;
        } else {
            transferToken = data.poolKey.token1;
        }
        
        // Calculate amount to transfer (negative of amountSpecified)
        uint256 transferAmount = negate(data.swapParams.amountSpecified);
        
        // Transfer tokens from sender to pool manager
        require(
            IERC20(transferToken).transferFrom(data.sender, POOL_MANAGER, transferAmount),
            "Transfer failed"
        );
        
        // Call sync on pool manager
        (bool syncSuccess, ) = POOL_MANAGER.call(
            abi.encodeWithSignature("sync(address)", transferToken)
        );
        require(syncSuccess, "Sync failed");
        
        // Call settle on pool manager
        (bool settleSuccess, bytes memory settleResult) = POOL_MANAGER.call(
            abi.encodeWithSignature("settle()")
        );
        require(settleSuccess, "Settle failed");
        uint256 settleAmount = abi.decode(settleResult, (uint256));
        
        // Calculate swap amount (positive of amountSpecified)
        uint256 swapAmount = negate(transferAmount);
        
        // Call swap on pool manager
        (bool swapSuccess, bytes memory swapResult) = POOL_MANAGER.call(
            abi.encodeWithSignature(
                "swap(address,address,uint24,int24,address,bool,uint256,address,bytes)",
                data.poolKey.token0,
                data.poolKey.token1,
                data.poolKey.fee,
                data.poolKey.tickLower,
                data.poolKey.recipient,
                data.swapParams.zeroForOne,
                swapAmount,
                data.swapParams.tokenIn,
                data.path
            )
        );
        require(swapSuccess, "Swap failed");
        uint256 swapOutput = abi.decode(swapResult, (uint256));
        
        // Calculate amount to take from pool manager
        address outputToken;
        if (data.swapParams.zeroForOne) {
            outputToken = data.poolKey.token1;
        } else {
            outputToken = data.poolKey.token0;
        }
        
        uint256 takeAmount = getPoolManagerBalance(outputToken, data.sender, POOL_MANAGER);
        
        // Take tokens from pool manager back to sender
        (bool takeSuccess, ) = POOL_MANAGER.call(
            abi.encodeWithSignature("take(address,address,uint256)", 
                outputToken, data.sender, takeAmount)
        );
        require(takeSuccess, "Take failed");
        
        // Return result
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, swapOutput)
            return(ptr, 32)
        }
    }
    
    // Internal helper function to negate a uint256 (two's complement)
    function negate(uint256 value) internal pure returns (uint256) {
        require(value != type(uint256).max, "Overflow");
        return type(uint256).max - value + 1;
    }
    
    // Internal helper function to get balance from pool manager
    function getPoolManagerBalance(
        address token,
        address owner,
        address poolManagerAddress
    ) internal returns (uint256) {
        // This appears to be reading from an external storage slot
        bytes32 slot = keccak256(abi.encode(owner, token));
        (bool success, bytes memory result) = poolManagerAddress.call(
            abi.encodeWithSignature("exttload(bytes32)", slot)
        );
        require(success, "Balance read failed");
        return abi.decode(result, (uint256));
    }
}

interface IERC20 {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}