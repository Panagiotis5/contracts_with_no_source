// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.7.6;

/// @title Uniswap V3 Pool
/// @notice A Uniswap V3 pool for token0 (0x2a10d8d17aea89473f010e137de7e9826cc9277f) and token1 (0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2)
contract UniswapV3Pool {
    // Slot 0: Packed storage for pool state
    struct Slot0 {
        uint160 sqrtPriceX96;      // Current sqrt(price) as Q64.96
        int24 tick;                // Current tick
        uint16 observationIndex;   // Index of last oracle observation
        uint16 observationCardinality;    // Current cardinality of observations
        uint16 observationCardinalityNext; // Next cardinality of observations
        uint8 feeProtocol;         // Protocol fee for token0 (4 bits) and token1 (4 bits)
        bool unlocked;             // Whether pool is unlocked
    }
    Slot0 public slot0;
    
    // Global fee growth per unit of liquidity
    uint256 public feeGrowthGlobal0X128;
    uint256 public feeGrowthGlobal1X128;
    
    // Protocol fees collected
    struct ProtocolFees {
        uint128 token0;
        uint128 token1;
    }
    ProtocolFees public protocolFees;
    
    // Current liquidity in the pool
    uint128 public liquidity;
    
    // Tick management
    struct Tick {
        uint128 liquidityGross;    // Total liquidity referencing this tick
        int128 liquidityNet;       // Liquidity change when tick is crossed
        uint256 feeGrowthOutside0X128;  // Fee growth per unit of liquidity outside tick
        uint256 feeGrowthOutside1X128;
        int56 tickCumulativeOutside;   // Tick cumulative outside
        uint160 secondsPerLiquidityOutsideX128; // Seconds per liquidity outside
        uint32 secondsOutside;     // Seconds outside
        bool initialized;          // Whether tick is initialized
    }
    mapping(int24 => Tick) public ticks;
    
    // Tick bitmap for finding initialized ticks
    mapping(int16 => uint256) public tickBitmap;
    
    // Positions
    struct Position {
        uint128 liquidity;         // Liquidity provided by position
        uint256 feeGrowthInside0LastX128; // Fee growth per unit of liquidity last stored
        uint256 feeGrowthInside1LastX128;
        uint128 tokensOwed0;       // Tokens owed to position owner
        uint128 tokensOwed1;
    }
    mapping(bytes32 => Position) public positions;
    
    // Observations for TWAP oracle
    struct Observation {
        uint32 blockTimestamp;
        int56 tickCumulative;
        uint160 secondsPerLiquidityCumulativeX128;
        bool initialized;
    }
    Observation[] public observations;
    
    // Constants
    address public constant factory = 0x1f98431c8ad98523631ae4a59f267346ea31f984;
    address public constant token0 = 0x2a10d8d17aea89473f010e137de7e9826cc9277f;
    address public constant token1 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2;
    uint24 public constant fee = 10000;           // 1% fee (10000 = 1%)
    int24 public constant tickSpacing = 200;
    uint128 public constant maxLiquidityPerTick = type(uint128).max / 2; // Simplified
    
    // Events
    event Swap(
        address indexed sender,
        address indexed recipient,
        int256 amount0,
        int256 amount1,
        uint160 sqrtPriceX96,
        uint128 liquidity,
        int24 tick
    );
    
    event Mint(
        address sender,
        address indexed owner,
        int24 indexed tickLower,
        int24 indexed tickUpper,
        uint128 amount,
        uint256 amount0,
        uint256 amount1
    );
    
    event Burn(
        address indexed owner,
        int24 indexed tickLower,
        int24 indexed tickUpper,
        uint128 amount,
        uint256 amount0,
        uint256 amount1
    );
    
    event Collect(
        address indexed owner,
        address recipient,
        int24 indexed tickLower,
        int24 indexed tickUpper,
        uint128 amount0,
        uint128 amount1
    );
    
    event Flash(
        address indexed sender,
        address indexed recipient,
        uint256 amount0,
        uint256 amount1,
        uint256 paid0,
        uint256 paid1
    );
    
    event IncreaseObservationCardinalityNext(
        uint16 observationCardinalityNextOld,
        uint16 observationCardinalityNextNew
    );
    
    event SetFeeProtocol(uint8 feeProtocol0Old, uint8 feeProtocol1Old, uint8 feeProtocol0New, uint8 feeProtocol1New);
    
    event CollectProtocol(address indexed sender, address indexed recipient, uint128 amount0, uint128 amount1);
    
    event Initialize(uint160 sqrtPriceX96, int24 tick);
    
    /// @notice Modifier to prevent reentrancy
    modifier lock() {
        require(slot0.unlocked, "LOK");
        slot0.unlocked = false;
        _;
        slot0.unlocked = true;
    }
    
    /// @notice Called only once to initialize the pool
    function initialize(uint160 sqrtPriceX96) external {
        require(slot0.sqrtPriceX96 == 0, "AI");
        
        int24 tick = TickMath.getTickAtSqrtRatio(sqrtPriceX96);
        
        // Initialize observations
        observations.push(Observation({
            blockTimestamp: uint32(block.timestamp),
            tickCumulative: 0,
            secondsPerLiquidityCumulativeX128: 0,
            initialized: true
        }));
        
        slot0 = Slot0({
            sqrtPriceX96: sqrtPriceX96,
            tick: tick,
            observationIndex: 0,
            observationCardinality: 1,
            observationCardinalityNext: 1,
            feeProtocol: 0,
            unlocked: true
        });
        
        emit Initialize(sqrtPriceX96, tick);
    }
    
    /// @notice Swap token0 for token1 or vice versa
    function swap(
        address recipient,
        bool zeroForOne,
        int256 amountSpecified,
        uint160 sqrtPriceLimitX96,
        bytes calldata data
    ) external lock returns (int256 amount0, int256 amount1) {
        require(amountSpecified != 0, "AS");
        
        Slot0 memory _slot0 = slot0;
        
        // Validate price limits
        if (zeroForOne) {
            require(sqrtPriceLimitX96 < _slot0.sqrtPriceX96 && sqrtPriceLimitX96 > TickMath.MIN_SQRT_RATIO, "SPL");
        } else {
            require(sqrtPriceLimitX96 > _slot0.sqrtPriceX96 && sqrtPriceLimitX96 < TickMath.MAX_SQRT_RATIO, "SPL");
        }
        
        // Execute swap
        SwapState memory state = SwapState({
            amountSpecifiedRemaining: amountSpecified,
            amountCalculated: 0,
            sqrtPriceX96: _slot0.sqrtPriceX96,
            tick: _slot0.tick,
            feeGrowthGlobalX128: zeroForOne ? feeGrowthGlobal0X128 : feeGrowthGlobal1X128,
            protocolFee: 0,
            liquidity: liquidity
        });
        
        // Main swap loop
        while (state.amountSpecifiedRemaining != 0 && state.sqrtPriceX96 != sqrtPriceLimitX96) {
            StepComputations memory step;
            
            // Find next tick
            step.sqrtPriceStartX96 = state.sqrtPriceX96;
            (step.tickNext, step.initialized) = TickBitmap.nextInitializedTickWithinOneWord(
                state.tick,
                tickSpacing,
                zeroForOne
            );
            
            // Get sqrt price for next tick
            step.sqrtPriceNextX96 = TickMath.getSqrtRatioAtTick(step.tickNext);
            
            // Compute swap step
            (state.sqrtPriceX96, step.amountIn, step.amountOut, step.feeAmount) = SwapMath.computeSwapStep(
                state.sqrtPriceX96,
                (zeroForOne ? step.sqrtPriceNextX96 < sqrtPriceLimitX96 : step.sqrtPriceNextX96 > sqrtPriceLimitX96)
                    ? sqrtPriceLimitX96
                    : step.sqrtPriceNextX96,
                state.liquidity,
                state.amountSpecifiedRemaining
            );
            
            // Update amounts
            state.amountSpecifiedRemaining -= step.amountIn + step.feeAmount;
            state.amountCalculated += step.amountOut;
            
            // Update fee growth
            if (state.liquidity > 0) {
                uint256 feeGrowthGlobalDeltaX128 = FullMath.mulDiv(
                    step.feeAmount,
                    FixedPoint128.Q128,
                    state.liquidity
                );
                state.feeGrowthGlobalX128 += feeGrowthGlobalDeltaX128;
            }
            
            // Apply protocol fee
            if (step.feeAmount > 0) {
                uint256 _protocolFee = _slot0.feeProtocol;
                uint8 protocolFee = zeroForOne ? (_protocolFee % 16) : (_protocolFee >> 4);
                if (protocolFee > 0) {
                    uint256 delta = step.feeAmount / protocolFee;
                    step.feeAmount -= delta;
                    state.protocolFee += uint128(delta);
                }
            }
            
            // Cross tick if needed
            if (state.sqrtPriceX96 == step.sqrtPriceNextX96) {
                if (step.initialized) {
                    // Cross tick and update liquidity
                    int128 liquidityNet = ticks[step.tickNext].liquidityNet;
                    if (zeroForOne) liquidityNet = -liquidityNet;
                    state.liquidity = LiquidityMath.addDelta(state.liquidity, liquidityNet);
                    
                    // Update tick fee growth outside
                    if (zeroForOne) {
                        ticks[step.tickNext].feeGrowthOutside0X128 = state.feeGrowthGlobalX128 - ticks[step.tickNext].feeGrowthOutside0X128;
                    } else {
                        ticks[step.tickNext].feeGrowthOutside1X128 = state.feeGrowthGlobalX128 - ticks[step.tickNext].feeGrowthOutside1X128;
                    }
                }
                
                state.tick = zeroForOne ? step.tickNext - 1 : step.tickNext;
            } else if (state.sqrtPriceX96 != step.sqrtPriceStartX96) {
                state.tick = TickMath.getTickAtSqrtRatio(state.sqrtPriceX96);
            }
        }
        
        // Update global state
        if (state.tick != _slot0.tick) {
            // Write oracle observation
            (uint16 index, uint16 cardinality) = observations.write(
                _slot0.observationIndex,
                uint32(block.timestamp),
                _slot0.tick,
                liquidity,
                _slot0.observationCardinality,
                _slot0.observationCardinalityNext
            );
            
            slot0.observationIndex = index;
            slot0.observationCardinality = cardinality;
            slot0.tick = state.tick;
        }
        
        slot0.sqrtPriceX96 = state.sqrtPriceX96;
        
        // Update liquidity and fee growth
        if (liquidity != state.liquidity) liquidity = state.liquidity;
        if (zeroForOne) {
            feeGrowthGlobal0X128 = state.feeGrowthGlobalX128;
            if (state.protocolFee > 0) protocolFees.token0 += state.protocolFee;
        } else {
            feeGrowthGlobal1X128 = state.feeGrowthGlobalX128;
            if (state.protocolFee > 0) protocolFees.token1 += state.protocolFee;
        }
        
        // Determine amounts
        (amount0, amount1) = zeroForOne == (amountSpecified > 0)
            ? (amountSpecified - state.amountSpecifiedRemaining, state.amountCalculated)
            : (state.amountCalculated, amountSpecified - state.amountSpecifiedRemaining);
        
        // Transfer tokens and call callback
        if (zeroForOne) {
            if (amount1 < 0) TransferHelper.safeTransfer(token1, recipient, uint256(-amount1));
            uint256 balance1Before = IERC20(token1).balanceOf(address(this));
            IUniswapV3SwapCallback(msg.sender).uniswapV3SwapCallback(amount0, amount1, data);
            require(IERC20(token1).balanceOf(address(this)) - balance1Before >= uint256(-amount1), "IIA");
        } else {
            if (amount0 < 0) TransferHelper.safeTransfer(token0, recipient, uint256(-amount0));
            uint256 balance0Before = IERC20(token0).balanceOf(address(this));
            IUniswapV3SwapCallback(msg.sender).uniswapV3SwapCallback(amount0, amount1, data);
            require(IERC20(token0).balanceOf(address(this)) - balance0Before >= uint256(-amount0), "IIA");
        }
        
        emit Swap(msg.sender, recipient, amount0, amount1, state.sqrtPriceX96, state.liquidity, state.tick);
    }
    
    /// @notice Add liquidity to a position
    function mint(
        address recipient,
        int24 tickLower,
        int24 tickUpper,
        uint128 amount,
        bytes calldata data
    ) external lock returns (uint256 amount0, uint256 amount1) {
        require(amount > 0, "A");
        
        // Update position and tick data
        (, int256 amount0Int, int256 amount1Int) = _modifyPosition(
            ModifyPositionParams({
                owner: recipient,
                tickLower: tickLower,
                tickUpper: tickUpper,
                liquidityDelta: int256(amount).toInt128()
            })
        );
        
        amount0 = uint256(amount0Int);
        amount1 = uint256(amount1Int);
        
        // Get current balances
        uint256 balance0Before;
        uint256 balance1Before;
        if (amount0 > 0) balance0Before = IERC20(token0).balanceOf(address(this));
        if (amount1 > 0) balance1Before = IERC20(token1).balanceOf(address(this));
        
        // Call callback
        IUniswapV3MintCallback(msg.sender).uniswapV3MintCallback(amount0, amount1, data);
        
        // Check balances
        if (amount0 > 0) require(IERC20(token0).balanceOf(address(this)) - balance0Before >= amount0, "M0");
        if (amount1 > 0) require(IERC20(token1).balanceOf(address(this)) - balance1Before >= amount1, "M1");
        
        emit Mint(msg.sender, recipient, tickLower, tickUpper, amount, amount0, amount1);
    }
    
    /// @notice Remove liquidity from a position
    function burn(
        int24 tickLower,
        int24 tickUpper,
        uint128 amount
    ) external lock returns (uint256 amount0, uint256 amount1) {
        (bytes32 positionKey, int256 amount0Int, int256 amount1Int) = _modifyPosition(
            ModifyPositionParams({
                owner: msg.sender,
                tickLower: tickLower,
                tickUpper: tickUpper,
                liquidityDelta: -int256(amount).toInt128()
            })
        );
        
        amount0 = uint256(-amount0Int);
        amount1 = uint256(-amount1Int);
        
        if (amount0 > 0 || amount1 > 0) {
            // Add tokens owed to position
            Position storage position = positions[positionKey];
            position.tokensOwed0 += uint128(amount0);
            position.tokensOwed1 += uint128(amount1);
        }
        
        emit Burn(msg.sender, tickLower, tickUpper, amount, amount0, amount1);
    }
    
    /// @notice Collect tokens owed to a position
    function collect(
        address recipient,
        int24 tickLower,
        int24 tickUpper,
        uint128 amount0Requested,
        uint128 amount1Requested
    ) external lock returns (uint128 amount0, uint128 amount1) {
        // Get position
        bytes32 positionKey = keccak256(abi.encodePacked(msg.sender, tickLower, tickUpper));
        Position storage position = positions[positionKey];
        
        // Update fees owed
        _updatePosition(position, tickLower, tickUpper);
        
        // Calculate amounts to collect
        amount0 = amount0Requested > position.tokensOwed0 ? position.tokensOwed0 : amount0Requested;
        amount1 = amount1Requested > position.tokensOwed1 ? position.tokensOwed1 : amount1Requested;
        
        // Update position
        if (amount0 > 0) position.tokensOwed0 -= amount0;
        if (amount1 > 0) position.tokensOwed1 -= amount1;
        
        // Transfer tokens
        if (amount0 > 0) TransferHelper.safeTransfer(token0, recipient, amount0);
        if (amount1 > 0) TransferHelper.safeTransfer(token1, recipient, amount1);
        
        emit Collect(msg.sender, tickLower, tickUpper, recipient, amount0, amount1);
    }
    
    /// @notice Flash loan tokens
    function flash(
        address recipient,
        uint256 amount0,
        uint256 amount1,
        bytes calldata data
    ) external lock {
        require(liquidity > 0, "L");
        
        // Calculate fees
        uint256 fee0 = FullMath.mulDivRoundingUp(amount0, fee, 1e6);
        uint256 fee1 = FullMath.mulDivRoundingUp(amount1, fee, 1e6);
        
        // Get current balances
        uint256 balance0Before = IERC20(token0).balanceOf(address(this));
        uint256 balance1Before = IERC20(token1).balanceOf(address(this));
        
        // Transfer tokens to recipient
        if (amount0 > 0) TransferHelper.safeTransfer(token0, recipient, amount0);
        if (amount1 > 0) TransferHelper.safeTransfer(token1, recipient, amount1);
        
        // Call callback
        IUniswapV3FlashCallback(msg.sender).uniswapV3FlashCallback(fee0, fee1, data);
        
        // Check balances and collect fees
        uint256 balance0After = IERC20(token0).balanceOf(address(this));
        uint256 balance1After = IERC20(token1).balanceOf(address(this));
        
        require(balance0After - balance0Before >= fee0, "F0");
        require(balance1After - balance1Before >= fee1, "F1");
        
        // Distribute fees
        if (balance0After - balance0Before > 0) {
            uint8 feeProtocol0 = slot0.feeProtocol % 16;
            uint256 fees0 = balance0After - balance0Before;
            if (feeProtocol0 > 0) {
                uint256 protocolFees0 = fees0 / feeProtocol0;
                if (protocolFees0 > 0) protocolFees.token0 += uint128(protocolFees0);
                fees0 -= protocolFees0;
            }
            feeGrowthGlobal0X128 += FullMath.mulDiv(fees0, FixedPoint128.Q128, liquidity);
        }
        
        if (balance1After - balance1Before > 0) {
            uint8 feeProtocol1 = slot0.feeProtocol >> 4;
            uint256 fees1 = balance1After - balance1Before;
            if (feeProtocol1 > 0) {
                uint256 protocolFees1 = fees1 / feeProtocol1;
                if (protocolFees1 > 0) protocolFees.token1 += uint128(protocolFees1);
                fees1 -= protocolFees1;
            }
            feeGrowthGlobal1X128 += FullMath.mulDiv(fees1, FixedPoint128.Q128, liquidity);
        }
        
        emit Flash(msg.sender, recipient, amount0, amount1, balance0After - balance0Before, balance1After - balance1Before);
    }
    
    /// @notice Increase maximum number of observations
    function increaseObservationCardinalityNext(uint16 observationCardinalityNext) external lock {
        uint16 observationCardinalityNextOld = slot0.observationCardinalityNext;
        uint16 observationCardinalityNextNew = observationCardinalityNext > observationCardinalityNextOld
            ? observationCardinalityNext
            : observationCardinalityNextOld;
        
        if (observationCardinalityNextNew != observationCardinalityNextOld) {
            slot0.observationCardinalityNext = observationCardinalityNextNew;
            if (observationCardinalityNextOld > 0) {
                emit IncreaseObservationCardinalityNext(observationCardinalityNextOld, observationCardinalityNextNew);
            }
        }
    }
    
    /// @notice Set protocol fee
    function setFeeProtocol(uint8 feeProtocol0, uint8 feeProtocol1) external {
        require(msg.sender == IUniswapV3Factory(factory).owner(), "UA");
        require(
            (feeProtocol0 == 0 || (feeProtocol0 >= 4 && feeProtocol0 <= 10)) &&
            (feeProtocol1 == 0 || (feeProtocol1 >= 4 && feeProtocol1 <= 10))
        );
        
        uint8 feeProtocolOld = slot0.feeProtocol;
        slot0.feeProtocol = feeProtocol0 + (feeProtocol1 << 4);
        
        emit SetFeeProtocol(feeProtocolOld % 16, feeProtocolOld >> 4, feeProtocol0, feeProtocol1);
    }
    
    /// @notice Collect protocol fees
    function collectProtocol(address recipient, uint128 amount0Requested, uint128 amount1Requested)
        external
        returns (uint128 amount0, uint128 amount1)
    {
        require(msg.sender == IUniswapV3Factory(factory).owner(), "UA");
        
        amount0 = amount0Requested > protocolFees.token0 ? protocolFees.token0 : amount0Requested;
        amount1 = amount1Requested > protocolFees.token1 ? protocolFees.token1 : amount1Requested;
        
        if (amount0 > 0) {
            if (amount0 == protocolFees.token0) amount0--;
            protocolFees.token0 -= amount0;
            TransferHelper.safeTransfer(token0, recipient, amount0);
        }
        if (amount1 > 0) {
            if (amount1 == protocolFees.token1) amount1--;
            protocolFees.token1 -= amount1;
            TransferHelper.safeTransfer(token1, recipient, amount1);
        }
        
        emit CollectProtocol(msg.sender, recipient, amount0, amount1);
    }
    
    // Internal helper functions (simplified from decompiled code)
    
    struct ModifyPositionParams {
        address owner;
        int24 tickLower;
        int24 tickUpper;
        int128 liquidityDelta;
    }
    
    function _modifyPosition(ModifyPositionParams memory params)
        internal
        returns (
            bytes32 positionKey,
            int256 amount0,
            int256 amount1
        )
    {
        // Validate ticks
        require(params.tickLower < params.tickUpper, "TLU");
        require(params.tickLower >= TickMath.MIN_TICK, "TLM");
        require(params.tickUpper <= TickMath.MAX_TICK, "TUM");
        
        // Update position and ticks
        positionKey = keccak256(abi.encodePacked(params.owner, params.tickLower, params.tickUpper));
        Position storage position = positions[positionKey];
        
        // Update position liquidity and collect fees
        _updatePosition(position, params.tickLower, params.tickUpper);
        
        // Update ticks if adding liquidity
        if (params.liquidityDelta != 0) {
            // Update lower tick
            bool flippedLower = _updateTick(
                params.tickLower,
                params.liquidityDelta,
                slot0.tick,
                feeGrowthGlobal0X128,
                feeGrowthGlobal1X128
            );
            
            // Update upper tick
            bool flippedUpper = _updateTick(
                params.tickUpper,
                params.liquidityDelta,
                slot0.tick,
                feeGrowthGlobal0X128,
                feeGrowthGlobal1X128
            );
            
            // Update tick bitmap if necessary
            if (flippedLower) {
                TickBitmap.flipTick(_tickBitmap, params.tickLower, tickSpacing);
            }
            if (flippedUpper) {
                TickBitmap.flipTick(_tickBitmap, params.tickUpper, tickSpacing);
            }
        }
        
        // Calculate amounts
        (amount0, amount1) = LiquidityAmounts.getAmountsForLiquidity(
            slot0.sqrtPriceX96,
            TickMath.getSqrtRatioAtTick(params.tickLower),
            TickMath.getSqrtRatioAtTick(params.tickUpper),
            params.liquidityDelta
        );
        
        // Update position liquidity
        if (params.liquidityDelta != 0) {
            if (params.liquidityDelta < 0) {
                require(position.liquidity >= uint128(-params.liquidityDelta), "LS");
            }
            position.liquidity = LiquidityMath.addDelta(position.liquidity, params.liquidityDelta);
        }
        
        // Update global liquidity if current tick is inside range
        if (slot0.tick < params.tickUpper && slot0.tick >= params.tickLower) {
            liquidity = LiquidityMath.addDelta(liquidity, params.liquidityDelta);
        }
    }
    
    function _updatePosition(
        Position storage position,
        int24 tickLower,
        int24 tickUpper
    ) internal {
        // Get fee growth inside position range
        (uint256 feeGrowthInside0X128, uint256 feeGrowthInside1X128) = Tick.getFeeGrowthInside(
            ticks,
            tickLower,
            tickUpper,
            slot0.tick,
            feeGrowthGlobal0X128,
            feeGrowthGlobal1X128
        );
        
        // Update position tokens owed
        uint128 tokensOwed0 = uint128(
            FullMath.mulDiv(
                feeGrowthInside0X128 - position.feeGrowthInside0LastX128,
                position.liquidity,
                FixedPoint128.Q128
            )
        );
        uint128 tokensOwed1 = uint128(
            FullMath.mulDiv(
                feeGrowthInside1X128 - position.feeGrowthInside1LastX128,
                position.liquidity,
                FixedPoint128.Q128
            )
        );
        
        if (tokensOwed0 > 0 || tokensOwed1 > 0) {
            position.tokensOwed0 += tokensOwed0;
            position.tokensOwed1 += tokensOwed1;
        }
        
        // Update fee growth inside tracking
        position.feeGrowthInside0LastX128 = feeGrowthInside0X128;
        position.feeGrowthInside1LastX128 = feeGrowthInside1X128;
    }
    
    function _updateTick(
        int24 tick,
        int128 liquidityDelta,
        int24 currentTick,
        uint256 feeGrowthGlobal0X128_,
        uint256 feeGrowthGlobal1X128_
    ) internal returns (bool flipped) {
        Tick storage tickData = ticks[tick];
        
        // Update liquidity
        uint128 liquidityGrossBefore = tickData.liquidityGross;
        uint128 liquidityGrossAfter = LiquidityMath.addDelta(liquidityGrossBefore, liquidityDelta);
        require(liquidityGrossAfter <= maxLiquidityPerTick, "LO");
        
        flipped = (liquidityGrossAfter == 0) != (liquidityGrossBefore == 0);
        
        if (liquidityGrossBefore == 0) {
            // Initialize tick if needed
            if (tick <= currentTick) {
                tickData.feeGrowthOutside0X128 = feeGrowthGlobal0X128_;
                tickData.feeGrowthOutside1X128 = feeGrowthGlobal1X128_;
                tickData.initialized = true;
            }
        }
        
        tickData.liquidityGross = liquidityGrossAfter;
        tickData.liquidityNet = liquidityDelta > 0
            ? tickData.liquidityNet + liquidityDelta
            : tickData.liquidityNet - uint128(-liquidityDelta);
    }
}

