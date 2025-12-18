// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UniswapV3PoolClone2 {
    // Identical structure to UniswapV3PoolClone
    address public factory;
    address public token0;
    address public token1;
    uint24 public fee;
    int24 public tickSpacing;
    uint128 public maxLiquidityPerTick;
}
