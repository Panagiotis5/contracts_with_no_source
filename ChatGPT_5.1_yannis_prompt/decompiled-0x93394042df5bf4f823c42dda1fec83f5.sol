// Decompiled by library.dedaub.com
// 2025.12.17 08:49 UTC
// Compiled using the solidity compiler version 0.8.28





function 0x1c2d(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint8 varg4) private { 
    v0 = keccak256(varg3, varg2);
    if (0 - varg4) {
        if (1 - varg4) {
            if (3 - varg4) {
                if (4 - varg4) {
                    v1 = v2 = 0;
                } else {
                    v1 = v3 = address(keccak256(0xff41ff9aa7e16b8b1a8a8dc4f0efacd93d02d071c90000000000000000000000, v0, 0x6ce8eb472fa82df5469c6ab6d485f17c3ad13c8cd7af59b3d4a8026c5ce0f7e2));
                    MEM[64] = MEM[64];
                }
            } else {
                v1 = v4 = address(keccak256(0xff1f98431c8ad98523631ae4a59f267346ea31f9840000000000000000000000, v0, 0xe34f199b19b2b4f47f68442619d555527d244f78a3297ea89325f843f87b8b54));
                MEM[64] = MEM[64];
            }
        } else {
            v1 = v5 = address(keccak256(0xffc0aee478e3658e2610c5f7a4a2e1777ce9e4f2ac0000000000000000000000, v0, 0xe18a34eb0e04b04f7a0ac29a6e80748dca96319b42c54d679cb821dca90c6303));
            MEM[64] = MEM[64];
        }
    } else {
        v1 = v6 = address(keccak256(0xff5c69bee701ef814a2b6a3edd4b1652cb9cc5aa6f0000000000000000000000, v0, 0x96e8ac4277198ff8b6f785478aa9a39f403cb768dd02cbee326c3e7da348845f));
    }
    v7 = v1.getReserves().gas(msg.gas);
    require(v7);
    if (varg0) {
        v8 = v9 = 0x3358(uint112(MEM[32]), uint112(MEM[0]), varg1);
    } else {
        v8 = v10 = 0x3358(uint112(MEM[0]), uint112(MEM[32]), varg1);
    }
    if (!varg0) {
        0x3385(0, v8, varg1, varg2, v1);
    } else {
        0x3385(v8, 0, varg1, varg3, v1);
    }
    return v8;
}

function 0x1cc2(uint256 varg0, uint256 varg1, uint256 varg2, uint16 varg3, uint256 varg4, uint256 varg5, uint256 varg6) private { 
    v0 = keccak256(varg5, varg4, varg3);
    if (0 - uint8(varg6)) {
        if (1 - uint8(varg6)) {
            if (3 - uint8(varg6)) {
                if (4 - uint8(varg6)) {
                    v1 = v2 = 0;
                } else {
                    v1 = v3 = address(keccak256(0xff41ff9aa7e16b8b1a8a8dc4f0efacd93d02d071c90000000000000000000000, v0, 0x6ce8eb472fa82df5469c6ab6d485f17c3ad13c8cd7af59b3d4a8026c5ce0f7e2));
                    MEM[64] = MEM[64];
                }
            } else {
                v1 = v4 = address(keccak256(0xff1f98431c8ad98523631ae4a59f267346ea31f9840000000000000000000000, v0, 0xe34f199b19b2b4f47f68442619d555527d244f78a3297ea89325f843f87b8b54));
                MEM[64] = MEM[64];
            }
        } else {
            v1 = v5 = address(keccak256(0xffc0aee478e3658e2610c5f7a4a2e1777ce9e4f2ac0000000000000000000000, v0, 0xe18a34eb0e04b04f7a0ac29a6e80748dca96319b42c54d679cb821dca90c6303));
            MEM[64] = MEM[64];
        }
    } else {
        v1 = v6 = address(keccak256(0xff5c69bee701ef814a2b6a3edd4b1652cb9cc5aa6f0000000000000000000000, v0, 0x96e8ac4277198ff8b6f785478aa9a39f403cb768dd02cbee326c3e7da348845f));
    }
    MEM[MEM[64] + 32] = address(varg5);
    MEM[MEM[64] + 64] = address(varg4);
    MEM[MEM[64] + 96] = varg3;
    if (varg1) {
        v7 = v8 = 3;
    } else {
        v7 = v9 = 2;
    }
    v10 = v11 = 0;
    while (v10 < 96) {
        MEM[v10 + (32 + MEM[64])] = MEM[v10 + (MEM[64] + 32)];
        v10 += 32;
    }
    MEM[128 + MEM[64]] = 0;
    MEM[32 + MEM[64] + 96] = bytes1(varg6 << 248);
    v12 = v13 = 0;
    while (v12 < MEM[v7]) {
        MEM[v12 + (32 + MEM[64] + 96 + 1)] = MEM[v12 + (v7 + 32)];
        v12 += 32;
    }
    MEM[MEM[v7] + (32 + MEM[64] + 96 + 1)] = 0;
    v14 = 1 + (MEM[v7] + (32 + MEM[64] + 96));
    if (!varg0) {
        varg2 = v15 = 0;
        v16 = v17 = 0xfffd8963efd1fc6a506488495d951d5263988d25;
        if (varg1) {
            v16 = v18 = 0x1000276a4;
        }
        if (v14 - MEM[64] - 32) {
            v19 = v20 = 0;
            while (v19 < v14 - MEM[64] - 32) {
                MEM[v19 + 196] = MEM[v19 + (MEM[64] + 32)];
                v19 += 32;
            }
        }
        v21 = v1.swap(this, varg1, varg2, v16, 160, v14 - MEM[64] - 32).gas(msg.gas);
        require(v21);
        if (varg1) {
            varg2 = v22 = 0 - MEM[32];
        }
        if (!varg1) {
            varg2 = v23 = 0 - MEM[0];
        }
        MEM[64] = v14;
    } else {
        v24 = v25 = 0xfffd8963efd1fc6a506488495d951d5263988d25;
        if (varg1) {
            v24 = v26 = 0x1000276a4;
        }
        if (v14 - MEM[64] - 32) {
            v27 = v28 = 0;
            while (v27 < v14 - MEM[64] - 32) {
                MEM[v27 + 196] = MEM[v27 + (MEM[64] + 32)];
                v27 += 32;
            }
        }
        v29 = v1.swap(this, varg1, 0 - varg2, v24, 160, v14 - MEM[64] - 32).gas(msg.gas);
        require(v29);
        MEM[64] = v14;
    }
    return varg2;
}

