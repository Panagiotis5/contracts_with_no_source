// Decompiled by library.dedaub.com
// 2025.12.05 08:09 UTC
// Compiled using the solidity compiler version 0.8.19


// Data structures and variables inferred from the use of storage instructions
bool _isActive; // STORAGE[0x0] bytes 0 to 0
mapping (address => bool) mapping_1; // STORAGE[0x1]
mapping (address => bool) __operators; // STORAGE[0x2]
mapping (address => bool) mapping_3; // STORAGE[0x3]
mapping (address => bool) mapping_4; // STORAGE[0x4]
mapping (address => bool) mapping_5; // STORAGE[0x5]
uint256[] array_6; // STORAGE[0x6]
mapping (address => uint256) mapping_7; // STORAGE[0x7]
uint256[] _getAllApprovedTokens; // STORAGE[0x8]
mapping (address => uint256) mapping_9; // STORAGE[0x9]
mapping (address => bool) mapping_a; // STORAGE[0xa]
mapping (address => bool) _uniswapV3SwapCallback; // STORAGE[0xb]
mapping (address => bool) mapping_c; // STORAGE[0xc]
mapping (address => bool) mapping_10; // STORAGE[0x10]
address stor_d_0_19; // STORAGE[0xd] bytes 0 to 19
address stor_e_0_19; // STORAGE[0xe] bytes 0 to 19
address stor_f_0_19; // STORAGE[0xf] bytes 0 to 19
bool stor_f_20_20; // STORAGE[0xf] bytes 20 to 20
bool stor_f_21_21; // STORAGE[0xf] bytes 21 to 21



function 0xfcdd595a(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(!(address(varg0) - varg0));
    return mapping_10[address(varg0)];
}

function receive() public payable { 
}

function 0xfc6594ef(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(!(address(varg0) - varg0));
    return mapping_4[address(varg0)];
}