// Interfaces and helper libraries (simplified versions)
interface IUniswapV3SwapCallback {
    function uniswapV3SwapCallback(int256 amount0Delta, int256 amount1Delta, bytes calldata data) external;
}

interface IUniswapV3MintCallback {
    function uniswapV3MintCallback(uint256 amount0Owed, uint256 amount1Owed, bytes calldata data) external;
}

interface IUniswapV3FlashCallback {
    function uniswapV3FlashCallback(uint256 fee0, uint256 fee1, bytes calldata data) external;
}

interface IUniswapV3Factory {
    function owner() external view returns (address);
}

library TickMath {
    int24 internal constant MIN_TICK = -887272;
    int24 internal constant MAX_TICK = -MIN_TICK;
    uint160 internal constant MIN_SQRT_RATIO = 4295128739;
    uint160 internal constant MAX_SQRT_RATIO = 1461446703485210103287273052203988822378723970342;
    
    function getTickAtSqrtRatio(uint160 sqrtPriceX96) internal pure returns (int24 tick) {
        // Simplified implementation
    }
    
    function getSqrtRatioAtTick(int24 tick) internal pure returns (uint160 sqrtPriceX96) {
        // Simplified implementation
    }
}

library FullMath {
    function mulDiv(uint256 a, uint256 b, uint256 denominator) internal pure returns (uint256 result) {
        // Simplified implementation
    }
    
    function mulDivRoundingUp(uint256 a, uint256 b, uint256 denominator) internal pure returns (uint256 result) {
        // Simplified implementation
    }
}