function 0x2479(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5) private { 
    v0 = v1 = 0;
    v0 = v2 = 0x3825(varg4, varg5);
    v0 = v3 = 0;
    v0 = v4 = 9364;
    v0 = v5 = 0x3825(varg3, varg5);
    if (address(v0) + 0xffffffffffffffffffffffff1111111111111111111111111111111111111112) {
        v0 = v6 = 9842;
        0x8a8(v0, v0, v0);
        if (!v0) {
            v7 = address(v0);
            require(bool(v7.code.size));
            v8 = v7.setMetaGold(v0, v0, v0, v0).gas(msg.gas);
            require(bool(v8), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        } else {
            v9 = int128(v0);
            v10 = address(v0);
            require(bool(v10.code.size));
            v11 = v10.exchange(int128(v0), v9, v0, v0).gas(msg.gas);
            require(bool(v11), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        }
    } else {
        require(this.balance >= v0, Error('Insufficient ETH balance'));
        require(!v0, Error("Stable pools don't support native ETH. Use WETH instead."));
        require(bool((address(v0)).code.size));
        v12 = address(v0).setMetaGold(v0, v0, v0, v0).value(v0).gas(msg.gas);
        require(bool(v12), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
    v13 = 0xd68(this, v0);
    return v13, v0, v0, v0, v0, varg5;
    v0 = v14 = 0;
    while (1) {
        if (v0 < 8) {
            v15 = address(v0).coins(v0).gas(msg.gas);
            if (!v15) {
                if (v15) {
                    v16 = 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == address(v0);
                    if (v16) {
                        v16 = v17 = 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == address(v0);
                        if (0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee != address(v0)) {
                            v16 = v18 = !address(v0);
                        }
                    }
                    if (!v16) {
                        if (address(v0) - address(v0)) {
                            v0 = v19 = 1 + v0;
                        }
                    }
                    return v0, v0, v0, v0, v0, v0;
                }
            } else {
                break;
            }
        }
        revert(Error('Token not found in pool'));
    }
}

function 0x27c3(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4) private { 
    if (varg1) {
        v0 = v1 = 0xffff9a5889f795069a41a8a3;
    } else {
        v0 = v2 = 0x400065a8177fae27;
    }
    MEM[64] += 260;
    varg0 = v3 = 0;
    v4 = v5 = !varg1;
    if (!bool(varg1)) {
        v4 = v6 = !address(varg4);
    }
    if (!v4) {
        if (!varg1) {
        }
        MEM[4] = 0;
        v7 = varg3.approve(0x9995855c00494d039ab6792f18e368e530dff931, varg0).gas(msg.gas);
        MEM[64] = MEM[64];
        if (!v7) {
            MEM[4] = 0;
            v8 = varg3.approve(0x9995855c00494d039ab6792f18e368e530dff931, 0).gas(msg.gas);
            MEM[4] = 0;
            v9 = varg3.approve(0x9995855c00494d039ab6792f18e368e530dff931, varg0).gas(msg.gas);
        }
    } else {
        v10 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(varg0).gas(msg.gas);
        require(v10, Error('Failed to withdraw WETH'));
    }
    v11 = v12 = 0;
    while (v11 < 228) {
        MEM[v11 + MEM[64]] = MEM[v11 + (MEM[64] + 32)];
        v11 += 32;
    }
    MEM[228 + MEM[64]] = 0;
    v13, /* uint256 */ v14, /* uint256 */ v15, /* uint256 */ v16 = address(0x9995855c00494d039ab6792f18e368e530dff931).call(bytes4(0x6b81a1500000000000000000000000000000000000000000000000000000000) | uint224(address(varg4)), address(varg4), bytes4(0x6b81a1500000000000000000000000000000000000000000000000000000000) | uint224(address(varg4)), address(varg3), varg2, bool(varg1), varg0, uint96(v0), 0).value(varg0).gas(msg.gas);
    if (RETURNDATASIZE() == 0) {
        v17 = v18 = 96;
    } else {
        v17 = v19 = new bytes[](RETURNDATASIZE());
        v14 = v19.data;
        RETURNDATACOPY(v14, 0, RETURNDATASIZE());
    }
    if (v13) {
        require(v16 + MEM[v17] - v16 >= 64);
        require(MEM[v16] == int128(MEM[v16]));
        require(MEM[v16 + 32] == int128(MEM[v16 + 32]));
        if (!varg1) {
            v20 = 0x3f79(MEM[v16 + 32]);
            v21 = v22 = uint128(v20);
        } else {
            v23 = 0x3f79(MEM[v16]);
            v21 = v24 = uint128(v23);
        }
        if (varg1) {
            varg1 = v25 = !address(varg4);
        }
        if (varg1) {
            v26 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.deposit().value(v21).gas(msg.gas);
            require(v26, Error('Failed to deposit ETH'));
        }
        return v21;
    } else {
        require(!MEM[v17], v15, MEM[v17]);
        revert(Error('Failed to swap on Ekubo'));
    }
}

function 0x2bb1(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4) private { 
    if (address(varg3) >= address(varg2)) {
    }
    if (address(varg3) + 0xffffffffffffffffffffffff1111111111111111111111111111111111111112) {
        0x8a8(varg1, varg4, varg3);
        v0 = address(varg3) == address(varg3);
        v1, /* uint256 */ v2 = address(varg4).swapIn(v0, varg1, varg0, this).gas(msg.gas);
        require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    } else {
        v3 = 0xd68(this, varg3);
        if (v3 < varg1) {
            v4 = _SafeSub(varg1, v3);
            v5 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(v4).gas(msg.gas);
        }
        require(this.balance >= varg1, Error('Insufficient ETH balance'));
        v6, /* uint256 */ v2 = address(varg4).swapIn(0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == address(varg3), varg1, varg0, this).value(varg1).gas(msg.gas);
        require(bool(v6), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    }
    if (!(address(varg2) + 0xffffffffffffffffffffffff1111111111111111111111111111111111111112)) {
        v7 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.deposit().value(v2).gas(msg.gas);
        require(v7, Error('Failed to deposith ETH on Fluid swap', 'Failed to deposith ETH on Fluid swap'));
    }
    return v2;
}

function 0x3358(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    require(!(!varg2 | (!varg1 | !varg0)));
    return varg2 * varg0 * 997 / (1000 * varg1 + 997 * varg2);
}

function 0x3385(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4) private { 
    MEM[4] = 0;
    v0 = varg3.transfer(varg4, varg2).gas(msg.gas);
    v1 = varg4.swap(varg1, varg0, this, 128, 0).gas(msg.gas);
    require(v1, Error('Failed to swap token'));
    return ;
}

function 0x35dd(uint256 varg0, address varg1, address varg2, uint256 varg3) private { 
    0x8a8(uint256.max, 0x22d473030f116ddee9f6b43ac78ba3, varg3);
    v0 = 0x3fd0(block.timestamp, varg0);
    require(bool(0x22d473030f116ddee9f6b43ac78ba3.code.size));
    v1 = 0x22d473030f116ddee9f6b43ac78ba3.approve(address(varg3), varg2, varg1, uint48(v0)).gas(msg.gas);
    require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    return ;
}

function 0x36d9(int24 varg0, uint24 varg1, address varg2, address varg3) private { 
    MEM[MEM[64]] = 0;
    MEM[MEM[64] + 32] = 0;
    MEM[MEM[64] + 64] = 0;
    MEM[MEM[64] + 96] = 0;
    MEM[MEM[64] + 128] = 0;
    if (varg3 >= varg2) {
        v0 = v1 = new struct(5);
        v1.word0 = varg2;
        v1.word1 = varg3;
        v1.word2 = varg1;
        v1.word3 = varg0;
        v1.word4 = address(0x0);
        v2 = v3 = 0;
    } else {
        v0 = v4 = new struct(5);
        v4.word0 = varg3;
        v4.word1 = varg2;
        v4.word2 = varg1;
        v4.word3 = varg0;
        v4.word4 = address(0x0);
        v2 = v5 = 1;
    }
    return v2, v0;
}

function 0x3825(uint256 varg0, uint256 varg1) private { 
    varg1 = v0 = 0;
    while (1) {
        if (varg1 < 8) {
            v1, /* uint256 */ varg1 = address(varg1).coins(varg1).gas(msg.gas);
            if (v1) {
                require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                require(varg1 == address(varg1));
                v1 = v2 = 1;
            }
            if (v1) {
                v3 = 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == address(varg1);
                if (v3) {
                    v3 = v4 = 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == address(varg1);
                    if (0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee != address(varg1)) {
                        v3 = v5 = !address(varg1);
                    }
                }
                if (!v3) {
                    if (address(varg1) - address(varg1)) {
                        varg1 += 1;
                    } else {
                        break;
                    }
                } else {
                    break;
                }
                return varg1;
            }
        }
        revert(Error('Token not found in pool'));
    }
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= varg1 + varg0, Panic(17)); // arithmetic overflow or underflow
    return varg1 + varg0;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require((varg1 == varg1 * varg0 / varg0) | !varg0, Panic(17)); // arithmetic overflow or underflow
    return varg1 * varg0;
}

function _SafeDiv(uint256 varg0, uint256 varg1) private { 
    require(varg1, Panic(18)); // division by zero
    return varg0 / varg1;
}

function 0x3d05(uint256 varg0) private { 
    require(varg0 - uint256.max, Panic(17)); // arithmetic overflow or underflow
    return 1 + varg0;
}

function 0x3f79(int128 varg0) private { 
    require(varg0 - int128.min, Panic(17)); // arithmetic overflow or underflow
    return 0 - varg0;
}

function 0x3fd0(uint48 varg0, uint48 varg1) private { 
    require(varg1 + varg0 <= uint48.max, Panic(17)); // arithmetic overflow or underflow
    return varg1 + varg0;
}

function 0x73a(uint256 varg0) private { 
    MEM[MEM[64]] = 0;
    0xce6(MEM[64], 10 ** 20, 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
    v0 = v1 = msg.data[32] >> 96;
    v2 = v3 = msg.data[52] >> 96;
    v4 = v5 = msg.data[72] >> 96;
    v4 = v6 = msg.data[92] >> 96;
    v0 = v7 = msg.data[112];
    v0 = v8 = 0xd68(v1, v3);
    v9 = v3.transferFrom(v1, this, v8).gas(msg.gas);
    0x8dc(v8, 144);
    MEM[4] = 0;
    v10 = v6.transfer(v5, v7).gas(msg.gas);
    require(v10, Error('Failed to repay borrow token'));
    v2 = v11 = 2097;
    v4 = v12 = 1;
    0xec3(v1, v5, v12, v11);
    return v5, v3, v1, varg0, v4;
    require(10 <= v4 + 10, Panic(17)); // arithmetic overflow or underflow
    return v4 + 10, 3807, 0, msg.data[v4] >> 176, v0, v4, v4, v2, v0;
}

function 0x839() private { 
    v0 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.deposit().value(msg.value).gas(msg.gas);
    require(v0, Error('Faild to deposit ETH'));
    return ;
}

function 0x8a8(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    MEM[4] = 0;
    v0 = varg2.approve(varg1, varg0).gas(msg.gas);
    MEM[64] = MEM[64];
    if (!v0) {
        MEM[4] = 0;
        v1 = varg2.approve(varg1, 0).gas(msg.gas);
        MEM[4] = 0;
        v2 = varg2.approve(varg1, varg0).gas(msg.gas);
    }
    return ;
}

function 0x8dc(uint256 varg0, uint256 varg1) private { 
    while (1) {
        v0 = _SafeAdd(40, v1);
        if (v0 >= msg.data.length) {
            return ;
        } else {
            v2 = 0x3d05(v1);
            v1 = v3 = 0x3f & (byte(msg.data[v1], 0x0)) >> 2;
            v1 = v4 = (byte(msg.data[v1], 0x0)) & 0x2;
            v5 = v6 = (byte(msg.data[v1], 0x0)) & 0x1;
            v7 = v8 = !v3;
            if (v3) {
                v7 = 1 == uint8(v3);
            }
            if (!v7) {
                v9 = v10 = 3 == uint8(v3);
                if (3 != uint8(v3)) {
                    v9 = 4 == uint8(v3);
                }
                if (!v9) {
                    if (5 - uint8(v3)) {
                        if (6 - uint8(v3)) {
                            if (15 - uint8(v3)) {
                                if (16 - uint8(v3)) {
                                    if (18 - uint8(v3)) {
                                        if (19 - uint8(v3)) {
                                            if (20 - uint8(v3)) {
                                                require(!(21 - uint8(v3)), Error('Invalid Dex'));
                                                v11 = _SafeAdd(v2, 20);
                                                v12 = _SafeAdd(v11, 20);
                                                v13 = _SafeAdd(1 + (v12 + (uint8.max + 1 - (byte(msg.data[v12], 0x0)) >> 3)), 3);
                                                CALLDATACOPY(MEM[64] + 32, v13, uint24(msg.data[1 + (v12 + (uint8.max + 1 - (byte(msg.data[v12], 0x0)) >> 3))] >> 232));
                                                MEM[64] = 32 + (MEM[64] + uint24(msg.data[1 + (v12 + (uint8.max + 1 - (byte(msg.data[v12], 0x0)) >> 3))] >> 232));
                                                v14 = _SafeAdd(v13, uint24(msg.data[1 + (v12 + (uint8.max + 1 - (byte(msg.data[v12], 0x0)) >> 3))] >> 232));
                                                0x8a8(msg.data[v12 + 1] >> (byte(msg.data[v12], 0x0)), 0x111111125421ca6dc452d289314280a0f8842a65, msg.data[v2] >> 96);
                                                v15 = v16 = 0;
                                                while (v15 < uint24(msg.data[1 + (v12 + (uint8.max + 1 - (byte(msg.data[v12], 0x0)) >> 3))] >> 232)) {
                                                    MEM[v15 + MEM[64]] = MEM[v15 + (MEM[64] + 32)];
                                                    v15 += 32;
                                                }
                                                MEM[uint24(msg.data[1 + (v12 + (uint8.max + 1 - (byte(msg.data[v12], 0x0)) >> 3))] >> 232) + MEM[64]] = 0;
                                                v17 = address(0x111111125421ca6dc452d289314280a0f8842a65).call(MEM[MEM[64]:MEM[64] + uint24(msg.data[1 + v1bbe_0x0V0x8f2 + uint8.max + 1 - 0x0 byte msg.data[v1bbe_0x0V0x8f2] >> 3] >> 232) + MEM[64] - MEM[64]], MEM[MEM[64]:MEM[64]]).gas(msg.gas);
                                                if (RETURNDATASIZE() == 0) {
                                                    v18 = v19 = 96;
                                                } else {
                                                    v18 = v20 = MEM[64];
                                                    MEM[64] = v20 + (RETURNDATASIZE() + 63 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                                                    MEM[v20] = RETURNDATASIZE();
                                                    RETURNDATACOPY(v20 + 32, 0, RETURNDATASIZE());
                                                }
                                                if (v17) {
                                                    v21 = 0xd68(this, msg.data[v11] >> 96);
                                                    v22 = 0xd68(this, msg.data[v2] >> 96);
                                                    if (v22) {
                                                        MEM[4] = 0;
                                                        v23 = (msg.data[v2] >> 96).transfer(0xa487e3c1d7880675f5578e24110ba138c2558c1e, v22).gas(msg.gas);
                                                        require(v23, Error('Failed to transfer remained token'));
                                                    }
                                                } else {
                                                    require(!MEM[v18], 32 + v18, MEM[v18]);
                                                    revert(Error('Failed to swap'));
                                                }
                                            } else {
                                                v24 = _SafeAdd(v2, 1);
                                                v25 = _SafeAdd(v24, 20);
                                                v26 = _SafeAdd(v25, 20);
                                                v27 = v28 = msg.data[v26 + 1] >> (byte(msg.data[v26], 0x0));
                                                v29 = _SafeAdd(1 + (v26 + (uint8.max + 1 - (byte(msg.data[v26], 0x0)) >> 3)), 3);
                                                CALLDATACOPY(MEM[64] + 32, v29, uint24(msg.data[1 + (v26 + (uint8.max + 1 - (byte(msg.data[v26], 0x0)) >> 3))] >> 232));
                                                MEM[64] = 32 + (MEM[64] + uint24(msg.data[1 + (v26 + (uint8.max + 1 - (byte(msg.data[v26], 0x0)) >> 3))] >> 232));
                                                v30 = _SafeAdd(v29, uint24(msg.data[1 + (v26 + (uint8.max + 1 - (byte(msg.data[v26], 0x0)) >> 3))] >> 232));
                                                v27 = v31 = 0;
                                                if (byte(msg.data[v2], 0x0)) {
                                                    v32 = v33 = 0x6000da47483062a0d734ba3dc7576ce6a0b645c4;
                                                } else {
                                                    v32 = v34 = 0x11f84b9aa48e5f8aa8b9897600006289be;
                                                }
                                                if (!address(msg.data[v24] >> 96)) {
                                                    v35 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(v28).gas(msg.gas);
                                                    require(v35, Error('Failed to withdraw WETH'));
                                                } else {
                                                    0x8a8(v28, v32, msg.data[v24] >> 96);
                                                }
                                                v36 = v37 = 0;
                                                while (v36 < uint24(msg.data[1 + (v26 + (uint8.max + 1 - (byte(msg.data[v26], 0x0)) >> 3))] >> 232)) {
                                                    MEM[v36 + MEM[64]] = MEM[v36 + (MEM[64] + 32)];
                                                    v36 += 32;
                                                }
                                                MEM[uint24(msg.data[1 + (v26 + (uint8.max + 1 - (byte(msg.data[v26], 0x0)) >> 3))] >> 232) + MEM[64]] = 0;
                                                v38 = address(v32).call(MEM[MEM[64]:MEM[64] + uint24(msg.data[1 + v1b29_0x0V0x8f2 + uint8.max + 1 - 0x0 byte msg.data[v1b29_0x0V0x8f2] >> 3] >> 232) + MEM[64] - MEM[64]], MEM[MEM[64]:MEM[64]]).value(v27).gas(msg.gas);
                                                if (RETURNDATASIZE() == 0) {
                                                    v39 = v40 = 96;
                                                } else {
                                                    v39 = v41 = MEM[64];
                                                    MEM[64] = v41 + (RETURNDATASIZE() + 63 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                                                    MEM[v41] = RETURNDATASIZE();
                                                    RETURNDATACOPY(v41 + 32, 0, RETURNDATASIZE());
                                                }
                                                if (v38) {
                                                    v42 = 0xd68(this, msg.data[v25] >> 96);
                                                    v43 = 0xd68(this, msg.data[v24] >> 96);
                                                    if (v43) {
                                                        if (address(msg.data[v24] >> 96)) {
                                                            MEM[4] = 0;
                                                            v44 = (msg.data[v24] >> 96).transfer(0xa487e3c1d7880675f5578e24110ba138c2558c1e, v43).gas(msg.gas);
                                                            require(v44, Error('Failed to transfer remained token'));
                                                        } else {
                                                            v45 = 0xa487e3c1d7880675f5578e24110ba138c2558c1e.call().value(v43).gas(msg.gas);
                                                            require(v45, Error('Failed to transfer reamined ETH'));
                                                        }
                                                    }
                                                } else {
                                                    require(!MEM[v39], 32 + v39, MEM[v39]);
                                                    revert(Error('Failed to swap'));
                                                }
                                            }
                                        } else {
                                            v46 = _SafeAdd(v2, 20);
                                            v47 = _SafeAdd(v46, 20);
                                            v48 = _SafeAdd(v47, 20);
                                            v49 = _SafeAdd(v48, 20);
                                            v50 = _SafeAdd(1 + (v49 + (uint8.max + 1 - (byte(msg.data[v49], 0x0)) >> 3)), 3);
                                            CALLDATACOPY(MEM[64] + 32, v50, uint24(msg.data[1 + (v49 + (uint8.max + 1 - (byte(msg.data[v49], 0x0)) >> 3))] >> 232));
                                            MEM[64] = 32 + (MEM[64] + uint24(msg.data[1 + (v49 + (uint8.max + 1 - (byte(msg.data[v49], 0x0)) >> 3))] >> 232));
                                            v51 = _SafeAdd(v50, uint24(msg.data[1 + (v49 + (uint8.max + 1 - (byte(msg.data[v49], 0x0)) >> 3))] >> 232));
                                            0x8a8(msg.data[v49 + 1] >> (byte(msg.data[v49], 0x0)), msg.data[v2] >> 96, msg.data[v47] >> 96);
                                            v52 = v53 = 0;
                                            while (v52 < uint24(msg.data[1 + (v49 + (uint8.max + 1 - (byte(msg.data[v49], 0x0)) >> 3))] >> 232)) {
                                                MEM[v52 + MEM[64]] = MEM[v52 + (MEM[64] + 32)];
                                                v52 += 32;
                                            }
                                            MEM[uint24(msg.data[1 + (v49 + (uint8.max + 1 - (byte(msg.data[v49], 0x0)) >> 3))] >> 232) + MEM[64]] = 0;
                                            v54 = address(msg.data[v46] >> 96).call(MEM[MEM[64]:MEM[64] + uint24(msg.data[1 + v1a8f_0x0V0x8f2 + uint8.max + 1 - 0x0 byte msg.data[v1a8f_0x0V0x8f2] >> 3] >> 232) + MEM[64] - MEM[64]], MEM[MEM[64]:MEM[64]]).gas(msg.gas);
                                            if (RETURNDATASIZE() == 0) {
                                                v55 = v56 = 96;
                                            } else {
                                                v55 = v57 = MEM[64];
                                                MEM[64] = v57 + (RETURNDATASIZE() + 63 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                                                MEM[v57] = RETURNDATASIZE();
                                                RETURNDATACOPY(v57 + 32, 0, RETURNDATASIZE());
                                            }
                                            if (v54) {
                                                v58 = 0xd68(this, msg.data[v48] >> 96);
                                            } else {
                                                require(!MEM[v55], 32 + v55, MEM[v55]);
                                                revert(Error('Failed to swap'));
                                            }
                                        }
                                    } else {
                                        v1 = 1 + (v2 + (uint8.max + 1 - (byte(msg.data[v2], 0x0)) >> 3));
                                        require(v1 > msg.data[v2 + 1] >> (byte(msg.data[v2], 0x0)), Error('Failed to keep token'));
                                        v1 = _SafeSub(v1, msg.data[v2 + 1] >> (byte(msg.data[v2], 0x0)));
                                    }
                                } else {
                                    v59 = _SafeAdd(v2, 20);
                                    v60 = _SafeAdd(v59, 20);
                                    v1 = _SafeAdd(v60, 20);
                                    if (bool(!((byte(msg.data[v1], 0x0)) & 0x2))) {
                                        if (!bool(!((byte(msg.data[v1], 0x0)) & 0x1))) {
                                            v1 = v61 = 0xd68(this, msg.data[v59] >> 96);
                                        }
                                    } else {
                                        v1 = 1 + (v1 + (uint8.max + 1 - (byte(msg.data[v1], 0x0)) >> 3));
                                        v1 = v62 = msg.data[v1 + 1] >> (byte(msg.data[v1], 0x0));
                                    }
                                    v1 = v63 = 0x2bb1(0, v1, msg.data[v60] >> 96, msg.data[v59] >> 96, msg.data[v2] >> 96);
                                }
                            } else {
                                v5 = v64 = 5150;
                                v65 = v66 = msg.data[v2] >> 96;
                                v67 = _SafeAdd(v2, 20);
                                v65 = v68 = msg.data[v67] >> 96;
                                v69 = _SafeAdd(v67, 20);
                                v65 = v70 = msg.data[v69];
                                v71 = _SafeAdd(v69, 32);
                                v65 = v72 = byte(msg.data[v71], 0x0);
                                v73 = _SafeAdd(v71, 1);
                                if (bool(!((byte(msg.data[v1], 0x0)) & 0x2))) {
                                    if (!bool(!((byte(msg.data[v1], 0x0)) & 0x1))) {
                                        v74 = v75 = 6403;
                                        if (!v72) {
                                        }
                                    }
                                } else {
                                    v1 = v76 = msg.data[v73];
                                    v77 = _SafeAdd(v73, 32);
                                }
                            }
                        } else {
                            v1 = v78 = 0;
                            v79 = _SafeAdd(v2, 20);
                            v80 = _SafeAdd(v79, 20);
                            v81 = _SafeAdd(v80, 20);
                            v82 = _SafeAdd(v81, 1);
                            if (bool(!((byte(msg.data[v1], 0x0)) & 0x2))) {
                                if (!bool(!((byte(msg.data[v1], 0x0)) & 0x1))) {
                                    v1 = v83 = 0xd68(this, msg.data[v79] >> 96);
                                }
                            } else {
                                v1 = v84 = msg.data[v82 + 1] >> (byte(msg.data[v82], 0x0));
                            }
                            v1, v85, v86, v87, v88, v89 = 0x2479(byte(msg.data[v81], 0x0), 0, v1, msg.data[v80] >> 96, msg.data[v79] >> 96, msg.data[v2] >> 96);
                            // Unknown jump to Block 0x141e0x13cdB0x8f2. Refer to 3-address code (TAC);
                        }
                        // Unknown jump to Block 0x8fb. Refer to 3-address code (TAC);
                    } else {
                        v90 = _SafeAdd(v2, 20);
                        v91 = _SafeAdd(v90, 20);
                        v92 = _SafeAdd(v91, 3);
                        v93 = _SafeAdd(v92, 3);
                        if (bool(!((byte(msg.data[v1], 0x0)) & 0x2))) {
                            if (!bool(!((byte(msg.data[v1], 0x0)) & 0x1))) {
                                v1 = v94 = 0xd68(this, msg.data[v2] >> 96);
                            }
                        } else {
                            v1 = v95 = msg.data[v93 + 1] >> (byte(msg.data[v93], 0x0));
                        }
                        if (!bool(address(msg.data[v2] >> 96))) {
                            v96 = 0xd68(this, msg.data[v2] >> 96);
                            if (v96 < uint128(v1)) {
                                v97 = _SafeSub(uint128(v1), v96);
                                v98 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(v97).gas(msg.gas);
                            }
                        }
                        v99 = 0xd68(this, msg.data[v2] >> 96);
                        require(v99 >= uint128(v1), Error('Insufficient balance'));
                        if (address(msg.data[v2] >> 96)) {
                            0x35dd(300, uint128(v1), 0x66a9893cc07d91d95644aedd05d03f95e1dba8af, msg.data[v2] >> 96);
                        }
                        v100, v101 = 0x36d9(msg.data[v92] >> 232, msg.data[v91] >> 232, msg.data[v90] >> 96, msg.data[v2] >> 96);
                        MEM[MEM[64] + 32] = 0x1000000000000000000000000000000000000000000000000000000000000000;
                        v102 = v103 = 1;
                        v104 = v105 = 65 + MEM[64];
                        while (v102) {
                            MEM[v104] = 96;
                            v104 += 32;
                            v102 = v102 - 1;
                        }
                        MEM[MEM[64] + 32] = 0x600000000000000000000000000000000000000000000000000000000000000;
                        MEM[MEM[64] + 33] = 0xc00000000000000000000000000000000000000000000000000000000000000;
                        MEM[MEM[64] + 34] = 0xf00000000000000000000000000000000000000000000000000000000000000;
                        v106 = 3;
                        v107 = 67 + MEM[64];
                        while (v106) {
                            MEM[v107] = 96;
                            v107 += 32;
                            v106 = v106 - 1;
                        }
                        v108 = new struct(5);
                        v108.word0 = v101;
                        v108.word1 = bool(v100);
                        v108.word2 = uint128(v1);
                        v108.word3 = uint128(0);
                        v109 = new struct(1);
                        v109.word0 = 0;
                        v108.word4 = v109;
                        MEM[32 + MEM[64]] = 32;
                        MEM[32 + MEM[64] + 32] = address(MEM[v108.word0]);
                        MEM[32 + MEM[64] + 64] = address(MEM[v108.word0 + 32]);
                        MEM[32 + MEM[64] + 96] = uint24(MEM[v108.word0 + 64]);
                        MEM[32 + MEM[64] + 128] = int24(MEM[v108.word0 + 96]);
                        MEM[32 + MEM[64] + 160] = address(MEM[v108.word0 + 128]);
                        MEM[32 + MEM[64] + 192] = bool(v108.word1);
                        MEM[32 + MEM[64] + 224] = uint128(v108.word2);
                        MEM[32 + MEM[64] + (uint8.max + 1)] = uint128(v108.word3);
                        MEM[32 + MEM[64] + 288] = 288;
                        MEM[32 + MEM[64] + 320] = MEM[v108.word4];
                        v110 = v111 = 0;
                        while (v110 < MEM[v108.word4]) {
                            MEM[v110 + (32 + MEM[64] + 320 + 32)] = MEM[v110 + (v108.word4 + 32)];
                            v110 += 32;
                        }
                        MEM[MEM[v108.word4] + (32 + MEM[64] + 320 + 32)] = 0;
                        MEM[MEM[64]] = 32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v108.word4]) + (32 + MEM[64] + 320)) - MEM[64] - 32;
                        require(0 < 3, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                        MEM[32 + (MEM[64] + 35)] = MEM[64];
                        MEM[32 + MEM[64]] = address(msg.data[v2] >> 96);
                        MEM[32 + MEM[64] + 32] = uint128(v1);
                        MEM[MEM[64]] = 64;
                        require(1 < 3, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                        MEM[64 + (MEM[64] + 35)] = MEM[64];
                        MEM[32 + MEM[64]] = address(msg.data[v90] >> 96);
                        MEM[32 + MEM[64] + 32] = uint128(0);
                        MEM[MEM[64]] = 64;
                        require(2 < 3, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                        MEM[96 + (MEM[64] + 35)] = MEM[64];
                        MEM[32 + MEM[64]] = 64;
                        MEM[32 + MEM[64] + 64] = 3;
                        v112 = v113 = 0;
                        while (v112 < 3) {
                            MEM[v112 + (32 + MEM[64] + 64 + 32)] = MEM[v112 + (MEM[64] + 32)];
                            v112 += 32;
                        }
                        MEM[3 + (32 + MEM[64] + 64 + 32)] = 0;
                        MEM[32 + MEM[64] + 32] = 128;
                        MEM[64 + (32 + MEM[64] + 64)] = 3;
                        v114 = v115 = 64 + (32 + MEM[64] + 64) + 32;
                        v116 = v117 = 64 + (32 + MEM[64] + 64) + 96 + 32;
                        v118 = v119 = MEM[64] + 35 + 32;
                        v120 = v121 = 0;
                        while (v120 < 3) {
                            MEM[v114] = v116 - (64 + (32 + MEM[64] + 64)) - 32;
                            MEM[v116] = MEM[MEM[v118]];
                            v122 = v123 = 0;
                            while (v122 < MEM[MEM[v118]]) {
                                MEM[v122 + (v116 + 32)] = MEM[v122 + (MEM[v118] + 32)];
                                v122 += 32;
                            }
                            MEM[MEM[MEM[v118]] + (v116 + 32)] = 0;
                            v116 = 32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[MEM[v118]]) + v116);
                            v114 += 32;
                            v118 += 32;
                            v120 += 1;
                        }
                        MEM[MEM[64]] = v116 - MEM[64] - 32;
                        require(0 < 1, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                        MEM[32 + (MEM[64] + 33)] = MEM[64];
                        v124 = 0xd68(this, msg.data[v90] >> 96);
                        if (bool(address(msg.data[v2] >> 96))) {
                            MEM[MEM[64]] = 0x24856bc300000000000000000000000000000000000000000000000000000000;
                            MEM[4 + MEM[64]] = 64;
                            MEM[4 + MEM[64] + 64] = 1;
                            v125 = v126 = 0;
                            while (v125 < 1) {
                                MEM[v125 + (4 + MEM[64] + 64 + 32)] = MEM[v125 + (MEM[64] + 32)];
                                v125 += 32;
                            }
                            MEM[1 + (4 + MEM[64] + 64 + 32)] = 0;
                            MEM[4 + MEM[64] + 32] = 128;
                            MEM[64 + (4 + MEM[64] + 64)] = 1;
                            v127 = v128 = 64 + (4 + MEM[64] + 64) + 32;
                            v129 = v130 = 64 + (4 + MEM[64] + 64) + 32 + 32;
                            v131 = v132 = MEM[64] + 33 + 32;
                            v133 = v134 = 0;
                            while (v133 < 1) {
                                MEM[v127] = v129 - (64 + (4 + MEM[64] + 64)) - 32;
                                MEM[v129] = MEM[MEM[v131]];
                                v135 = v136 = 0;
                                while (v135 < MEM[MEM[v131]]) {
                                    MEM[v135 + (v129 + 32)] = MEM[v135 + (MEM[v131] + 32)];
                                    v135 += 32;
                                }
                                MEM[MEM[MEM[v131]] + (v129 + 32)] = 0;
                                v129 = 32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[MEM[v131]]) + v129);
                                v127 += 32;
                                v131 += 32;
                                v133 += 1;
                            }
                            require(bool(0x66a9893cc07d91d95644aedd05d03f95e1dba8af.code.size));
                            v137 = 0x66a9893cc07d91d95644aedd05d03f95e1dba8af.call(MEM[MEM[64]:MEM[64] + v3cc1V0x3ebeV0x22baV0x8f2 - MEM[64]], MEM[MEM[64]:MEM[64]]).gas(msg.gas);
                            if (!bool(v137)) {
                                RETURNDATACOPY(0, 0, RETURNDATASIZE());
                                revert(0, RETURNDATASIZE());
                            }
                        } else {
                            MEM[MEM[64]] = 0x24856bc300000000000000000000000000000000000000000000000000000000;
                            MEM[4 + MEM[64]] = 64;
                            MEM[4 + MEM[64] + 64] = 1;
                            v138 = v139 = 0;
                            while (v138 < 1) {
                                MEM[v138 + (4 + MEM[64] + 64 + 32)] = MEM[v138 + (MEM[64] + 32)];
                                v138 += 32;
                            }
                            MEM[1 + (4 + MEM[64] + 64 + 32)] = 0;
                            MEM[4 + MEM[64] + 32] = 128;
                            MEM[64 + (4 + MEM[64] + 64)] = 1;
                            v140 = v141 = 64 + (4 + MEM[64] + 64) + 32;
                            v142 = v143 = 64 + (4 + MEM[64] + 64) + 32 + 32;
                            v144 = v145 = MEM[64] + 33 + 32;
                            v146 = v147 = 0;
                            while (v146 < 1) {
                                MEM[v140] = v142 - (64 + (4 + MEM[64] + 64)) - 32;
                                MEM[v142] = MEM[MEM[v144]];
                                v148 = v149 = 0;
                                while (v148 < MEM[MEM[v144]]) {
                                    MEM[v148 + (v142 + 32)] = MEM[v148 + (MEM[v144] + 32)];
                                    v148 += 32;
                                }
                                MEM[MEM[MEM[v144]] + (v142 + 32)] = 0;
                                v142 = 32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[MEM[v144]]) + v142);
                                v140 += 32;
                                v144 += 32;
                                v146 += 1;
                            }
                            require(bool((address(0x66a9893cc07d91d95644aedd05d03f95e1dba8af)).code.size));
                            v150 = address(0x66a9893cc07d91d95644aedd05d03f95e1dba8af).call(MEM[MEM[64]:MEM[64] + v3cc1V0x3ebeV0x2222V0x8f2 - MEM[64]], MEM[MEM[64]:MEM[64]]).value(uint128(v1)).gas(msg.gas);
                            if (!bool(v150)) {
                                RETURNDATACOPY(0, 0, RETURNDATASIZE());
                                revert(0, RETURNDATASIZE());
                            }
                        }
                        v151 = 0xd68(this, msg.data[v90] >> 96);
                        v152 = _SafeSub(v151, v124);
                        require(v152 >= uint128(0), Error('Insufficient output amount'));
                        if (!address(msg.data[v90] >> 96)) {
                            v153 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.deposit().value(v151).gas(msg.gas);
                            require(v153, Error('Failed to deposith ETH'));
                        }
                        // Unknown jump to Block 0x8fb. Refer to 3-address code (TAC);
                    }
                } else {
                    v5 = v154 = 5150;
                    v65 = v155 = 0;
                    v156 = v157 = 5778;
                    v158 = v159 = 0x3d05(v2);
                }
            } else {
                v5 = v160 = 5150;
                v65 = v161 = 0;
                v156 = v162 = 5604;
                v158 = v163 = 0x3d05(v2);
            }
            // Unknown jump to Block ['0x15e4B0x8f2', '0x1692B0x8f2']. Refer to 3-address code (TAC);
            v65 = v164 = 1 == uint8(byte(msg.data[v2], 0x0));
            v65 = v165 = msg.data[v158] >> 96;
            v166 = _SafeAdd(v158, 20);
            v65 = v167 = msg.data[v166] >> 96;
            v168 = _SafeAdd(v166, 20);
            if (bool(!((byte(msg.data[v1], 0x0)) & 0x2))) {
                if (!bool(!((byte(msg.data[v1], 0x0)) & 0x1))) {
                    v74 = v169 = 5728;
                    if (1 != uint8(byte(msg.data[v2], 0x0))) {
                    }
                }
            } else {
                v1 = v170 = msg.data[v168 + 1] >> (byte(msg.data[v168], 0x0));
            }
            v171 = 0x1c2d(v65, v1, v65, v65, v1);
            v172 = v173 = this;
            v1 = v174 = 0;
            v175 = v176 = !address(v65);
            if (address(v65)) {
                v175 = 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == address(v65);
            }
            if (!v175) {
                v177 = v65.balanceOf(v172).gas(msg.gas);
                if (v177) {
                    v1 = v178 = MEM[0];
                    // Unknown jump to Block ['0x1660B0x8f2', '0x171fB0x8f2', '0x1903B0x8f2']. Refer to 3-address code (TAC);
                }
            } else {
                v1 = v179 = (address(v172)).balance;
            }
            // Unknown jump to Block ['0x1660B0x8f2', '0x171fB0x8f2', '0x1903B0x8f2']. Refer to 3-address code (TAC);
            v65 = v180 = 1 == uint8(byte(msg.data[v2], 0x0));
            v65 = v181 = msg.data[v158] >> 96;
            v182 = _SafeAdd(v158, 20);
            v65 = v183 = msg.data[v182] >> 96;
            v184 = _SafeAdd(v182, 20);
            v65 = v185 = msg.data[v184] >> 240;
            v5 = v186 = _SafeAdd(v184, 2);
            if (bool(!((byte(msg.data[v1], 0x0)) & 0x2))) {
                if (!bool(!((byte(msg.data[v1], 0x0)) & 0x1))) {
                    v74 = v187 = 5919;
                    if (1 != uint8(byte(msg.data[v2], 0x0))) {
                    }
                }
            } else {
                v1 = v188 = msg.data[v186 + 1] >> (byte(msg.data[v186], 0x0));
            }
            v189 = 0x1cc2(0, v65, v1, v65, v65, v65, v1);
            // Unknown jump to Block 0x8fb. Refer to 3-address code (TAC);
            v172 = v190 = this;
            // Unknown jump to Block 0xd680x13cdB0x8f2. Refer to 3-address code (TAC);
            v191 = 0x27c3(v1, v65, v65, v65, v65);
            // Unknown jump to Block 0x8fb. Refer to 3-address code (TAC);
        }
    }
}

function 0xce6(bytes varg0, uint256 varg1, address varg2) private { 
    v0 = new bytes[](varg0.length);
    v1 = v2 = 0;
    while (v1 < varg0.length) {
        v0[v1] = varg0[v1];
        v1 += 32;
    }
    v0[varg0.length] = 0;
    require(bool(0xbbbbbbbbbb9cc5e90e3b3af64bdaf62c37eeffcb.code.size));
    v3 = 0xbbbbbbbbbb9cc5e90e3b3af64bdaf62c37eeffcb.flashLoan(varg2, varg1, v0).gas(msg.gas);
    require(bool(v3), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    return ;
}

function 0xd68(uint256 varg0, uint256 varg1) private { 
    v0 = v1 = 0;
    v2 = v3 = !address(varg1);
    if (address(varg1)) {
        v2 = 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == address(varg1);
    }
    if (!v2) {
        v4 = varg1.balanceOf(varg0).gas(msg.gas);
        if (v4) {
            return MEM[0];
        }
    } else {
        v0 = (address(varg0)).balance;
    }
    return v0;
}

function 0xec3(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) private { 
    v0 = v1 = msg.data[varg2] >> 176;
    v2 = v3 = 3807;
    v4 = v5 = _SafeAdd(10, varg2);
    while (1) {
        v0 = v6 = msg.data[v4] >> 176;
        // Unknown jump to Block ['0xedf', '0xef1']. Refer to 3-address code (TAC);
        v2 = v7 = 3825;
        v4 = v8 = _SafeAdd(20, v0);
    }
    v9 = 0xd68(this, 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
    v10 = _SafeAdd(v0, v0);
    v11 = _SafeAdd(v10, v6);
    require(v9 > v11, Error('Failed due to no profit'));
    v12 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(v9).gas(msg.gas);
    require(v12, Error('Failed to withdraw WETH'));
    v13 = _SafeSub(v9, v11);
    v14 = _SafeAdd(30, v0);
    v15 = _SafeMul(v13, uint8(byte(msg.data[v14], 0x0)));
    v16 = _SafeDiv(v15, 100);
    v17 = _SafeSub(v13, v16);
    if (v16) {
        v18 = block.coinbase.call().value(v16).gas(msg.gas);
        require(v18, Error('Failed to transfer ETH to Coinbase'));
    }
    if (v0) {
        v19 = v0.call().value(v0).gas(msg.gas);
        require(v19, Error('Failed to recover token wallet gasfee'));
    }
    if (v0) {
        v20 = v0.call().value(v0).gas(msg.gas);
        require(v20, Error('Failed to recover aggregator wallet gasfee'));
    }
    if (v6) {
        v21 = tx.origin.call().value(v6).gas(msg.gas);
        require(v21, Error('Failed to recover gasfee'));
    }
    if (v17) {
        v22 = 0xa487e3c1d7880675f5578e24110ba138c2558c1e.call().value(this.balance).gas(msg.gas);
        require(v22, Error('Failed to transfer profit'));
    }
    return ;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7, uint256 varg8, uint256 varg9) public payable { 
    if (msg.data.length) {
        require(tx.origin.balance <= 10 ** 18, Error('Revert due to malicious call from another bot'));
        if (tx.origin - msg.sender) {
            CALLDATACOPY(0, 132, 96);
            if (msg.sender + 0xffffffffffffffffffffffff4444444444633a16f1c4c509b42509d3c8110035) {
                if (msg.sender + 0xffffffffffffffffffffffff3fd555c64ddc0172f5f1a3b0d81526f7c38a933e) {
                    if (msg.data.length > 228) {
                        require(228 < msg.data.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                        if (0 - uint8(varg8 >> 248)) {
                            if (1 - uint8(varg8 >> 248)) {
                                if (3 - uint8(varg8 >> 248)) {
                                    if (4 - uint8(varg8 >> 248)) {
                                        v0 = v1 = 0;
                                    } else {
                                        v0 = v2 = address(keccak256(0xff41ff9aa7e16b8b1a8a8dc4f0efacd93d02d071c90000000000000000000000, keccak256(MEM[0x0:96]), 0x6ce8eb472fa82df5469c6ab6d485f17c3ad13c8cd7af59b3d4a8026c5ce0f7e2));
                                        MEM[64] = 128;
                                    }
                                } else {
                                    v0 = v3 = address(keccak256(0xff1f98431c8ad98523631ae4a59f267346ea31f9840000000000000000000000, keccak256(MEM[0x0:96]), 0xe34f199b19b2b4f47f68442619d555527d244f78a3297ea89325f843f87b8b54));
                                    MEM[64] = 128;
                                }
                            } else {
                                v0 = v4 = address(keccak256(0xffc0aee478e3658e2610c5f7a4a2e1777ce9e4f2ac0000000000000000000000, keccak256(MEM[0x0:96]), 0xe18a34eb0e04b04f7a0ac29a6e80748dca96319b42c54d679cb821dca90c6303));
                                MEM[64] = 128;
                            }
                        } else {
                            v0 = v5 = address(keccak256(0xff5c69bee701ef814a2b6a3edd4b1652cb9cc5aa6f0000000000000000000000, keccak256(MEM[0x0:96]), 0x96e8ac4277198ff8b6f785478aa9a39f403cb768dd02cbee326c3e7da348845f));
                            MEM[64] = 128;
                        }
                        if (!(address(v0) - msg.sender)) {
                            require(229 < msg.data.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                            if (0 - bytes1(varg9 >> 248 << 248)) {
                                if (uint248.max + 1 - bytes1(varg9 >> 248 << 248)) {
                                    if (0x200000000000000000000000000000000000000000000000000000000000000 - bytes1(varg9 >> 248 << 248)) {
                                        require(!(0x300000000000000000000000000000000000000000000000000000000000000 - bytes1(varg9 >> 248 << 248)), Error('Unknown selector.'));
                                        v6 = v7 = 522;
                                        MEM[4] = 0;
                                        v8 = (varg6 >> 96).transfer(msg.sender, varg2).gas(msg.gas);
                                        MEM[64] = MEM[64];
                                    } else {
                                        v6 = v9 = 522;
                                        MEM[4] = 0;
                                        v10 = (varg7 >> 96).transfer(msg.sender, varg4).gas(msg.gas);
                                        MEM[64] = MEM[64];
                                    }
                                } else {
                                    v6 = v11 = 522;
                                    v12 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.transferFrom(this, msg.sender, varg2).gas(msg.gas);
                                    MEM[64] = MEM[64];
                                }
                            } else {
                                v6 = v13 = 522;
                                v14 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.transferFrom(this, msg.sender, varg4).gas(msg.gas);
                                MEM[64] = MEM[64];
                            }
                            // Unknown jump to Block 0xd6. Refer to 3-address code (TAC);
                        }
                    }
                    v15 = v16 = 0;
                    v17 = v18 = 0;
                    require(v18 < msg.data.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                } else {
                    exit;
                }
            } else if (100 - msg.data.length) {
                v19 = _SafeAdd(100, 20);
                0x8dc(1, 1 + (v19 + (uint8.max + 1 - (byte(msg.data[v19], 0x0)) >> 3)));
                0x8a8(msg.data[1 + v19] >> (byte(msg.data[v19], 0x0)), msg.sender, varg5 >> 96);
            } else {
                0x8a8(10 ** 20, msg.sender, 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
            }
        } else {
            v15 = v20 = 0;
            v17 = v21 = 0;
            require(v21 < msg.data.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        }
        if (0 - bytes1(function_selector >> 248 << 248)) {
            if (uint248.max + 1 - bytes1(function_selector >> 248 << 248)) {
                require(!(0x200000000000000000000000000000000000000000000000000000000000000 - bytes1(function_selector >> 248 << 248)), Error('Unknown selector'));
                0x839();
            } else {
                v22, v23, v24, v25, v26, v27, v28, v29, v30 = 0x73a(522);
            }
        } else {
            v31 = _SafeAdd(12, 20);
            require(12 <= msg.data.length);
            require(msg.data.length <= msg.data.length);
            v32 = new bytes[](msg.data.length - 12);
            v33 = v32 + (32 + (31 + (msg.data.length - 12) >> 5 << 5));
            CALLDATACOPY(v32.data, 12, msg.data.length - 12);
            v32[msg.data.length - 12] = 0;
            0xce6(v32, msg.data[v31 + 1] >> (byte(msg.data[v31], 0x0)), varg3 >> 96);
            v34 = 0xd68(this, 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
            require(v34 > varg1 >> 176, Error('Failed due to no profit'));
            v35 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(v34).gas(msg.gas);
            require(v35, Error('Failed to withdraw WETH'));
            v36 = _SafeSub(v34, varg1 >> 176);
            v37 = _SafeAdd(10, 1);
            v38 = _SafeMul(v36, uint8(byte(msg.data[v37], 0x0)));
            v39 = _SafeDiv(v38, 100);
            v40 = _SafeSub(v36, v39);
            if (v39) {
                v41 = block.coinbase.call().value(v39).gas(msg.gas);
                require(v41, Error('Failed to transfer ETH to Coinbase'));
            }
            if (varg1 >> 176) {
                v42 = tx.origin.call().value(varg1 >> 176).gas(msg.gas);
                require(v42, Error('Failed to recover gasfee'));
            }
            if (v40) {
                v43 = 0xa487e3c1d7880675f5578e24110ba138c2558c1e.call().value(this.balance).gas(msg.gas);
                require(v43, Error('Failed to transfer profit'));
            }
        }
        exit;
    } else {
        exit;
    }
}