function 0xfb034fb2(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5) public payable { 
    require(msg.data.length - 4 >= 192);
    require(!(address(varg1) - varg1));
    require(_isActive, Error(18481));
    require(__operators[msg.sender], Error(18484));
    require(mapping_c[address(varg1)], Error(18487));
    v0, /* uint256 */ v1 = address(varg1).exchange_extended(varg2, varg3, varg4, varg5, 0, this, this, 0xc4da52dc00000000000000000000000000000000000000000000000000000000).gas(msg.gas);
    require(v0, MEM[64], RETURNDATASIZE());
    if (v0) {
        if (32 > RETURNDATASIZE()) {
            require(!((MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
            v2 = MEM[64] + RETURNDATASIZE();
        } else {
            require(!((MEM[64] + 32 > uint64.max) | (MEM[64] + 32 < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
            MEM[64] = MEM[64] + 32;
            v2 = v3 = MEM[64] + 32;
        }
        require(v2 - MEM[64] >= 32);
        v4 = this.code.size;
    }
    if (varg0) {
        require(mapping_5[block.coinbase], Error(0x483137));
        v5, /* uint256 */ v6 = block.coinbase.call().value(varg0);
        if (RETURNDATASIZE()) {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v7 = v8 = new bytes[](RETURNDATASIZE());
            require(!((v8 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v8 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v8)), Panic(65)); // failed memory allocation (too much memory)
            v6 = v8.data;
            RETURNDATACOPY(v6, 0, RETURNDATASIZE());
        }
    }
    return ;
}

function uniswapV3SwapCallback(int256 amount0Delta, int256 amount1Delta, bytes data) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(data <= uint64.max);
    require(4 + data + 31 < msg.data.length);
    require(data.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v0 = new bytes[](data.length);
    require(!((v0 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + data.length) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v0 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + data.length) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v0)), Panic(65)); // failed memory allocation (too much memory)
    require(4 + data + data.length + 32 <= msg.data.length);
    CALLDATACOPY(v0.data, data.data, data.length);
    v0[data.length] = 0;
    require(_uniswapV3SwapCallback[msg.sender], Error(0x483330));
    if (amount0Delta > 0) {
    }
    v1 = new bytes[](68);
    MEM[v1.data] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
    MEM[v1 + 36] = msg.sender;
    MEM[v1 + 68] = v2;
    require(!((v1 + 128 > uint64.max) | (v1 + 128 < v1)), Panic(65)); // failed memory allocation (too much memory)
    v3 = v1.length;
    v4, /* uint256 */ v5 = data.length.transfer(msg.sender, v2).gas(msg.gas);
    if (RETURNDATASIZE()) {
        require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v6 = v7 = new bytes[](RETURNDATASIZE());
        require(!((v7 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v7 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v7)), Panic(65)); // failed memory allocation (too much memory)
        v5 = v7.data;
        RETURNDATACOPY(v5, 0, RETURNDATASIZE());
    }
    return ;
}

function 0xf7e846e9(uint256 varg0, uint256 varg1, int128 varg2, int128 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7) public payable { 
    require(msg.data.length - 4 >= uint8.max + 1);
    require(!(address(varg1) - varg1));
    require(!(bool(varg6) - varg6));
    v0 = v1 = 0;
    require(_isActive, Error(18481));
    v2 = v3 = 32;
    require(mapping_c[address(varg1)], Error(18487));
    require(__operators[msg.sender], Error(18484));
    require(block.timestamp <= varg7, Error(18488));
    if (!varg6) {
        v4 = v5 = MEM[64];
        MEM[v5] = 0x3df0212400000000000000000000000000000000000000000000000000000000;
        MEM[v5 + 4] = varg2;
        MEM[v5 + 36] = varg3;
        MEM[v5 + 68] = varg4;
        MEM[v5 + 100] = varg5;
        v6 = v7 = v5 + 132;
    } else {
        v4 = v8 = MEM[64];
        MEM[v8] = 0x3df0212400000000000000000000000000000000000000000000000000000000;
        MEM[v8 + 4] = varg2;
        MEM[v8 + 36] = varg3;
        MEM[v8 + 68] = varg4;
        MEM[v8 + 100] = varg5;
        v6 = v9 = v8 + 132;
    }
    v10 = address(varg1).call(MEM[v17ead0x2e5_0x1:v17ead0x2e5_0x1 + v287e_0x0 - v17ead0x2e5_0x1], MEM[v17ead0x2e5_0x1:v17ead0x2e5_0x1 + v2810]).value(v0).gas(msg.gas);
    require(v10, MEM[64], RETURNDATASIZE());
    if (v10) {
        if (RETURNDATASIZE() < v3) {
            v2 = RETURNDATASIZE();
        }
        require(!((v4 + (v2 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v4 + (v2 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v4)), Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = v4 + (v2 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
        require(v4 + v2 - v4 >= 32);
        v11 = this.code.size;
    }
    if (varg0) {
        require(mapping_5[block.coinbase], Error(0x483137));
        v12, /* uint256 */ v13 = block.coinbase.call().value(varg0);
        if (RETURNDATASIZE()) {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v14 = v15 = new bytes[](RETURNDATASIZE());
            require(!((v15 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v15 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v15)), Panic(65)); // failed memory allocation (too much memory)
            v13 = v15.data;
            RETURNDATACOPY(v13, 0, RETURNDATASIZE());
        }
    }
    return MEM[v27f3:v27f3 + v27f3];
}

function 0xf203c1b1(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    v0 = v1 = 0x17e43;
    v2 = v3 = __operators[msg.sender];
    if (!v3) {
        v2 = v4 = mapping_3[msg.sender];
    }
    if (!v2) {
        v2 = mapping_1[msg.sender];
    }
    if (!v2) {
        v2 = v5 = address(0xce466fc694c971b95bb1193e494942e22197f759) == msg.sender;
    }
    require(v2, Error(0x483131));
    _isActive = 0;
    require(varg0 <= _getAllApprovedTokens.length, Error(0x483133));
    v0 = v6 = 0;
    while (1) {
        if (v0 < v0) {
            v7 = 16064;
            if (_getAllApprovedTokens.length) {
                v0 = v8 = address(STORAGE[0xf3f7a9fe364faab93b216da50a3214154f22a0a2b415b23a84c8169e8b636ee3]);
                while (v0 != uint256.max) {
                    v0 += 1;
                    // Unknown jump to Block ['0x3ec0B0x27d3', '0x3f42B0x27d3']. Refer to 3-address code (TAC);
                    if (!mapping_9[address(v0)]) {
                        break;
                    } else {
                        if (uint256.max + mapping_9[address(v0)] > mapping_9[address(v0)]) {
                            break;
                        } else if (_getAllApprovedTokens.length - 1 > _getAllApprovedTokens.length) {
                            break;
                        } else {
                            if (_getAllApprovedTokens.length - 1 - (uint256.max + mapping_9[address(v0)])) {
                                require(_getAllApprovedTokens.length - 1 < _getAllApprovedTokens.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                                require(uint256.max + mapping_9[address(v0)] < _getAllApprovedTokens.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                                _getAllApprovedTokens[uint256.max + mapping_9[address(v0)]] = 0x0 & _getAllApprovedTokens[uint256.max + mapping_9[address(v0)]] | _getAllApprovedTokens[_getAllApprovedTokens.length - 1];
                                mapping_9[_getAllApprovedTokens[_getAllApprovedTokens.length - 1]] = mapping_9[address(v0)];
                                v9 = this.code.size;
                                break;
                            } else {
                                break;
                            }
                            require(_getAllApprovedTokens.length, Panic(49)); // attemp to .pop an empty array
                            require(_getAllApprovedTokens.length - 1 < _getAllApprovedTokens.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                            MEM[0] = 8;
                            STORAGE[_getAllApprovedTokens.length + 0xf3f7a9fe364faab93b216da50a3214154f22a0a2b415b23a84c8169e8b636ee2] = 0;
                            _getAllApprovedTokens.length = _getAllApprovedTokens.length - 1;
                            mapping_9[address(v0)] = 0;
                        }
                        revert(Panic(17));
                    }
                    v0 = v10 = 0;
                    if (v0 >= array_6.length) {
                        continue;
                    } else if (v0 >= array_6.length) {
                        break;
                    } else {
                        v11, v12 = address(v0).allowance(this, address(array_6[v0])).gas(msg.gas);
                        require(v11, v13, RETURNDATASIZE());
                        v7 = v14 = 16194;
                        v12 = v15 = 0;
                        if (v11) {
                            if (32 > RETURNDATASIZE()) {
                                require(!((MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                                MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                                v16 = v17 = MEM[64] + RETURNDATASIZE();
                            } else {
                                require(!((MEM[64] + 32 > uint64.max) | (MEM[64] + 32 < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                                MEM[64] = MEM[64] + 32;
                                v16 = v18 = MEM[64] + 32;
                            }
                            require(v16 - MEM[64] >= 32);
                            v19 = this.code.size;
                            break;
                        } else {
                            break;
                        }
                        if (v12) {
                            v20 = new bytes[](68);
                            MEM[v20.data] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                            MEM[v20 + 36] = address(array_6[v0]);
                            MEM[v20 + 68] = 0;
                            require(!((v20 + 128 > uint64.max) | (v20 + 128 < v20)), Panic(65)); // failed memory allocation (too much memory)
                            v21 = v20.length;
                            v22, /* uint256 */ v13, /* uint256 */ v23 = v0.approve(address(array_6[v0]), 0).gas(msg.gas);
                            if (!RETURNDATASIZE()) {
                                v24 = v25 = 96;
                            } else {
                                require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                                v24 = new bytes[](RETURNDATASIZE());
                                require(!((v24 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v24 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v24)), Panic(65)); // failed memory allocation (too much memory)
                                v23 = v24.data;
                                RETURNDATACOPY(v23, 0, RETURNDATASIZE());
                            }
                            v26 = v27 = !v22;
                            if (bool(v22)) {
                                v26 = v28 = bool(MEM[v24]);
                                if (v28) {
                                    require(v24 + MEM[v24] + 32 - (v24 + 32) >= 32);
                                    require(!(bool(MEM[v24 + 32]) - MEM[v24 + 32]));
                                    v26 = !MEM[v24 + 32];
                                    v29 = this.code.size;
                                } else {
                                    break;
                                }
                                v30 = this.code.size;
                                break;
                            } else {
                                break;
                            }
                            if (v26) {
                                emit 0x1685a34ffb3f2b177d05a4af1cbabd9ca2d1e2977ec14a80189b8d0f3b58b4f3(address(v0), address(array_6[v0]));
                                v31 = this.code.size;
                                break;
                            } else {
                                break;
                            }
                            break;
                        } else {
                            break;
                        }
                    }
                }
                revert(Panic(17));
            }
            revert(Panic(50));
        } else {
            emit 0xeffe39084a0f43b67972c81cfec3f2516c5a1837cf33b55c028d557ec259858b();
            exit;
        }
    }
}

function 0xecfdae1a(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(!(address(varg0) - varg0));
    return mapping_1[address(varg0)];
}

function 0xea3c986d(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(!(address(varg0) - varg0));
    return mapping_3[address(varg0)];
}

function 0xe6ac82d2() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0x1058846c60f6859362a916b9ac3d89a87bcc7068167c55e62515eec51cb0dff8;
}

function 0xe457acdd() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0x18d95d9da8db151379226c1975258bfcd99b3de30e212a3fdf374ed7b277b17f;
}

function 0xe2f48005(uint256 varg0, int24 varg1, int24 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6) public payable { 
    require(msg.data.length - 4 >= 224);
    require(!(address(varg0) - varg0));
    require(!(uint128(varg3) - varg3));
    v0 = v1 = 0;
    require(_isActive, Error(18481));
    require(__operators[msg.sender], Error(18484));
    require(_uniswapV3SwapCallback[address(varg0)], Error(0x483330));
    require(varg6 >= block.timestamp, Error(18488));
    v2, /* uint256 */ v0, /* uint256 */ v0 = address(varg0).mint(this, varg1, varg2, uint128(varg3), 160, v1).value(v1).gas(msg.gas);
    require(v2, MEM[64], RETURNDATASIZE());
    if (v2) {
        if (RETURNDATASIZE() < 64) {
            require(!((MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
            v3 = MEM[64] + RETURNDATASIZE();
        } else {
            require(!((MEM[64] + 64 > uint64.max) | (MEM[64] + 64 < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
            MEM[64] = MEM[64] + 64;
            v3 = v4 = MEM[64] + 64;
        }
        require(v3 - MEM[64] >= 64);
        v5 = this.code.size;
    }
    v6 = v7 = varg4 <= v0;
    if (v7) {
        v6 = v8 = varg5 <= v0;
        v9 = this.code.size;
    }
    require(v6, Error(0x533135));
    return MEM[v25d2:v25d2 + v25d2];
}

function 0xd73c2f66() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return stor_e_0_19;
}

function 0xd368093d(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(!(address(varg0) - varg0));
    return mapping_5[address(varg0)];
}

function uniswapV3MintCallback(uint256 amount0, uint256 amount1, bytes data) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(data <= uint64.max);
    require(4 + data + 31 < msg.data.length);
    require(data.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v0 = new bytes[](data.length);
    require(!((v0 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + data.length) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v0 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + data.length) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v0)), Panic(65)); // failed memory allocation (too much memory)
    require(4 + data + data.length + 32 <= msg.data.length);
    CALLDATACOPY(v0.data, data.data, data.length);
    v0[data.length] = 0;
    v1 = v2 = 0;
    v3 = v4 = 32;
    require(_uniswapV3SwapCallback[msg.sender], Error(0x483330));
    if (amount0) {
        v5 = v6 = MEM[64];
        v7 = msg.sender.token0().gas(msg.gas);
        if (v7) {
            if (v7) {
                v8 = v9 = 9511;
                if (v4 <= RETURNDATASIZE()) {
                    require(!((v6 + 32 > uint64.max) | (v6 + 32 < v6)), Panic(65)); // failed memory allocation (too much memory)
                    MEM[64] = v6 + 32;
                    v10 = v11 = v6 + v4;
                }
            }
        }
    }
    if (v3) {
        v5 = v12 = MEM[64];
        v13 = msg.sender.token1().gas(msg.gas);
        if (v13) {
            if (v13) {
                v8 = v14 = 9367;
                v15 = v16 = 0x17d26;
                v1 = v17 = 0x17d52;
                if (v3 > RETURNDATASIZE()) {
                    // Unknown jump to Block 0x249f0x312. Refer to 3-address code (TAC);
                }
            }
        }
    } else {
        return MEM[v23d7:v23d7 + v23d7];
    }
    RETURNDATACOPY(MEM[64], 0, RETURNDATASIZE());
    revert(MEM[64], RETURNDATASIZE());
    MEM[MEM[64] + v3] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
    MEM[MEM[64] + 36] = msg.sender;
    MEM[MEM[64] + 68] = v3;
    require(!((MEM[64] + 128 > uint64.max) | (MEM[64] + 128 < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
    v18, /* uint256 */ v19 = v1.call(MEM[MEM[64] + v3120x24a1:MEM[64] + v3120x24a1 + 68], MEM[v23d7:v23d7 + v23d7]).value(v2).gas(msg.gas);
    if (RETURNDATASIZE()) {
        require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v20 = v21 = new bytes[](RETURNDATASIZE());
        require(!((v21 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v21 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v21)), Panic(65)); // failed memory allocation (too much memory)
        v19 = v21.data;
        RETURNDATACOPY(v19, 0, RETURNDATASIZE());
    }
    v22 = this.code.size;
    return MEM[v23d7:v23d7 + v23d7];
    require(!((v5 + (v3 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v5 + (v3 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v5)), Panic(65)); // failed memory allocation (too much memory)
    MEM[64] = v5 + (v3 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    v10 = v5 + v3;
    require(v10 - v5 >= 32);
    v1 = MEM[v5];
    require(!(address(v1) - v1));
    // Unknown jump to Block ['0x2497', '0x2527']. Refer to 3-address code (TAC);
    // Unknown jump to Block 0x242d. Refer to 3-address code (TAC);
    v23 = this.code.size;
    v3 = RETURNDATASIZE();
    // Unknown jump to Block 0x24850x312. Refer to 3-address code (TAC);
    MEM[MEM[64] + v3] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
    MEM[MEM[64] + 36] = msg.sender;
    MEM[MEM[64] + 68] = v15;
    require(!((MEM[64] + 128 > uint64.max) | (MEM[64] + 128 < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
    v24 = v1.call(MEM[MEM[64] + v3120x24a1:MEM[64] + v3120x24a1 + 68], MEM[v3120x2b6d:v3120x2b6d + v23d7]).value(v1).gas(msg.gas);
    if (RETURNDATASIZE()) {
        require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v25 = v26 = new bytes[](RETURNDATASIZE());
        require(!((v26 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v26 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v26)), Panic(65)); // failed memory allocation (too much memory)
        RETURNDATACOPY(v26.data, 0, RETURNDATASIZE());
    }
    v27 = this.code.size;
}

function 0xcf1346bc(uint256 varg0, uint256 varg1, bytes varg2) public nonPayable { 
    v0 = v1 = 0x17cac;
    require(msg.data.length - 4 >= 96);
    require(!(address(varg1) - varg1));
    require(varg2 <= uint64.max);
    require(4 + varg2 + 31 < msg.data.length);
    require(varg2.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v2 = new bytes[](varg2.length);
    require(!((v2 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + varg2.length) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v2 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + varg2.length) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v2)), Panic(65)); // failed memory allocation (too much memory)
    require(4 + varg2 + varg2.length + 32 <= msg.data.length);
    CALLDATACOPY(v2.data, varg2.data, varg2.length);
    v2[varg2.length] = 0;
    require(address(0x7ff4ed8ab94c849b812622eb462682208be06b93) == msg.sender, Error(18483));
    if (varg0 - 0x9952537ab17bc321c435545199d81e39dd24481206e94617263826f8d413013e) {
        if (varg0 - 0x9d72fc4d06849ee87a319b3fc6aa1dc9403947e59168f4dbfdd67adeaa6fb3f3) {
            if (varg0 - 0x6cc14d89329abdf9fd3c381ad952536dfd2b607e27c55fd69a131af00c5de588) {
                if (varg0 - 0xda11e33ac8fa5160b7b90b53bdd9ffed455c77446a381338e4bc1673dc8d489) {
                    if (varg0 - 0x18d95d9da8db151379226c1975258bfcd99b3de30e212a3fdf374ed7b277b17f) {
                        if (varg0 - 0xa15540b82ec51595ba5a0eb42fe10614cacbdd68a77f47e067638ec1ecdcad74) {
                            if (varg0 - 0x694f935c77678723ade3382dc6b12cdbad34911e45c1fdf18a2919ca4507229b) {
                                if (varg0 - 0x42b40d72274ce0717425763fa72c9c163c03cc39120843201fe659e2a4ba0ecb) {
                                    if (varg0 - 0x1058846c60f6859362a916b9ac3d89a87bcc7068167c55e62515eec51cb0dff8) {
                                        if (varg0 - 0xa1939ff690b675030353919731519dbbe36f04e2789275a109cc765f66cf2990) {
                                            if (varg0 - 0xfe731b89600e8e0f7e24df75443f6beea0a9215f2b20688a2f38548c0aa52f7a) {
                                                if (varg0 - 0x4a835202d60ca5f5c7b4d843f8f5b32c1010d0101183f53cb87e7278cac1506b) {
                                                    require(!(0x3349cb1d48fb20662e6095e6479f18fe92f1cdcfa7083feba86a52b0e0b47da7 - varg0), Error('UNKNOWN ROLE'));
                                                    require(!bool(stor_f_0_19), Error(0x483230));
                                                    stor_f_0_19 = varg1;
                                                } else {
                                                    require(!bool(stor_e_0_19), Error(0x483230));
                                                    stor_e_0_19 = varg1;
                                                }
                                            } else {
                                                require(!bool(stor_d_0_19), Error(0x483230));
                                                stor_d_0_19 = varg1;
                                            }
                                        } else {
                                            require(!mapping_10[address(varg1)], Error(18489));
                                            mapping_10[address(varg1)] = 1;
                                        }
                                    } else {
                                        require(!mapping_5[address(varg1)], Error(18489));
                                        mapping_5[address(varg1)] = 1;
                                    }
                                } else {
                                    require(!mapping_c[address(varg1)], Error(18489));
                                    mapping_c[address(varg1)] = 1;
                                }
                            } else {
                                v0 = v3 = address(varg2.length);
                                v4 = v5 = MEM[64];
                                v0 = v6 = 32;
                                v0 = v7 = uint160.max;
                                v0 = v8 = address(varg1);
                                v9 = v8.token0().gas(msg.gas);
                                if (v9) {
                                    v0 = v10 = 0;
                                    if (v9) {
                                        v11 = v12 = 12384;
                                        if (v6 <= RETURNDATASIZE()) {
                                            require(!((v5 + 32 > uint64.max) | (v5 + 32 < v5)), Panic(65)); // failed memory allocation (too much memory)
                                            MEM[64] = v5 + 32;
                                            v13 = v14 = v5 + v6;
                                        }
                                    }
                                }
                            }
                        } else {
                            v0 = v15 = address(varg2.length);
                            v4 = v16 = MEM[64];
                            v0 = v17 = 32;
                            v0 = v18 = uint160.max;
                            v0 = v19 = address(varg1);
                            v20 = v19.token0().gas(msg.gas);
                            if (v20) {
                                v0 = v21 = 0;
                                if (v20) {
                                    v11 = v22 = 11947;
                                    if (v17 <= RETURNDATASIZE()) {
                                        require(!((v16 + 32 > uint64.max) | (v16 + 32 < v16)), Panic(65)); // failed memory allocation (too much memory)
                                        MEM[64] = v16 + 32;
                                        v13 = v23 = v16 + v17;
                                    }
                                }
                            }
                        }
                        RETURNDATACOPY(MEM[64], 0, RETURNDATASIZE());
                        revert(MEM[64], RETURNDATASIZE());
                        v4 = v24 = MEM[64];
                        v25 = v0.token1().gas(msg.gas);
                        if (v25) {
                            v0 = v26 = 11823;
                            v0 = v27 = 0;
                            if (v25) {
                                v11 = v28 = 11916;
                                if (v0 <= RETURNDATASIZE()) {
                                    v29 = v24 + (v0 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                                    require(!((v29 > uint64.max) | (v29 < v24)), Panic(65)); // failed memory allocation (too much memory)
                                    MEM[64] = v29;
                                    v13 = v30 = v24 + v0;
                                }
                            }
                        }
                        v4 = v31 = MEM[64];
                        v32 = v0.getPair(address(v0), address(v0)).gas(msg.gas);
                        if (v32) {
                            v0 = v33 = 0x18069;
                            v0 = v34 = 11858;
                            v0 = v35 = 0;
                            if (v32) {
                                v11 = v36 = 11885;
                                if (RETURNDATASIZE() >= v0) {
                                    v37 = v31 + (v0 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                                    require(!((v37 > uint64.max) | (v37 < v31)), Panic(65)); // failed memory allocation (too much memory)
                                    MEM[64] = v37;
                                    v13 = v38 = v31 + v0;
                                }
                            }
                        }
                        require(v0 & v0 == v0, Error(0x483332));
                        require(!mapping_a[address(v0)], Error(18489));
                        mapping_a[address(v0)] = 1;
                        // Unknown jump to Block 0x17cac. Refer to 3-address code (TAC);
                        require(!((v4 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v4 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v4)), Panic(65)); // failed memory allocation (too much memory)
                        MEM[64] = v4 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                        v13 = v39 = v4 + RETURNDATASIZE();
                        require(v13 - v4 >= 32);
                        v0 = v40 = MEM[v4];
                        require(!(address(v40) - v40));
                        // Unknown jump to Block ['0x2e6dB0x239a', '0x2e8cB0x239a', '0x2eabB0x239a', '0x2ff5B0x239a', '0x3042B0x239a', '0x3060B0x239a']. Refer to 3-address code (TAC);
                        v41 = this.code.size;
                        // Unknown jump to Block 0x2e49B0x239a. Refer to 3-address code (TAC);
                        v42 = this.code.size;
                        // Unknown jump to Block 0x2dfaB0x239a. Refer to 3-address code (TAC);
                        v43 = this.code.size;
                        // Unknown jump to Block 0x2dceB0x239a. Refer to 3-address code (TAC);
                        v44 = this.code.size;
                        // Unknown jump to Block 0x2fd1B0x239a. Refer to 3-address code (TAC);
                        v45 = this.code.size;
                        v46 = this.code.size;
                        // Unknown jump to Block 0x2f25B0x239a. Refer to 3-address code (TAC);
                        v4 = v47 = MEM[64];
                        v48 = v0.token1().gas(msg.gas);
                        if (v48) {
                            v0 = v49 = 0;
                            if (v48) {
                                v11 = v50 = 12354;
                                if (v0 <= RETURNDATASIZE()) {
                                    v51 = v47 + (v0 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                                    require(!((v51 > uint64.max) | (v51 < v47)), Panic(65)); // failed memory allocation (too much memory)
                                    MEM[64] = v51;
                                    v13 = v52 = v47 + v0;
                                }
                            }
                        }
                        v53 = v0.fee().gas(msg.gas);
                        if (v53) {
                            v54 = v55 = 0;
                            if (v53) {
                                if (v0 > RETURNDATASIZE()) {
                                    v0 = v56 = RETURNDATASIZE();
                                }
                                v57 = MEM[64] + (v0 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                                require(!((v57 > uint64.max) | (v57 < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                                MEM[64] = v57;
                                require(MEM[64] + v0 - MEM[64] >= 32);
                                require(!0xddca3f4300000000000000000000000000000000000000000000000000000000);
                                v58 = this.code.size;
                            }
                            v4 = v59 = MEM[64];
                            v60 = v0.getPool(address(v0), address(v0), uint24(v54)).gas(msg.gas);
                            if (v60) {
                                v0 = v61 = 0x1812a;
                                v0 = v62 = 12250;
                                v0 = v63 = 0;
                                if (v60) {
                                    v11 = v64 = 12277;
                                    if (RETURNDATASIZE() >= v0) {
                                        v65 = v59 + (v0 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                                        require(!((v65 > uint64.max) | (v65 < v59)), Panic(65)); // failed memory allocation (too much memory)
                                        MEM[64] = v65;
                                        v13 = v66 = v59 + v0;
                                    }
                                }
                            }
                        }
                        require(v0 & v0 == v0, Error(0x483333));
                        require(!_uniswapV3SwapCallback[address(v0)], Error(18489));
                        _uniswapV3SwapCallback[address(v0)] = 1;
                        // Unknown jump to Block 0x17cac. Refer to 3-address code (TAC);
                    } else {
                        require(!bool(mapping_7[address(varg1)]), Error(18489));
                        if (0 != !mapping_7[address(varg1)]) {
                            require(array_6.length < uint64.max + 1, Panic(65)); // failed memory allocation (too much memory)
                            array_6.length = array_6.length + 1;
                            require(array_6.length < array_6.length + 1, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                            array_6[array_6.length] = address(varg1);
                            mapping_7[address(varg1)] = array_6.length;
                        }
                    }
                } else {
                    require(!mapping_4[address(varg1)], Error(18489));
                    mapping_4[address(varg1)] = 1;
                }
            } else {
                require(!mapping_1[address(varg1)], Error(18489));
                mapping_1[address(varg1)] = 1;
            }
        } else {
            require(!mapping_3[address(varg1)], Error(18489));
            mapping_3[address(varg1)] = 1;
        }
    } else {
        require(!__operators[address(varg1)], Error(18489));
        __operators[address(varg1)] = 1;
    }
}

function 0xc4da52dc(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) public nonPayable { 
    require(msg.data.length - 4 >= 160);
    require(!(address(varg0) - varg0));
    require(!(address(varg1) - varg1));
    require(!(address(varg2) - varg2));
    require(mapping_c[msg.sender], Error(18487));
    require(__operators[tx.origin], Error(0x483331));
    v0 = new bytes[](68);
    MEM[v0.data] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
    MEM[v0 + 36] = msg.sender;
    MEM[v0 + 68] = varg3;
    require(!((v0 + 128 > uint64.max) | (v0 + 128 < v0)), Panic(65)); // failed memory allocation (too much memory)
    v1 = v0.length;
    v2, /* uint256 */ v3 = varg2.transfer(msg.sender, varg3).gas(msg.gas);
    if (RETURNDATASIZE()) {
        require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v4 = v5 = new bytes[](RETURNDATASIZE());
        require(!((v5 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v5 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v5)), Panic(65)); // failed memory allocation (too much memory)
        v3 = v5.data;
        RETURNDATACOPY(v3, 0, RETURNDATASIZE());
    }
    return ;
}

function 0xc249597c() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0xa1939ff690b675030353919731519dbbe36f04e2789275a109cc765f66cf2990;
}

function 0xbb25faea(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(!(address(varg0) - varg0));
    return mapping_c[address(varg0)];
}

function 0xb87d3b28(uint256 varg0, uint256 varg1, int24 varg2, int24 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7) public payable { 
    require(msg.data.length - 4 >= uint8.max + 1);
    require(!(address(varg1) - varg1));
    require(!(uint128(varg4) - varg4));
    v0 = v1 = 0;
    require(_isActive, Error(18481));
    v2 = v3 = 64;
    require(__operators[msg.sender], Error(18484));
    require(_uniswapV3SwapCallback[address(varg1)], Error(0x483330));
    require(varg7 >= block.timestamp, Error(18488));
    v4, /* uint256 */ v0, /* uint256 */ v0 = address(varg1).burn(varg2, varg3, uint128(varg4)).value(v1).gas(msg.gas);
    if (v4) {
        if (v4) {
            if (v3 > RETURNDATASIZE()) {
                require(!((MEM[v3] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[v3] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[v3])), Panic(65)); // failed memory allocation (too much memory)
                MEM[64] = MEM[v3] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                v5 = MEM[v3] + RETURNDATASIZE();
            } else {
                require(!((MEM[v3] + 64 > uint64.max) | (MEM[v3] + 64 < MEM[v3])), Panic(65)); // failed memory allocation (too much memory)
                MEM[64] = MEM[v3] + 64;
                v5 = v6 = MEM[v3] + v3;
            }
            require(v5 - MEM[v3] >= 64);
            v7 = this.code.size;
        }
        v8 = v9 = varg5 <= v0;
        if (v9) {
            v8 = v10 = varg6 <= v0;
            v11 = this.code.size;
        }
        require(v8, Error(0x533135));
        v12, /* uint256 */ v13, v14 = address(varg1).collect(this, varg2, varg3, uint128.max, uint128.max).value(v1).gas(msg.gas);
        if (v12) {
            if (v12) {
                if (RETURNDATASIZE() < v3) {
                    v2 = v15 = RETURNDATASIZE();
                }
                require(!((MEM[v3] + (v2 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[v3] + (v2 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[v3])), Panic(65)); // failed memory allocation (too much memory)
                MEM[64] = MEM[v3] + (v2 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                require(MEM[v3] + v2 - MEM[v3] >= 64);
                require(!(uint128(v14) - v14));
            }
            0x4906(varg0);
            return MEM[v207b:v207b + v207b];
        }
    }
    revert(MEM[64], RETURNDATASIZE());
}

function 0xb221bd4b() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0x9d72fc4d06849ee87a319b3fc6aa1dc9403947e59168f4dbfdd67adeaa6fb3f3;
}

function 0xb0c39a1e() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    0x4d81();
}

function wrapEth(uint256 amount) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(_isActive, Error(18481));
    require(mapping_3[msg.sender], Error(0x483238));
    require(!0, Panic(65)); // failed memory allocation (too much memory)
    v0 = v1.length;
    v2, /* uint256 */ v3 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.deposit().value(amount).gas(msg.gas);
    if (RETURNDATASIZE()) {
        require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v4 = v5 = new bytes[](RETURNDATASIZE());
        require(!((v5 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v5 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v5)), Panic(65)); // failed memory allocation (too much memory)
        v3 = v5.data;
        RETURNDATACOPY(v3, 0, RETURNDATASIZE());
    }
    require(v2, Error(0x483134));
    return ;
}

function 0xada00694() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = MEM[64] + 32;
    v2 = v3 = 0;
    v4 = v5 = array_6.data;
    while (v2 < array_6.length) {
        MEM[v0] = STORAGE[v4];
        v0 += 32;
        v4 += 1;
        v2 = v2 + 1;
    }
    require(!((MEM[64] + (v0 - MEM[64] + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (v0 - MEM[64] + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
    v6 = new uint256[](array_6.length);
    v7 = v8 = v6.data;
    v9 = MEM[64] + 32;
    v10 = 0;
    while (v10 < array_6.length) {
        MEM[v7] = address(MEM[v9]);
        v7 += 32;
        v9 += 32;
        v10 += 1;
    }
    return v6;
}

function 0xa93f9118() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0x6cc14d89329abdf9fd3c381ad952536dfd2b607e27c55fd69a131af00c5de588;
}

function 0xa5fd3043() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    0x3d56();
}

function 0xa1c20303(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5) public payable { 
    require(msg.data.length - 4 >= 192);
    require(!(address(varg1) - varg1));
    require(!(address(varg2) - varg2));
    require(_isActive, Error(18481));
    require(mapping_a[address(varg1)], Error(0x483239));
    require(__operators[msg.sender], Error(18484));
    v0 = new bytes[](68);
    MEM[v0.data] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
    MEM[v0 + 36] = address(varg1);
    MEM[v0 + 68] = varg3;
    require(!((v0 + 128 > uint64.max) | (v0 + 128 < v0)), Panic(65)); // failed memory allocation (too much memory)
    v1 = v0.length;
    v2, /* uint256 */ v3 = varg2.transfer(address(varg1), varg3).gas(msg.gas);
    if (RETURNDATASIZE()) {
        require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v4 = v5 = new bytes[](RETURNDATASIZE());
        require(!((v5 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v5 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v5)), Panic(65)); // failed memory allocation (too much memory)
        v3 = v5.data;
        RETURNDATACOPY(v3, 0, RETURNDATASIZE());
    }
    require((address(varg1)).code.size);
    v6 = address(varg1).swap(varg4, varg5, this, 128, 0).gas(msg.gas);
    require(v6, MEM[64], RETURNDATASIZE());
    if (v6) {
        require(MEM[64] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = MEM[64];
        require(0 >= 0);
        v7 = this.code.size;
    }
    0x4906(varg0);
    return ;
}

function 0xa03dc130() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0xfe731b89600e8e0f7e24df75443f6beea0a9215f2b20688a2f38548c0aa52f7a;
}

function 0x8b954c70() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    require(_isActive, Error(18481));
    require(address(0xce466fc694c971b95bb1193e494942e22197f759) == msg.sender, Error(18482));
    require(!bool(!stor_d_0_19), Error(0x483234));
    require(!bool(!stor_e_0_19), Error(0x483235));
    require(!stor_f_20_20, Error(0x483236));
    require(stor_e_0_19.code.size);
    v0 = stor_e_0_19.authorize(stor_d_0_19).gas(msg.gas);
    require(v0, MEM[64], RETURNDATASIZE());
    if (v0) {
        require(MEM[64] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = MEM[64];
        require(0 >= 0);
        v1 = this.code.size;
    }
    stor_f_20_20 = 1;
    emit 0x717203b0e529d7cc48154e71e317def96cff5eb5ed463f2c21f347ae347b5802();
    return ;
}

function 0x771d503f(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, bytes varg5) public payable { 
    require(msg.data.length - 4 >= 192);
    require(!(address(varg1) - varg1));
    require(!(bool(varg4) - varg4));
    require(varg5 <= uint64.max);
    require(4 + varg5 + 31 < msg.data.length);
    require(varg5.length <= uint64.max);
    require(4 + varg5 + varg5.length + 32 <= msg.data.length);
    v0 = v1 = 0;
    require(_isActive, Error(18481));
    v2 = v3 = 64;
    require(_uniswapV3SwapCallback[address(varg1)], Error(0x483330));
    require(__operators[msg.sender], Error(18484));
    if (!varg4) {
        v4 = v5 = 0xfffd8963efd1fc6a506488495d951d5263988d25;
    } else {
        v4 = 0x1000276a4;
    }
    v6 = new uint256[](varg5.length);
    CALLDATACOPY(v6.data, varg5.data, varg5.length);
    MEM[192 + (varg5.length + (MEM[v3] + 4))] = 0;
    v7, /* uint256 */ v0, /* uint256 */ v0 = address(varg1).swap(address(this), bool(varg4), varg2, address(v4), v6).value(v1).gas(msg.gas);
    require(v7, MEM[64], RETURNDATASIZE());
    if (v7) {
        if (RETURNDATASIZE() < v3) {
            v2 = RETURNDATASIZE();
        }
        require(!((MEM[v3] + (v2 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[v3] + (v2 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[v3])), Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = MEM[v3] + (v2 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
        require(MEM[v3] + v2 - MEM[v3] >= 64);
        v8 = this.code.size;
    }
    if (v0 <= v1) {
        v9 = v10 = 0x4875(v0);
    } else {
        v9 = v11 = 0x4875(v0);
    }
    require(varg3 <= v9, Error(0x533133));
    0x4906(varg0);
    return MEM[v1cbc:v1cbc + v1cbc];
}

function 0x6d66ea05() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    0x4f1f();
}

function unkillContract() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    require(address(0xce466fc694c971b95bb1193e494942e22197f759) == msg.sender, Error(18482));
    _isActive = 1;
    return ;
}

function 0x692e3a95() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return stor_d_0_19;
}

function 0x6650eb1e(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(!(address(varg0) - varg0));
    return mapping_a[address(varg0)];
}

function 0x628bcd8b() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return stor_f_0_19;
}

function 0x5bc6665d(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(!(address(varg0) - varg0));
    return _uniswapV3SwapCallback[address(varg0)];
}

function 0x5afcf03d(uint256 varg0, uint256 varg1, int128 varg2, int128 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7) public payable { 
    require(msg.data.length - 4 >= uint8.max + 1);
    require(!(address(varg1) - varg1));
    require(!(bool(varg6) - varg6));
    v0 = v1 = 0;
    require(_isActive, Error(18481));
    require(mapping_c[address(varg1)], Error(18487));
    require(__operators[msg.sender], Error(18484));
    require(block.timestamp <= varg7, Error(18488));
    if (!varg6) {
        require((address(varg1)).code.size, v1, v1);
        v2 = v3 = MEM[64];
        MEM[v3] = 0x3df0212400000000000000000000000000000000000000000000000000000000;
        MEM[v3 + 4] = varg2;
        MEM[v3 + 36] = varg3;
        MEM[v3 + 68] = varg4;
        MEM[v3 + 100] = varg5;
        v4 = v5 = v3 + 132;
    } else {
        require((address(varg1)).code.size, v1, v1);
        v2 = v6 = MEM[64];
        MEM[v6] = 0x3df0212400000000000000000000000000000000000000000000000000000000;
        MEM[v6 + 4] = varg2;
        MEM[v6 + 36] = varg3;
        MEM[v6 + 68] = varg4;
        MEM[v6 + 100] = varg5;
        v4 = v7 = v6 + 132;
    }
    v8 = address(varg1).call(MEM[v17a84_0x0:v17a84_0x0 + v1ac2_0x0 - v17a84_0x0], MEM[v17a84_0x0:v17a84_0x0 + v1a28]).value(v0).gas(msg.gas);
    require(v8, MEM[64], RETURNDATASIZE());
    if (v8) {
        require(v2 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = v2;
        require(v2 - v2 >= 0);
        v9 = this.code.size;
    }
    if (varg0) {
        require(mapping_5[block.coinbase], Error(0x483137));
        v10, /* uint256 */ v11 = block.coinbase.call().value(varg0);
        if (RETURNDATASIZE()) {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v12 = v13 = new bytes[](RETURNDATASIZE());
            require(!((v13 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v13 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v13)), Panic(65)); // failed memory allocation (too much memory)
            v11 = v13.data;
            RETURNDATACOPY(v11, 0, RETURNDATASIZE());
        }
    }
    return MEM[v1a28:v1a28 + v1a28];
}

function 0x59733e7f(uint256 varg0, uint256 varg1, bytes varg2) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(!(address(varg1) - varg1));
    require(varg2 <= uint64.max);
    require(4 + varg2 + 31 < msg.data.length);
    require(varg2.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v0 = new bytes[](varg2.length);
    require(!((v0 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + varg2.length) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v0 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + varg2.length) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v0)), Panic(65)); // failed memory allocation (too much memory)
    require(4 + varg2 + varg2.length + 32 <= msg.data.length);
    CALLDATACOPY(v0.data, varg2.data, varg2.length);
    v0[varg2.length] = 0;
    require(address(0x7ff4ed8ab94c849b812622eb462682208be06b93) == msg.sender, Error(18483));
    if (varg0 - 0x9952537ab17bc321c435545199d81e39dd24481206e94617263826f8d413013e) {
        if (varg0 - 0x9d72fc4d06849ee87a319b3fc6aa1dc9403947e59168f4dbfdd67adeaa6fb3f3) {
            if (varg0 - 0x6cc14d89329abdf9fd3c381ad952536dfd2b607e27c55fd69a131af00c5de588) {
                if (varg0 - 0xda11e33ac8fa5160b7b90b53bdd9ffed455c77446a381338e4bc1673dc8d489) {
                    if (varg0 - 0x18d95d9da8db151379226c1975258bfcd99b3de30e212a3fdf374ed7b277b17f) {
                        if (varg0 - 0xa15540b82ec51595ba5a0eb42fe10614cacbdd68a77f47e067638ec1ecdcad74) {
                            if (varg0 - 0x694f935c77678723ade3382dc6b12cdbad34911e45c1fdf18a2919ca4507229b) {
                                if (varg0 - 0x42b40d72274ce0717425763fa72c9c163c03cc39120843201fe659e2a4ba0ecb) {
                                    if (varg0 - 0x1058846c60f6859362a916b9ac3d89a87bcc7068167c55e62515eec51cb0dff8) {
                                        if (varg0 - 0xa1939ff690b675030353919731519dbbe36f04e2789275a109cc765f66cf2990) {
                                            if (varg0 - 0xfe731b89600e8e0f7e24df75443f6beea0a9215f2b20688a2f38548c0aa52f7a) {
                                                if (varg0 - 0x4a835202d60ca5f5c7b4d843f8f5b32c1010d0101183f53cb87e7278cac1506b) {
                                                    require(!(0x3349cb1d48fb20662e6095e6479f18fe92f1cdcfa7083feba86a52b0e0b47da7 - varg0), Error('UNKNOWN ROLE'));
                                                    require(stor_f_0_19 == address(varg1), Error(0x483130));
                                                    if (stor_f_21_21) {
                                                        0x4f1f();
                                                    }
                                                    stor_f_0_19 = 0;
                                                    exit;
                                                } else {
                                                    require(stor_e_0_19 == address(varg1), Error(0x483130));
                                                    if (stor_f_20_20) {
                                                        0x4d81();
                                                    }
                                                    stor_e_0_19 = 0;
                                                    exit;
                                                }
                                            } else {
                                                require(stor_d_0_19 == address(varg1), Error(0x483130));
                                                if (stor_f_20_20) {
                                                    0x4d81();
                                                }
                                                if (stor_f_21_21) {
                                                    0x4f1f();
                                                }
                                                stor_d_0_19 = 0;
                                                exit;
                                            }
                                        } else {
                                            require(mapping_10[address(varg1)], Error(0x483130));
                                            mapping_10[address(varg1)] = 0;
                                            exit;
                                        }
                                    } else {
                                        require(mapping_5[address(varg1)], Error(0x483130));
                                        mapping_5[address(varg1)] = 0;
                                        exit;
                                    }
                                } else {
                                    require(mapping_c[address(varg1)], Error(0x483130));
                                    mapping_c[address(varg1)] = 0;
                                    exit;
                                }
                            } else {
                                require(_uniswapV3SwapCallback[address(varg1)], Error(0x483130));
                                _uniswapV3SwapCallback[address(varg1)] = 0;
                                exit;
                            }
                        } else {
                            require(mapping_a[address(varg1)], Error(0x483130));
                            mapping_a[address(varg1)] = 0;
                            exit;
                        }
                    } else {
                        require(!bool(!mapping_7[address(varg1)]), Error(0x483130));
                        require(!bool(!mapping_7[address(varg1)]), Error(32, 0));
                        v1 = v2 = 0;
                        while (1) {
                            if (v1 >= _getAllApprovedTokens.length) {
                                v3 = 0x4215(address(varg1));
                                emit 0xeffe39084a0f43b67972c81cfec3f2516c5a1837cf33b55c028d557ec259858b();
                                exit;
                            } else {
                                require(v1 < _getAllApprovedTokens.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                                v4, /* uint256 */ v5 = address(_getAllApprovedTokens[v1]).allowance(this, address(varg1)).gas(msg.gas);
                                require(v4, v6, RETURNDATASIZE());
                                v5 = v7 = 0;
                                if (v4) {
                                    if (32 > RETURNDATASIZE()) {
                                        require(!((MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                                        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                                        v8 = MEM[64] + RETURNDATASIZE();
                                    } else {
                                        require(!((MEM[64] + 32 > uint64.max) | (MEM[64] + 32 < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                                        MEM[64] = MEM[64] + 32;
                                        v8 = v9 = MEM[64] + 32;
                                    }
                                    require(v8 - MEM[64] >= 32);
                                    v10 = this.code.size;
                                }
                                if (v5) {
                                    v11 = new bytes[](68);
                                    MEM[v11.data] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                                    MEM[v11 + 36] = address(varg1);
                                    MEM[v11 + 68] = 0;
                                    require(!((v11 + 128 > uint64.max) | (v11 + 128 < v11)), Panic(65)); // failed memory allocation (too much memory)
                                    v12 = v11.length;
                                    v13, /* uint256 */ v6, /* uint256 */ v14 = address(_getAllApprovedTokens[v1]).approve(address(varg1), 0).gas(msg.gas);
                                    if (!RETURNDATASIZE()) {
                                        v15 = v16 = 96;
                                    } else {
                                        require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                                        v15 = v17 = new bytes[](RETURNDATASIZE());
                                        require(!((v17 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v17 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v17)), Panic(65)); // failed memory allocation (too much memory)
                                        v14 = v17.data;
                                        RETURNDATACOPY(v14, 0, RETURNDATASIZE());
                                    }
                                    v18 = v19 = !v13;
                                    if (bool(v13)) {
                                        v18 = v20 = bool(MEM[v15]);
                                        if (v20) {
                                            require(v15 + MEM[v15] + 32 - (v15 + 32) >= 32);
                                            require(!(bool(MEM[v15 + 32]) - MEM[v15 + 32]));
                                            v18 = v21 = !MEM[v15 + 32];
                                            v22 = this.code.size;
                                        }
                                        v23 = this.code.size;
                                    }
                                    if (v18) {
                                        emit 0x1685a34ffb3f2b177d05a4af1cbabd9ca2d1e2977ec14a80189b8d0f3b58b4f3(address(_getAllApprovedTokens[v1]), address(varg1));
                                        v24 = this.code.size;
                                    }
                                }
                                require(v1 != uint256.max, Panic(17)); // arithmetic overflow or underflow
                                v1 += 1;
                            }
                        }
                    }
                } else {
                    require(mapping_4[address(varg1)], Error(0x483130));
                    mapping_4[address(varg1)] = 0;
                    exit;
                }
            } else {
                require(mapping_1[address(varg1)], Error(0x483130));
                mapping_1[address(varg1)] = 0;
                exit;
            }
        } else {
            require(mapping_3[address(varg1)], Error(0x483130));
            mapping_3[address(varg1)] = 0;
            exit;
        }
    } else {
        require(__operators[address(varg1)], Error(0x483130));
        __operators[address(varg1)] = 0;
        exit;
    }
}

function 0x48ea3731() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0x42b40d72274ce0717425763fa72c9c163c03cc39120843201fe659e2a4ba0ecb;
}

function 0x484e39c3(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6) public payable { 
    require(msg.data.length - 4 >= 224);
    require(!(address(varg1) - varg1));
    require(_isActive, Error(18481));
    require(varg6 >= block.timestamp, Error(18488));
    require(_isActive, Error(18481));
    require(mapping_c[address(varg1)], Error(18487));
    require(__operators[msg.sender], Error(18484));
    require((address(varg1)).code.size);
    v0 = address(varg1).setMetaGold(varg2, varg3, varg4, varg5).gas(msg.gas);
    require(v0, MEM[64], RETURNDATASIZE());
    if (v0) {
        require(MEM[64] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = MEM[64];
        v1 = this.code.size;
        0x4906(varg0);
        return ;
    } else {
        0x4906(varg0);
        return ;
    }
}

function 0x481c42a2() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0x15180;
}

function operatorRole() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0x9952537ab17bc321c435545199d81e39dd24481206e94617263826f8d413013e;
}

function 0x39b3(uint256 varg0) private { 
    require(varg0 != uint256.max, Panic(17)); // arithmetic overflow or underflow
    return 1 + varg0;
}

function 0x4103f237() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0x4a835202d60ca5f5c7b4d843f8f5b32c1010d0101183f53cb87e7278cac1506b;
}

function 0x3cbe46f8(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 <= uint64.max);
    require(varg0 + 35 < msg.data.length);
    require(varg0.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v0 = new uint256[](varg0.length);
    require(!((v0 + (32 + (varg0.length << 5) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v0 + (32 + (varg0.length << 5) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v0)), Panic(65)); // failed memory allocation (too much memory)
    v1 = v2 = v0.data;
    require(varg0 + varg0.length * 96 + 36 <= msg.data.length);
    v3 = v4 = varg0.data;
    while (v3 < varg0 + varg0.length * 96 + 36) {
        require(msg.data.length - v3 >= 96);
        v5 = new struct(3);
        require(!((v5 + 96 > uint64.max) | (v5 + 96 < v5)), Panic(65)); // failed memory allocation (too much memory)
        require(!(address(msg.data[v3]) - msg.data[v3]));
        v5.word0 = msg.data[v3];
        require(!(address(msg.data[v3 + 32]) - msg.data[v3 + 32]));
        v5.word1 = msg.data[v3 + 32];
        v5.word2 = msg.data[v3 + 64];
        MEM[v1] = v5;
        v1 = v1 + 32;
        v3 = v3 + 96;
    }
    require(address(0xce466fc694c971b95bb1193e494942e22197f759) == msg.sender, Error(18482));
    require(_isActive, Error(18481));
    v6 = v7 = 0;
    while (1) {
        if (v6 >= v0.length) {
            emit 0x6e51976d6c66289e9cebe969e4fdee35ad9987c148075924ee7be63811028e93();
            exit;
        } else {
            require(v6 < v0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require(v6 < v0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require(!bool(!mapping_7[address(MEM[v0[v6]])]), Error(0x483132));
            require(v6 < v0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require(v6 < v0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            v8 = v9 = !MEM[v0[v6] + 64];
            if (bool(MEM[v0[v6] + 64])) {
                v10, /* uint256 */ v11 = address(MEM[v0[v6] + 32]).allowance(this, address(MEM[v0[v6]])).gas(msg.gas);
                if (!v10) {
                    RETURNDATACOPY(MEM[64], 0, RETURNDATASIZE());
                    revert(MEM[64], RETURNDATASIZE());
                } else {
                    v11 = v12 = 0;
                    if (v10) {
                        if (32 > RETURNDATASIZE()) {
                            require(!((MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                            v13 = MEM[64] + RETURNDATASIZE();
                        } else {
                            require(!((MEM[64] + 32 > uint64.max) | (MEM[64] + 32 < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                            MEM[64] = MEM[64] + 32;
                            v13 = v14 = MEM[64] + 32;
                        }
                        require(v13 - MEM[64] >= 32);
                        v15 = this.code.size;
                    }
                    v8 = v16 = !v11;
                }
            }
            require(v8, Error('SafeERC20: approve from non-zero to non-zero allowance'));
            v17 = new bytes[](68);
            MEM[v17.data] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
            MEM[v17 + 36] = address(MEM[v0[v6]]);
            MEM[v17 + 68] = MEM[v0[v6] + 64];
            require(!((v17 + 128 > uint64.max) | (v17 + 128 < v17)), Panic(65)); // failed memory allocation (too much memory)
            require(!(('SafeERC20: low-level call failed' + 64 > uint64.max) | ('SafeERC20: low-level call failed' + 64 < 'SafeERC20: low-level call failed')), Panic(65)); // failed memory allocation (too much memory)
            require((address(MEM[v0[v6] + 32])).code.size, Error('Address: call to non-contract'));
            v18 = v17.length;
            v19 = v17.data;
            v20 = address(MEM[v0[v6] + 32]).approve(address(MEM[v0[v6]]), MEM[v0[v6] + 64]).gas(msg.gas);
            if (!RETURNDATASIZE()) {
                v21 = v22 = 96;
            } else {
                require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                v21 = v23 = new bytes[](RETURNDATASIZE());
                require(!((v23 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v23 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v23)), Panic(65)); // failed memory allocation (too much memory)
                RETURNDATACOPY(v23.data, 0, RETURNDATASIZE());
            }
            if (!v20) {
                require(!MEM[v21], 32 + v21, MEM[v21]);
                v24 = new bytes[](v25.length);
                v26 = v27 = 0;
                while (v26 < v25.length) {
                    v24[v26] = v25[v26];
                    v26 += 32;
                }
                v24[v25.length] = 0;
                revert(Error(v24));
            } else {
                if (MEM[v21]) {
                    require(v21 + MEM[v21] + 32 - (v21 + 32) >= 32);
                    require(!(bool(MEM[v21 + 32]) - MEM[v21 + 32]));
                    require(MEM[v21 + 32], Error('SafeERC20: ERC20 operation did not succeed'));
                }
                require(v6 < v0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                if (0 != !mapping_9[address(MEM[v0[v6] + 32])]) {
                    require(_getAllApprovedTokens.length < uint64.max + 1, Panic(65)); // failed memory allocation (too much memory)
                    _getAllApprovedTokens.length = _getAllApprovedTokens.length + 1;
                    require(_getAllApprovedTokens.length < _getAllApprovedTokens.length + 1, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                    _getAllApprovedTokens[_getAllApprovedTokens.length] = address(MEM[v0[v6] + 32]);
                    mapping_9[address(MEM[v0[v6] + 32])] = _getAllApprovedTokens.length;
                }
                require(v6 != uint256.max, Panic(17)); // arithmetic overflow or underflow
                v6 += 1;
            }
        }
    }
}

function 0x3c54863c() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0xa15540b82ec51595ba5a0eb42fe10614cacbdd68a77f47e067638ec1ecdcad74;
}

function 0x3bb6ea1e() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0x694f935c77678723ade3382dc6b12cdbad34911e45c1fdf18a2919ca4507229b;
}

function transferTo(address[] _to, uint256[] _tokens, address[] _contract) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(_to <= uint64.max);
    require(_to + 35 < msg.data.length);
    require(_to.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v0 = new uint256[](_to.length);
    require(!((v0 + (32 + (_to.length << 5) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v0 + (32 + (_to.length << 5) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v0)), Panic(65)); // failed memory allocation (too much memory)
    v1 = v2 = v0.data;
    require(_to + (_to.length << 5) + 36 <= msg.data.length);
    v3 = v4 = _to.data;
    while (v3 < _to + (_to.length << 5) + 36) {
        require(!(address(msg.data[v3]) - msg.data[v3]));
        MEM[v1] = msg.data[v3];
        v1 = v1 + 32;
        v3 = v3 + 32;
    }
    require(_tokens <= uint64.max);
    require(4 + _tokens + 31 < msg.data.length);
    require(_tokens.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v5 = new uint256[](_tokens.length);
    require(!((v5 + (32 + (_tokens.length << 5) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v5 + (32 + (_tokens.length << 5) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v5)), Panic(65)); // failed memory allocation (too much memory)
    v6 = v7 = v5.data;
    require(4 + _tokens + (_tokens.length << 5) + 32 <= msg.data.length);
    v8 = _tokens.data;
    while (v8 < 4 + _tokens + (_tokens.length << 5) + 32) {
        MEM[v6] = msg.data[v8];
        v8 += 32;
        v6 += 32;
    }
    require(_contract <= uint64.max);
    require(4 + _contract + 31 < msg.data.length);
    require(_contract.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v9 = new uint256[](_contract.length);
    require(!((v9 + (32 + (_contract.length << 5) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v9 + (32 + (_contract.length << 5) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v9)), Panic(65)); // failed memory allocation (too much memory)
    v10 = v11 = v9.data;
    require(4 + _contract + (_contract.length << 5) + 32 <= msg.data.length);
    v12 = _contract.data;
    while (v12 < 4 + _contract + (_contract.length << 5) + 32) {
        require(!(address(msg.data[v12]) - msg.data[v12]));
        MEM[v10] = msg.data[v12];
        v10 = v10 + 32;
        v12 = v12 + 32;
    }
    v13 = v14 = 0;
    require(_isActive, Error(18481));
    require(mapping_1[msg.sender], Error(18485));
    while (1) {
        if (v13 >= v9.length) {
            break;
        } else {
            require(v13 < v9.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require(mapping_4[address(v9[v13])], Error(18486));
            v13 = 0x39b3(v13);
        }
    }
    require(v5.length == v0.length, Error(0x483135));
    require(v9.length == v5.length, Error(0x483135));
    while (1) {
        if (v13 >= v0.length) {
            break;
        } else {
            require(v13 < v0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require(v13 < v9.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require(v13 < v5.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            v15 = new bytes[](68);
            MEM[v15.data] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
            MEM[v15 + 36] = address(v9[v13]);
            MEM[v15 + 68] = v5[v13];
            require(!((v15 + 128 > uint64.max) | (v15 + 128 < v15)), Panic(65)); // failed memory allocation (too much memory)
            require(!(('SafeERC20: low-level call failed' + 64 > uint64.max) | ('SafeERC20: low-level call failed' + 64 < 'SafeERC20: low-level call failed')), Panic(65)); // failed memory allocation (too much memory)
            require((address(v0[v13])).code.size, Error('Address: call to non-contract'));
            v16 = v15.length;
            v17 = v15.data;
            v18, /* uint256 */ v19 = address(v0[v13]).transfer(address(v9[v13]), v5[v13]).gas(msg.gas);
            if (!RETURNDATASIZE()) {
                v20 = v21 = 96;
            } else {
                require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                v20 = new bytes[](RETURNDATASIZE());
                require(!((v20 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v20 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v20)), Panic(65)); // failed memory allocation (too much memory)
                v19 = v20.data;
                RETURNDATACOPY(v19, 0, RETURNDATASIZE());
            }
            if (!v18) {
                require(!MEM[v20], 32 + v20, MEM[v20]);
                v22 = new bytes[](v23.length);
                v24 = v25 = 0;
                while (v24 < v23.length) {
                    v22[v24] = v23[v24];
                    v24 += 32;
                }
                v22[v23.length] = 0;
                revert(Error(v22));
            } else {
                if (MEM[v20]) {
                    require(v20 + MEM[v20] + 32 - (v20 + 32) >= 32);
                    require(!(bool(MEM[v20 + 32]) - MEM[v20 + 32]));
                    require(MEM[v20 + 32], Error('SafeERC20: ERC20 operation did not succeed'));
                }
                v13 = 0x39b3(v13);
            }
        }
        exit;
    }
}

function 0x3794bbc4() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0xda11e33ac8fa5160b7b90b53bdd9ffed455c77446a381338e4bc1673dc8d489;
}

function 0x34248ee5() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    require(_isActive, Error(18481));
    require(address(0xce466fc694c971b95bb1193e494942e22197f759) == msg.sender, Error(18482));
    require(!bool(!stor_d_0_19), Error(0x483234));
    require(!bool(!stor_f_0_19), Error(0x483235));
    require(!stor_f_21_21, Error(0x483236));
    require(stor_f_0_19.code.size);
    v0 = stor_f_0_19.registerAllowedOrderSigner(stor_d_0_19, 1).gas(msg.gas);
    require(v0, MEM[64], RETURNDATASIZE());
    if (v0) {
        require(MEM[64] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = MEM[64];
        require(0 >= 0);
        v1 = this.code.size;
    }
    stor_f_21_21 = 1;
    emit 0xe2a15194b74a0298d534f61917fa87587fcb3286a0c2888c252fe045656ca7b4();
    return ;
}

function 0x30a28ffc(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6) public payable { 
    require(msg.data.length - 4 >= 224);
    require(!(address(varg1) - varg1));
    require(!(address(varg2) - varg2));
    require(_isActive, Error(18481));
    require(varg6 >= block.timestamp, Error(18488));
    require(_isActive, Error(18481));
    require(mapping_a[address(varg1)], Error(0x483239));
    require(__operators[msg.sender], Error(18484));
    v0 = new bytes[](68);
    MEM[v0.data] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
    MEM[v0 + 36] = address(varg1);
    MEM[v0 + 68] = varg3;
    require(!((v0 + 128 > uint64.max) | (v0 + 128 < v0)), Panic(65)); // failed memory allocation (too much memory)
    v1 = v0.length;
    v2, /* uint256 */ v3 = varg2.transfer(address(varg1), varg3).gas(msg.gas);
    if (RETURNDATASIZE()) {
        require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v4 = v5 = new bytes[](RETURNDATASIZE());
        require(!((v5 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v5 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v5)), Panic(65)); // failed memory allocation (too much memory)
        v3 = v5.data;
        RETURNDATACOPY(v3, 0, RETURNDATASIZE());
    }
    require((address(varg1)).code.size);
    v6 = address(varg1).swap(varg4, varg5, this, 128, 0).gas(msg.gas);
    require(v6, MEM[64], RETURNDATASIZE());
    if (v6) {
        require(MEM[64] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = MEM[64];
        require(0 >= 0);
        v7 = this.code.size;
    }
    0x4906(varg0);
    return ;
}

function _operators(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    return __operators[varg0];
}

function isActive() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return _isActive;
}

function unwrapEth(uint256 _amount) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(_isActive, Error(18481));
    require(mapping_3[msg.sender], Error(0x483238));
    v0 = new bytes[](36);
    MEM[v0.data] = 0x2e1a7d4d00000000000000000000000000000000000000000000000000000000;
    MEM[v0 + 36] = _amount;
    require(!((v0 + 96 > uint64.max) | (v0 + 96 < v0)), Panic(65)); // failed memory allocation (too much memory)
    v1 = v0.length;
    v2, /* uint256 */ v3 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(_amount).gas(msg.gas);
    if (RETURNDATASIZE()) {
        require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v4 = v5 = new bytes[](RETURNDATASIZE());
        require(!((v5 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v5 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v5)), Panic(65)); // failed memory allocation (too much memory)
        v3 = v5.data;
        RETURNDATACOPY(v3, 0, RETURNDATASIZE());
    }
    require(v2, Error(0x483134));
    return ;
}

function 0x1e6934b6() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return address(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
}

function 0x3d56() private { 
    v0 = v1 = __operators[msg.sender];
    if (!v1) {
        v0 = v2 = mapping_3[msg.sender];
    }
    if (!v0) {
        v0 = v3 = mapping_1[msg.sender];
    }
    if (!v0) {
        v0 = v4 = address(0xce466fc694c971b95bb1193e494942e22197f759) == msg.sender;
    }
    require(v0, Error(0x483131));
    v5 = v6 = 0x1841b;
    v5 = v7 = _getAllApprovedTokens.length;
    v8 = v9 = __operators[msg.sender];
    if (!v9) {
        v8 = v10 = mapping_3[msg.sender];
    }
    if (!v8) {
        v8 = mapping_1[msg.sender];
    }
    if (!v8) {
        v8 = v11 = address(0xce466fc694c971b95bb1193e494942e22197f759) == msg.sender;
    }
    require(v8, Error(0x483131));
    _isActive = 0;
    require(v7 <= _getAllApprovedTokens.length, Error(0x483133));
    v5 = v12 = 0;
    while (v5 < v5) {
        v13 = 16064;
        if (_getAllApprovedTokens.length) {
            v5 = v14 = address(STORAGE[0xf3f7a9fe364faab93b216da50a3214154f22a0a2b415b23a84c8169e8b636ee3]);
            while (1) {
                revert(Panic(50));
                require(v5 != uint256.max, Panic(17)); // arithmetic overflow or underflow
                v5 += 1;
                // Unknown jump to Block ['0x3ec0B0x3d86', '0x3f42B0x3d86']. Refer to 3-address code (TAC);
                if (mapping_9[address(v5)]) {
                    if (uint256.max + mapping_9[address(v5)] <= mapping_9[address(v5)]) {
                        if (_getAllApprovedTokens.length - 1 <= _getAllApprovedTokens.length) {
                            if (_getAllApprovedTokens.length - 1 - (uint256.max + mapping_9[address(v5)])) {
                                require(_getAllApprovedTokens.length - 1 < _getAllApprovedTokens.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                                require(uint256.max + mapping_9[address(v5)] < _getAllApprovedTokens.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                                _getAllApprovedTokens[uint256.max + mapping_9[address(v5)]] = 0x0 & _getAllApprovedTokens[uint256.max + mapping_9[address(v5)]] | _getAllApprovedTokens[_getAllApprovedTokens.length - 1];
                                mapping_9[_getAllApprovedTokens[_getAllApprovedTokens.length - 1]] = mapping_9[address(v5)];
                                v15 = this.code.size;
                            }
                            require(_getAllApprovedTokens.length, Panic(49)); // attemp to .pop an empty array
                            require(_getAllApprovedTokens.length - 1 < _getAllApprovedTokens.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                            MEM[0] = 8;
                            STORAGE[_getAllApprovedTokens.length + 0xf3f7a9fe364faab93b216da50a3214154f22a0a2b415b23a84c8169e8b636ee2] = 0;
                            _getAllApprovedTokens.length = _getAllApprovedTokens.length - 1;
                            mapping_9[address(v5)] = 0;
                        }
                    }
                    revert(Panic(17));
                }
                v5 = v16 = 0;
                if (v5 >= array_6.length) {
                    continue;
                } else if (v5 < array_6.length) {
                    v17, v18 = address(v5).allowance(this, address(array_6[v5])).gas(msg.gas);
                    require(v17, v19, RETURNDATASIZE());
                    v13 = v20 = 16194;
                    v18 = v21 = 0;
                    if (v17) {
                        if (32 > RETURNDATASIZE()) {
                            require(!((MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                            v22 = v23 = MEM[64] + RETURNDATASIZE();
                        } else {
                            require(!((MEM[64] + 32 > uint64.max) | (MEM[64] + 32 < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                            MEM[64] = MEM[64] + 32;
                            v22 = v24 = MEM[64] + 32;
                        }
                        require(v22 - MEM[64] >= 32);
                        v25 = this.code.size;
                    }
                    if (v18) {
                        v26 = new bytes[](68);
                        MEM[v26.data] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                        MEM[v26 + 36] = address(array_6[v5]);
                        MEM[v26 + 68] = 0;
                        require(!((v26 + 128 > uint64.max) | (v26 + 128 < v26)), Panic(65)); // failed memory allocation (too much memory)
                        v27 = v26.length;
                        v28, /* uint256 */ v19, /* uint256 */ v29 = v5.approve(address(array_6[v5]), 0).gas(msg.gas);
                        if (!RETURNDATASIZE()) {
                            v30 = v31 = 96;
                        } else {
                            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                            v30 = new bytes[](RETURNDATASIZE());
                            require(!((v30 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v30 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v30)), Panic(65)); // failed memory allocation (too much memory)
                            v29 = v30.data;
                            RETURNDATACOPY(v29, 0, RETURNDATASIZE());
                        }
                        v32 = v33 = !v28;
                        if (bool(v28)) {
                            v32 = v34 = bool(MEM[v30]);
                            if (v34) {
                                require(v30 + MEM[v30] + 32 - (v30 + 32) >= 32);
                                require(!(bool(MEM[v30 + 32]) - MEM[v30 + 32]));
                                v32 = !MEM[v30 + 32];
                                v35 = this.code.size;
                            }
                            v36 = this.code.size;
                        }
                        if (v32) {
                            emit 0x1685a34ffb3f2b177d05a4af1cbabd9ca2d1e2977ec14a80189b8d0f3b58b4f3(address(v5), address(array_6[v5]));
                            v37 = this.code.size;
                        }
                    }
                }
            }
        }
    }
    emit 0xeffe39084a0f43b67972c81cfec3f2516c5a1837cf33b55c028d557ec259858b();
    return ;
}

function accessControlRegistry() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return address(0x7ff4ed8ab94c849b812622eb462682208be06b93);
}

function killContract() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = __operators[msg.sender];
    if (!v1) {
        v0 = v2 = mapping_3[msg.sender];
    }
    if (!v0) {
        v0 = mapping_1[msg.sender];
    }
    if (!v0) {
        v0 = v3 = address(0xce466fc694c971b95bb1193e494942e22197f759) == msg.sender;
    }
    require(v0, Error(0x483131));
    _isActive = 0;
    0x3d56();
    return ;
}

function isValidSignature(bytes32 hash, bytes signature) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(signature <= uint64.max);
    require(4 + signature + 31 < msg.data.length);
    require(signature.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v0 = new bytes[](signature.length);
    require(!((v0 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + signature.length) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v0 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + signature.length) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v0)), Panic(65)); // failed memory allocation (too much memory)
    require(4 + signature + signature.length + 32 <= msg.data.length);
    CALLDATACOPY(v0.data, signature.data, signature.length);
    v0[signature.length] = 0;
    require(_isActive, Error(18481));
    require(mapping_10[msg.sender], Error(0x483139));
    require(stor_d_0_19, Error(0x483233));
    v1, v2 = 0x4bd9(hash, v0);
    0x4a58(v1);
    require(!bool(!address(v2)), Error(0x483231));
    require(!(address(v2) - stor_d_0_19), Error(0x483232));
    return bytes4(0x1626ba7e00000000000000000000000000000000000000000000000000000000);
}

function 0x122067ed(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, bytes varg6) public payable { 
    require(msg.data.length - 4 >= 224);
    require(!(address(varg1) - varg1));
    require(!(bool(varg4) - varg4));
    require(varg6 <= uint64.max);
    require(4 + varg6 + 31 < msg.data.length);
    require(varg6.length <= uint64.max);
    require(4 + varg6 + varg6.length + 32 <= msg.data.length);
    v0 = v1 = 0;
    require(_isActive, Error(18481));
    require(varg5 >= block.timestamp, Error(18488));
    require(_isActive, Error(18481));
    v2 = v3 = 64;
    require(_uniswapV3SwapCallback[address(varg1)], Error(0x483330));
    require(__operators[msg.sender], Error(18484));
    if (!varg4) {
        v4 = v5 = 0xfffd8963efd1fc6a506488495d951d5263988d25;
    } else {
        v4 = 0x1000276a4;
    }
    v6 = new uint256[](varg6.length);
    CALLDATACOPY(v6.data, varg6.data, varg6.length);
    MEM[192 + (varg6.length + (MEM[v3] + 4))] = 0;
    v7, /* uint256 */ v0, /* uint256 */ v0 = address(varg1).swap(address(this), bool(varg4), varg2, address(v4), v6).value(v1).gas(msg.gas);
    require(v7, MEM[64], RETURNDATASIZE());
    if (v7) {
        if (RETURNDATASIZE() < v3) {
            v2 = RETURNDATASIZE();
        }
        require(!((MEM[v3] + (v2 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[v3] + (v2 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[v3])), Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = MEM[v3] + (v2 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
        require(MEM[v3] + v2 - MEM[v3] >= 64);
        v8 = this.code.size;
    }
    if (v0 <= v1) {
        v9 = v10 = 0x4875(v0);
    } else {
        v9 = v11 = 0x4875(v0);
    }
    require(varg3 <= v9, Error(0x533133));
    0x4906(varg0);
    return MEM[va8e:va8e + va8e];
}

function 0x1132fb89() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0x3349cb1d48fb20662e6095e6479f18fe92f1cdcfa7083feba86a52b0e0b47da7;
}

function 0x10a43720() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0xc4da52dc00000000000000000000000000000000000000000000000000000000;
}

function getAllApprovedTokens() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = MEM[64] + 32;
    v2 = v3 = 0;
    v4 = v5 = _getAllApprovedTokens.data;
    while (v2 < _getAllApprovedTokens.length) {
        MEM[v0] = STORAGE[v4];
        v0 += 32;
        v4 += 1;
        v2 = v2 + 1;
    }
    require(!((MEM[64] + (v0 - MEM[64] + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (v0 - MEM[64] + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
    v6 = new uint256[](_getAllApprovedTokens.length);
    v7 = v8 = v6.data;
    v9 = MEM[64] + 32;
    v10 = 0;
    while (v10 < _getAllApprovedTokens.length) {
        MEM[v7] = address(MEM[v9]);
        v7 += 32;
        v9 += 32;
        v10 += 1;
    }
    return v6;
}

function multiSigOwner() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return address(0xce466fc694c971b95bb1193e494942e22197f759);
}

function 0x029074ce(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(varg0 <= uint64.max);
    require(4 + varg0 + 31 < msg.data.length);
    require(varg0.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v0 = new uint256[](varg0.length);
    require(!((v0 + (32 + (varg0.length << 5) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v0 + (32 + (varg0.length << 5) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v0)), Panic(65)); // failed memory allocation (too much memory)
    v1 = v2 = v0.data;
    require(4 + varg0 + (varg0.length << 5) + 32 <= msg.data.length);
    v3 = varg0.data;
    while (v3 < 4 + varg0 + (varg0.length << 5) + 32) {
        MEM[v1] = msg.data[v3];
        v3 += 32;
        v1 += 32;
    }
    require(varg1 <= uint64.max);
    require(4 + varg1 + 31 < msg.data.length);
    require(varg1.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v4 = new uint256[](varg1.length);
    require(!((v4 + (32 + (varg1.length << 5) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v4 + (32 + (varg1.length << 5) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v4)), Panic(65)); // failed memory allocation (too much memory)
    v5 = v6 = v4.data;
    require(4 + varg1 + (varg1.length << 5) + 32 <= msg.data.length);
    v7 = varg1.data;
    while (v7 < 4 + varg1 + (varg1.length << 5) + 32) {
        require(!(address(msg.data[v7]) - msg.data[v7]));
        MEM[v5] = msg.data[v7];
        v5 = v5 + 32;
        v7 = v7 + 32;
    }
    v8 = v9 = 0;
    require(_isActive, Error(18481));
    require(mapping_1[msg.sender], Error(18485));
    while (1) {
        if (v8 >= v4.length) {
            break;
        } else {
            require(v8 < v4.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require(mapping_4[address(v4[v8])], Error(18486));
            v8 = 0x39b3(v8);
        }
    }
    require(v4.length == v0.length, Error(0x483135));
    while (1) {
        if (v8 >= v0.length) {
            break;
        } else {
            require(v8 < v0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            v8 = _SafeAdd(v8, v0[v8]);
            v8 = 0x39b3(v8);
        }
    }
    if (v8 > this.balance) {
        v10 = _SafeSub(v8, this.balance);
        v11 = new bytes[](36);
        MEM[v11.data] = 0x2e1a7d4d00000000000000000000000000000000000000000000000000000000;
        MEM[v11 + 36] = v10;
        require(!((v11 + 96 > uint64.max) | (v11 + 96 < v11)), Panic(65)); // failed memory allocation (too much memory)
        v12 = v11.length;
        v13, /* uint256 */ v14 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(v10).value(v9).gas(msg.gas);
        if (RETURNDATASIZE()) {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v15 = v16 = new bytes[](RETURNDATASIZE());
            require(!((v16 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v16 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v16)), Panic(65)); // failed memory allocation (too much memory)
            v14 = v16.data;
            RETURNDATACOPY(v14, 0, RETURNDATASIZE());
        }
        require(v13, Error(0x483136));
        v17 = this.code.size;
    }
    while (1) {
        if (v8 >= v0.length) {
            return MEM[v6c7:v6c7 + v6c7];
        } else {
            require(v8 < v4.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require(v8 < v0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            v18, /* uint256 */ v19 = address(v4[v8]).call().value(v0[v8]).gas(msg.gas);
            if (RETURNDATASIZE()) {
                require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                v20 = v21 = new bytes[](RETURNDATASIZE());
                require(!((v21 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v21 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v21)), Panic(65)); // failed memory allocation (too much memory)
                v19 = v21.data;
                RETURNDATACOPY(v19, 0, RETURNDATASIZE());
            }
            require(v8 != uint256.max, Panic(17)); // arithmetic overflow or underflow
            v8 += 1;
        }
    }
    return MEM[v6c7:v6c7 + v6c7];
}

function 0x0070c82a(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5) public payable { 
    require(msg.data.length - 4 >= 192);
    require(!(address(varg1) - varg1));
    require(_isActive, Error(18481));
    require(mapping_c[address(varg1)], Error(18487));
    require(__operators[msg.sender], Error(18484));
    require((address(varg1)).code.size);
    v0 = address(varg1).setMetaGold(varg2, varg3, varg4, varg5).gas(msg.gas);
    require(v0, MEM[64], RETURNDATASIZE());
    if (v0) {
        require(MEM[64] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = MEM[64];
    }
    0x4906(varg0);
    return ;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function 0x4215(uint256 varg0) private { 
    if (!mapping_7[varg0]) {
        return 0;
    } else {
        v0 = uint256.max + mapping_7[varg0];
        if (v0 <= mapping_7[varg0]) {
            if (array_6.length - 1 <= array_6.length) {
                if (array_6.length - 1 - v0) {
                    require(array_6.length - 1 < array_6.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                    require(v0 < array_6.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                    array_6[v0] = 0x0 & array_6[v0] | array_6[array_6.length - 1];
                    mapping_7[array_6[array_6.length - 1]] = mapping_7[varg0];
                    v1 = this.code.size;
                }
                require(array_6.length, Panic(49)); // attemp to .pop an empty array
                require(array_6.length - 1 < array_6.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                MEM[0] = 6;
                STORAGE[array_6.length + 0xf652222313e28459528d920b65115c16c04f3efc82aaedc97be59f3f377c0d3e] = 0;
                array_6.length = array_6.length - 1;
                mapping_7[varg0] = 0;
                return 1;
            }
        }
        revert(Panic(17));
    }
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= varg0 + varg1, Panic(17)); // arithmetic overflow or underflow
    return varg0 + varg1;
}

function 0x4875(uint256 varg0) private { 
    require(varg0 != int256.min, Panic(17)); // arithmetic overflow or underflow
    return 0 - varg0;
}

function 0x4906(uint256 varg0) private { 
    if (!varg0) {
        return ;
    } else {
        require(mapping_5[block.coinbase], Error(0x483137));
        v0, /* uint256 */ v1 = block.coinbase.call().value(varg0);
        if (RETURNDATASIZE()) {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v2 = v3 = new bytes[](RETURNDATASIZE());
            require(!((v3 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v3 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v3)), Panic(65)); // failed memory allocation (too much memory)
            v1 = v3.data;
            RETURNDATACOPY(v1, 0, RETURNDATASIZE());
        }
        return ;
    }
}

function 0x4a58(uint256 varg0) private { 
    require(5 > varg0, Panic(33)); // failed convertion to enum type
    if (varg0) {
        require(5 > varg0, Panic(33)); // failed convertion to enum type
        require(varg0 - 1, Error('ECDSA: invalid signature'));
        require(5 > varg0, Panic(33)); // failed convertion to enum type
        require(varg0 - 2, Error('ECDSA: invalid signature length'));
        require(5 > varg0, Panic(33)); // failed convertion to enum type
        require(varg0 - 3, Error("ECDSA: invalid signature 's' value"));
        require(5 > varg0, Panic(33)); // failed convertion to enum type
        require(varg0 != 4, Error("ECDSA: invalid signature 'v' value"));
        return ;
    } else {
        return ;
    }
}

function 0x4bd9(uint256 varg0, bytes varg1) private { 
    if (0 == (varg1.length == 65)) {
        return 2, 0;
    } else {
        if (MEM[varg1 + 64] > 0x7fffffffffffffffffffffffffffffff5d576e7357a4501ddfe92f46681b20a0) {
            v0 = v1 = 0;
            v0 = v2 = 3;
        } else {
            v3 = v4 = uint8(byte(MEM[varg1 + 96], 0x0)) != 27;
            if (v4) {
                v3 = v5 = uint8(byte(MEM[varg1 + 96], 0x0)) != 28;
            }
            if (v3) {
                v0 = v6 = 0;
                v0 = v7 = 4;
            } else {
                v0 = v8 = 0;
                MEM[v8] = v8;
                v9 = ecrecover(varg0, uint8(byte(MEM[varg1 + 96], 0x0)), MEM[varg1.data], MEM[varg1 + 64]);
                require(v9, MEM[64], RETURNDATASIZE());
                v0 = v10 = MEM[v8];
                if (!address(v10)) {
                    v0 = v11 = 1;
                }
            }
        }
        return v0, v0;
    }
}

function 0x4d81() private { 
    v0 = v1 = __operators[msg.sender];
    if (!v1) {
        v0 = v2 = mapping_3[msg.sender];
    }
    if (!v0) {
        v0 = mapping_1[msg.sender];
    }
    if (!v0) {
        v0 = v3 = address(0xce466fc694c971b95bb1193e494942e22197f759) == msg.sender;
    }
    if (!v0) {
        v0 = v4 = address(0x7ff4ed8ab94c849b812622eb462682208be06b93) == msg.sender;
    }
    require(v0, Error(0x483131));
    require(!bool(!stor_d_0_19), Error(0x483234));
    require(!bool(!stor_e_0_19), Error(0x483235));
    require(stor_f_20_20 == 1, Error(0x483237));
    require(stor_e_0_19.code.size);
    v5 = stor_e_0_19.revoke().gas(msg.gas);
    require(v5, MEM[64], RETURNDATASIZE());
    if (v5) {
        require(MEM[64] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = MEM[64];
        require(0 >= 0);
        v6 = this.code.size;
    }
    stor_f_20_20 = 0;
    emit 0xebf6b5f8895403249f1e22bd0fa0ad700b9ac2934794157018fa358bf3cd9561();
    return ;
}

function 0x4f1f() private { 
    v0 = v1 = __operators[msg.sender];
    if (!v1) {
        v0 = v2 = mapping_3[msg.sender];
    }
    if (!v0) {
        v0 = mapping_1[msg.sender];
    }
    if (!v0) {
        v0 = v3 = address(0xce466fc694c971b95bb1193e494942e22197f759) == msg.sender;
    }
    if (!v0) {
        v0 = v4 = address(0x7ff4ed8ab94c849b812622eb462682208be06b93) == msg.sender;
    }
    require(v0, Error(0x483131));
    require(!bool(!stor_d_0_19), Error(0x483234));
    require(!bool(!stor_f_0_19), Error(0x483235));
    require(stor_f_21_21 == 1, Error(0x483237));
    require(stor_f_0_19.code.size);
    v5 = stor_f_0_19.registerAllowedOrderSigner(stor_d_0_19, 0).gas(msg.gas);
    require(v5, MEM[64], RETURNDATASIZE());
    if (v5) {
        require(MEM[64] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = MEM[64];
        require(0 >= 0);
        v6 = this.code.size;
    }
    stor_f_21_21 = 0;
    emit 0xecea411494396bad76603835f1d273316921ba391fb0bbfdc5c03af6a2ab753d();
    return ;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        v0 = function_selector >> 224;
        if (0x70c82a == v0) {
            0x0070c82a();
        } else if (0x29074ce == v0) {
            0x029074ce();
        } else if (0x329dd62 == v0) {
            multiSigOwner();
        } else if (0x9b0d50a == v0) {
            getAllApprovedTokens();
        } else if (0x10a43720 == v0) {
            0x10a43720();
        } else if (0x1132fb89 == v0) {
            0x1132fb89();
        } else if (0x122067ed == v0) {
            0x122067ed();
        } else if (0x1626ba7e == v0) {
            isValidSignature(bytes32,bytes);
        } else if (0x1c02708d == v0) {
            killContract();
        } else if (0x1ce9ae07 == v0) {
            accessControlRegistry();
        } else if (0x1e6934b6 == v0) {
            0x1e6934b6();
        } else if (0x2197159c == v0) {
            unwrapEth(uint256);
        } else if (0x22f3e2d4 == v0) {
            isActive();
        } else if (0x2a455199 == v0) {
            _operators(address);
        } else if (0x30a28ffc == v0) {
            0x30a28ffc();
        } else if (0x34248ee5 == v0) {
            0x34248ee5();
        } else if (0x3794bbc4 == v0) {
            0x3794bbc4();
        } else if (0x394b1de1 == v0) {
            transferTo(address[],uint256[],address[]);
        } else if (0x3bb6ea1e == v0) {
            0x3bb6ea1e();
        } else if (0x3c54863c == v0) {
            0x3c54863c();
        } else if (0x3cbe46f8 == v0) {
            0x3cbe46f8();
        } else if (0x4103f237 == v0) {
            0x4103f237();
        } else if (0x47503b3d == v0) {
            operatorRole();
        } else if (0x481c42a2 == v0) {
            0x481c42a2();
        } else if (0x484e39c3 == v0) {
            0x484e39c3();
        } else if (0x48ea3731 == v0) {
            0x48ea3731();
        } else if (0x59733e7f == v0) {
            0x59733e7f();
        } else if (0x5afcf03d == v0) {
            0x5afcf03d();
        } else if (0x5bc6665d == v0) {
            0x5bc6665d();
        } else if (0x628bcd8b == v0) {
            0x628bcd8b();
        } else if (0x6650eb1e == v0) {
            0x6650eb1e();
        } else if (0x692e3a95 == v0) {
            0x692e3a95();
        } else if (0x6b410e34 == v0) {
            unkillContract();
        } else if (0x6d66ea05 == v0) {
            0x6d66ea05();
        } else if (0x771d503f == v0) {
            0x771d503f();
        } else if (0x8b954c70 == v0) {
            0x8b954c70();
        } else if (0xa03dc130 == v0) {
            0xa03dc130();
        } else if (0xa1c20303 == v0) {
            0xa1c20303();
        } else if (0xa5fd3043 == v0) {
            0xa5fd3043();
        } else if (0xa93f9118 == v0) {
            0xa93f9118();
        } else if (0xada00694 == v0) {
            0xada00694();
        } else if (0xae9779c6 == v0) {
            wrapEth(uint256);
        } else if (0xb0c39a1e == v0) {
            0xb0c39a1e();
        } else if (0xb221bd4b == v0) {
            0xb221bd4b();
        } else if (0xb87d3b28 == v0) {
            0xb87d3b28();
        } else if (0xbb25faea == v0) {
            0xbb25faea();
        } else if (0xc249597c == v0) {
            0xc249597c();
        } else if (0xc4da52dc == v0) {
            0xc4da52dc();
        } else if (0xcf1346bc == v0) {
            0xcf1346bc();
        } else if (0xd3487997 == v0) {
            uniswapV3MintCallback(uint256,uint256,bytes);
        } else if (0xd368093d == v0) {
            0xd368093d();
        } else if (0xd73c2f66 == v0) {
            0xd73c2f66();
        } else if (0xe2f48005 == v0) {
            0xe2f48005();
        } else if (0xe457acdd == v0) {
            0xe457acdd();
        } else if (0xe6ac82d2 == v0) {
            0xe6ac82d2();
        } else if (0xea3c986d == v0) {
            0xea3c986d();
        } else if (0xecfdae1a == v0) {
            0xecfdae1a();
        } else if (0xf203c1b1 == v0) {
            0xf203c1b1();
        } else if (0xf7e846e9 == v0) {
            0xf7e846e9();
        } else if (0xfa461e33 == v0) {
            uniswapV3SwapCallback(int256,int256,bytes);
        } else if (0xfb034fb2 == v0) {
            0xfb034fb2();
        } else if (0xfc6594ef == v0) {
            0xfc6594ef();
        } else if (!(0xfcdd595a - v0)) {
            0xfcdd595a();
        }
    }
    if (!msg.data.length) {
        receive();
    } else {
        exit;
    }
}