library LiquidityMath {
    function addDelta(uint128 x, int128 y) internal pure returns (uint128 z) {
        // Simplified implementation
    }
}

library LiquidityAmounts {
    function getAmountsForLiquidity(
        uint160 sqrtRatioX96,
        uint160 sqrtRatioAX96,
        uint160 sqrtRatioBX96,
        int128 liquidityDelta
    ) internal pure returns (int256 amount0, int256 amount1) {
        // Simplified implementation
    }
}

library TickBitmap {
    function nextInitializedTickWithinOneWord(
        int24 tick,
        int24 tickSpacing,
        bool lte
    ) internal view returns (int24 next, bool initialized) {
        // Simplified implementation
    }
    
    function flipTick(mapping(int16 => uint256) storage self, int24 tick, int24 tickSpacing) internal {
        // Simplified implementation
    }
}

library Tick {
    function getFeeGrowthInside(
        mapping(int24 => Tick) storage self,
        int24 tickLower,
        int24 tickUpper,
        int24 tickCurrent,
        uint256 feeGrowthGlobal0X128,
        uint256 feeGrowthGlobal1X128
    ) internal view returns (uint256 feeGrowthInside0X128, uint256 feeGrowthInside1X128) {
        // Simplified implementation
    }
}

library SwapMath {
    function computeSwapStep(
        uint160 sqrtRatioCurrentX96,
        uint160 sqrtRatioTargetX96,
        uint128 liquidity,
        int256 amountRemaining
    ) internal pure returns (
        uint160 sqrtRatioNextX96,
        uint256 amountIn,
        uint256 amountOut,
        uint256 feeAmount
    ) {
        // Simplified implementation
    }
}

library TransferHelper {
    function safeTransfer(address token, address to, uint256 value) internal {
        // Simplified implementation
    }
}

library FixedPoint128 {
    uint256 internal constant Q128 = 0x100000000000000000000000000000000;
}