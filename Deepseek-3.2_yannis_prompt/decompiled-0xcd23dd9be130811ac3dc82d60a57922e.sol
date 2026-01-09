// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity =0.7.6;

import './IUniswapV3Pool.sol';
import './IUniswapV3Factory.sol';
import './IERC20.sol';

contract UniswapV3Pool is IUniswapV3Pool {
    // Fixed parameters
    address public constant override factory = 0x1F98431c8aD98523631AE4a59f267346ea31F984;
    address public constant override token0 = 0x2C77EE50eC3B657690068F16F030B0289fF11445; // USDC
    address public constant override token1 = 0xC02aaa39b223fe8d0A0e5C4F27eAD9083C756Cc2; // WETH
    uint24 public constant override fee = 500; // 0.05% fee tier
    int24 public constant override tickSpacing = 10;
    
    // Slot0 packed storage (sqrtPriceX96, tick, observation index, etc.)
    struct Slot0 {
        uint160 sqrtPriceX96;
        int24 tick;
        uint16 observationIndex;
        uint16 observationCardinality;
        uint16 observationCardinalityNext;
        uint8 feeProtocol;
        bool unlocked;
    }
    Slot0 public override slot0;
    
    // Global fee growth
    uint256 public override feeGrowthGlobal0X128;
    uint256 public override feeGrowthGlobal1X128;
    
    // Liquidity
    uint128 public override liquidity;
    
    // Protocol fees
    uint128 public protocolFees0;
    uint128 public protocolFees1;
    
    // Ticks
    struct Tick {
        uint128 liquidityGross;
        int128 liquidityNet;
        uint256 feeGrowthOutside0X128;
        uint256 feeGrowthOutside1X128;
        int56 tickCumulativeOutside;
        uint160 secondsPerLiquidityOutsideX128;
        uint32 secondsOutside;
        bool initialized;
    }
    mapping(int24 => Tick) public override ticks;
    
    // Tick bitmap
    mapping(int16 => uint256) public override tickBitmap;
    
    // Positions
    struct Position {
        uint128 liquidity;
        uint256 feeGrowthInside0LastX128;
        uint256 feeGrowthInside1LastX128;
        uint128 tokensOwed0;
        uint128 tokensOwed1;
    }
    mapping(bytes32 => Position) public override positions;
    
    // Observations
    struct Observation {
        uint32 blockTimestamp;
        int56 tickCumulative;
        uint160 secondsPerLiquidityCumulativeX128;
        bool initialized;
    }
    Observation[65535] public observations;
    
    // Lock for reentrancy
    modifier lock() {
        require(slot0.unlocked, 'LOK');
        slot0.unlocked = false;
        _;
        slot0.unlocked = true;
    }
    
    // Only factory owner (for protocol fee changes)
    modifier onlyFactoryOwner() {
        require(msg.sender == IUniswapV3Factory(factory).owner(), 'not owner');
        _;
    }
    
    constructor() {
        // Initialize with zero values
        slot0.unlocked = true;
    }
    
    function initialize(uint160 sqrtPriceX96) external override {
        require(slot0.sqrtPriceX96 == 0, 'AI');
        int24 tick = TickMath.getTickAtSqrtRatio(sqrtPriceX96);
        
        // Initialize first observation
        (uint16 cardinality, uint16 cardinalityNext) = observations.initialize(_blockTimestamp());
        
        slot0 = Slot0({
            sqrtPriceX96: sqrtPriceX96,
            tick: tick,
            observationIndex: 0,
            observationCardinality: cardinality,
            observationCardinalityNext: cardinalityNext,
            feeProtocol: 0,
            unlocked: true
        });
        
        emit Initialize(sqrtPriceX96, tick);
    }
    
    function mint(
        address recipient,
        int24 tickLower,
        int24 tickUpper,
        uint128 amount,
        bytes calldata data
    ) external override lock returns (uint256 amount0, uint256 amount1) {
        require(amount > 0, 'M0');
        
        // Update position
        bytes32 positionKey = keccak256(abi.encodePacked(recipient, tickLower, tickUpper));
        Position storage position = positions[positionKey];
        
        // Get current price and tick
        Slot0 memory _slot0 = slot0;
        uint160 sqrtPriceX96 = _slot0.sqrtPriceX96;
        int24 tick = _slot0.tick;
        
        // Write an oracle entry
        (uint16 index, uint16 cardinality) = observations.write(
            _slot0.observationIndex,
            _blockTimestamp(),
            tick,
            liquidity,
            _slot0.observationCardinality,
            _slot0.observationCardinalityNext
        );
        
        // Update slot0 if observation index changed
        if (index != _slot0.observationIndex) {
            slot0.observationIndex = index;
            slot0.observationCardinality = cardinality;
        }
        
        // Calculate amounts
        if (tick < tickLower) {
            // Current tick is below the passed range; liquidity can only become in range by crossing from left to
            // right, when we'll need _more_ token0 (it's becoming more valuable) so user must provide it
            amount0 = SqrtPriceMath.getAmount0Delta(
                TickMath.getSqrtRatioAtTick(tickLower),
                TickMath.getSqrtRatioAtTick(tickUpper),
                amount,
                false
            );
        } else if (tick < tickUpper) {
            // Current tick is inside the passed range
            amount0 = SqrtPriceMath.getAmount0Delta(
                sqrtPriceX96,
                TickMath.getSqrtRatioAtTick(tickUpper),
                amount,
                false
            );
            amount1 = SqrtPriceMath.getAmount1Delta(
                TickMath.getSqrtRatioAtTick(tickLower),
                sqrtPriceX96,
                amount,
                false
            );
            
            // Update liquidity
            liquidity = liquidity + amount;
        } else {
            // Current tick is above the passed range; liquidity can only become in range by crossing from right to
            // left, when we'll need _more_ token1 (it's becoming more valuable) so user must provide it
            amount1 = SqrtPriceMath.getAmount1Delta(
                TickMath.getSqrtRatioAtTick(tickLower),
                TickMath.getSqrtRatioAtTick(tickUpper),
                amount,
                false
            );
        }
        
        // Update ticks and position
        (bool flippedLower, bool flippedUpper) = _updateTicks(recipient, tickLower, tickUpper, tick, int128(amount), false);
        
        if (amount0 > 0 || amount1 > 0) {
            uint256 balance0Before;
            uint256 balance1Before;
            if (amount0 > 0) balance0Before = balance0();
            if (amount1 > 0) balance1Before = balance1();
            
            IUniswapV3MintCallback(msg.sender).uniswapV3MintCallback(amount0, amount1, data);
            
            if (amount0 > 0) require(balance0Before + amount0 <= balance0(), 'M0');
            if (amount1 > 0) require(balance1Before + amount1 <= balance1(), 'M1');
        }
        
        emit Mint(msg.sender, recipient, tickLower, tickUpper, amount, amount0, amount1);
    }
    
    function burn(
        int24 tickLower,
        int24 tickUpper,
        uint128 amount
    ) external override lock returns (uint256 amount0, uint256 amount1) {
        // Similar to mint but in reverse
        // ... implementation details from decompiled code ...
    }
    
    function swap(
        address recipient,
        bool zeroForOne,
        int256 amountSpecified,
        uint160 sqrtPriceLimitX96,
        bytes calldata data
    ) external override lock returns (int256 amount0, int256 amount1) {
        require(amountSpecified != 0, 'AS');
        
        Slot0 memory slot0Start = slot0;
        require(slot0Start.unlocked, 'LOK');
        
        // Check price limits
        if (zeroForOne) {
            require(sqrtPriceLimitX96 < slot0Start.sqrtPriceX96 && sqrtPriceLimitX96 > TickMath.MIN_SQRT_RATIO, 'SPL');
        } else {
            require(sqrtPriceLimitX96 > slot0Start.sqrtPriceX96 && sqrtPriceLimitX96 < TickMath.MAX_SQRT_RATIO, 'SPL');
        }
        
        // Unlock the pool during the swap
        slot0.unlocked = false;
        
        SwapState memory state = SwapState({
            amountSpecifiedRemaining: amountSpecified,
            amountCalculated: 0,
            sqrtPriceX96: slot0Start.sqrtPriceX96,
            tick: slot0Start.tick,
            feeGrowthGlobalX128: zeroForOne ? feeGrowthGlobal0X128 : feeGrowthGlobal1X128,
            protocolFee: 0,
            liquidity: liquidity
        });
        
        // Continue swapping as long as we haven't used the entire input/output
        while (state.amountSpecifiedRemaining != 0 && state.sqrtPriceX96 != sqrtPriceLimitX96) {
            StepComputations memory step;
            
            step.sqrtPriceStartX96 = state.sqrtPriceX96;
            
            // Find next tick
            (step.tickNext, step.initialized) = tickBitmap.nextInitializedTickWithinOneWord(
                state.tick,
                tickSpacing,
                zeroForOne
            );
            
            // Ensure that we do not overshoot the min/max tick
            if (step.tickNext < TickMath.MIN_TICK) {
                step.tickNext = TickMath.MIN_TICK;
            } else if (step.tickNext > TickMath.MAX_TICK) {
                step.tickNext = TickMath.MAX_TICK;
            }
            
            // Get the price for the next tick
            step.sqrtPriceNextX96 = TickMath.getSqrtRatioAtTick(step.tickNext);
            
            // Compute values at the target price
            (state.sqrtPriceX96, step.amountIn, step.amountOut, step.feeAmount) = SwapMath.computeSwapStep(
                state.sqrtPriceX96,
                (zeroForOne ? step.sqrtPriceNextX96 < sqrtPriceLimitX96 : step.sqrtPriceNextX96 > sqrtPriceLimitX96)
                    ? sqrtPriceLimitX96
                    : step.sqrtPriceNextX96,
                state.liquidity,
                state.amountSpecifiedRemaining,
                fee
            );
            
            if (exactInput) {
                state.amountSpecifiedRemaining -= (step.amountIn + step.feeAmount).toInt256();
                state.amountCalculated = state.amountCalculated.sub(step.amountOut.toInt256());
            } else {
                state.amountSpecifiedRemaining += step.amountOut.toInt256();
                state.amountCalculated = state.amountCalculated.add((step.amountIn + step.feeAmount).toInt256());
            }
            
            // Update global fee tracker
            if (state.liquidity > 0) {
                state.feeGrowthGlobalX128 += FullMath.mulDiv(
                    step.feeAmount,
                    FixedPoint128.Q128,
                    state.liquidity
                );
            }
            
            // Shift tick if we reached the next price
            if (state.sqrtPriceX96 == step.sqrtPriceNextX96) {
                // If the tick is initialized, run the tick transition
                if (step.initialized) {
                    // Update tick data and flip the tick bitmap
                    int128 liquidityNet = ticks.cross(
                        step.tickNext,
                        (zeroForOne ? state.feeGrowthGlobalX128 : feeGrowthGlobal0X128),
                        (zeroForOne ? feeGrowthGlobal1X128 : state.feeGrowthGlobalX128)
                    );
                    
                    if (zeroForOne) liquidityNet = -liquidityNet;
                    state.liquidity = LiquidityMath.addDelta(state.liquidity, liquidityNet);
                }
                
                state.tick = zeroForOne ? step.tickNext - 1 : step.tickNext;
            } else if (state.sqrtPriceX96 != step.sqrtPriceStartX96) {
                // Recompute if we didn't reach the next tick
                state.tick = TickMath.getTickAtSqrtRatio(state.sqrtPriceX96);
            }
        }
        
        // Update global fee growth
        if (zeroForOne) {
            feeGrowthGlobal0X128 = state.feeGrowthGlobalX128;
            if (state.protocolFee > 0) protocolFees0 += state.protocolFee;
        } else {
            feeGrowthGlobal1X128 = state.feeGrowthGlobalX128;
            if (state.protocolFee > 0) protocolFees1 += state.protocolFee;
        }
        
        // Update liquidity
        if (liquidity != state.liquidity) liquidity = state.liquidity;
        
        // Update slot0
        if (state.tick != slot0Start.tick) {
            (uint16 index, uint16 cardinality) = observations.write(
                slot0Start.observationIndex,
                _blockTimestamp(),
                slot0Start.tick,
                slot0Start.liquidity,
                slot0Start.observationCardinality,
                slot0Start.observationCardinalityNext
            );
            slot0.sqrtPriceX96 = state.sqrtPriceX96;
            slot0.tick = state.tick;
            slot0.observationIndex = index;
            slot0.observationCardinality = cardinality;
        } else {
            slot0.sqrtPriceX96 = state.sqrtPriceX96;
        }
        
        // Determine actual amounts transferred
        if (zeroForOne == exactInput) {
            amount0 = amountSpecified - state.amountSpecifiedRemaining;
            amount1 = state.amountCalculated;
        } else {
            amount0 = state.amountCalculated;
            amount1 = amountSpecified - state.amountSpecifiedRemaining;
        }
        
        // Transfer tokens
        if (zeroForOne) {
            if (amount1 < 0) TransferHelper.safeTransfer(token1, recipient, uint256(-amount1));
            
            uint256 balance0Before = balance0();
            IUniswapV3SwapCallback(msg.sender).uniswapV3SwapCallback(amount0, amount1, data);
            require(balance0Before + uint256(amount0) <= balance0(), 'IIA');
        } else {
            if (amount0 < 0) TransferHelper.safeTransfer(token0, recipient, uint256(-amount0));
            
            uint256 balance1Before = balance1();
            IUniswapV3SwapCallback(msg.sender).uniswapV3SwapCallback(amount0, amount1, data);
            require(balance1Before + uint256(amount1) <= balance1(), 'IIA');
        }
        
        emit Swap(msg.sender, recipient, amount0, amount1, state.sqrtPriceX96, state.liquidity, state.tick);
    }
    
    function collect(
        address recipient,
        int24 tickLower,
        int24 tickUpper,
        uint128 amount0Requested,
        uint128 amount1Requested
    ) external override lock returns (uint128 amount0, uint128 amount1) {
        // Collect fees owed to a position
        // ... implementation details from decompiled code ...
    }
    
    function flash(
        address recipient,
        uint256 amount0,
        uint256 amount1,
        bytes calldata data
    ) external override lock {
        // Flash loan functionality
        // ... implementation details from decompiled code ...
    }
    
    function increaseObservationCardinalityNext(uint16 observationCardinalityNext) external override lock {
        // Increase observation buffer size
        // ... implementation details from decompiled code ...
    }
    
    function setFeeProtocol(uint8 feeProtocol0, uint8 feeProtocol1) external override lock onlyFactoryOwner {
        require((feeProtocol0 == 0 || (feeProtocol0 >= 4 && feeProtocol0 <= 10)) &&
                (feeProtocol1 == 0 || (feeProtocol1 >= 4 && feeProtocol1 <= 10)));
        
        uint8 feeProtocolOld = slot0.feeProtocol;
        slot0.feeProtocol = feeProtocol0 + (feeProtocol1 << 4);
        emit SetFeeProtocol(feeProtocolOld % 16, feeProtocolOld >> 4, feeProtocol0, feeProtocol1);
    }
    
    function collectProtocol(
        address recipient,
        uint128 amount0Requested,
        uint128 amount1Requested
    ) external override lock onlyFactoryOwner returns (uint128 amount0, uint128 amount1) {
        // Collect protocol fees
        // ... implementation details from decompiled code ...
    }
    
    function observe(uint32[] calldata secondsAgos)
        external
        view
        override
        returns (int56[] memory tickCumulatives, uint160[] memory secondsPerLiquidityCumulativeX128s)
    {
        // Get historical price observations
        // ... implementation details from decompiled code ...
    }
    
    function snapshotCumulativesInside(int24 tickLower, int24 tickUpper)
        external
        view
        override
        returns (
            int56 tickCumulativeInside,
            uint160 secondsPerLiquidityInsideX128,
            uint32 secondsInside
        )
    {
        // Get cumulative values inside a tick range
        // ... implementation details from decompiled code ...
    }
    
    // Helper functions
    function balance0() private view returns (uint256) {
        return IERC20(token0).balanceOf(address(this));
    }
    
    function balance1() private view returns (uint256) {
        return IERC20(token1).balanceOf(address(this));
    }
    
    function _blockTimestamp() internal view virtual returns (uint32) {
        return uint32(block.timestamp);
    }
    
    function _updateTicks(
        address recipient,
        int24 tickLower,
        int24 tickUpper,
        int24 tick,
        int128 liquidityDelta,
        bool upper
    ) private returns (bool flippedLower, bool flippedUpper) {
        // Update tick data when liquidity changes
        // ... implementation details from decompiled code ...
    }
}