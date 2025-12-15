// Decompiled by library.dedaub.com
// 2025.12.15 07:20 UTC
// Compiled using the solidity compiler version 0.8.23





function 0xbdb69421(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    require(!(msg.sender - this), OnlyThis());
    v0 = v1 = 0;
    CALLDATACOPY(MEM[64] + 4, 44, msg.data.length - 44);
    v2 = this.call(0x10c3405f00000000000000000000000000000000000000000000000000000000).gas(msg.gas);
    if (v2) {
        v0 = v3 = MEM[0];
    }
    if (!v2) {
        0x3cf6(varg0 >> 96, varg1 >> 96, msg.data[msg.data.length - 32]);
        return v0;
    } else {
        return v0;
    }
}

function 0xbd46a343(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = this;
    v2 = v3 = 0xba12222222228d8ba445958a75a0704d566bf2c8;
    v4 = v5 = msg.data.length - 32;
    if (varg0 >> 248 & 0x40) {
        v4 = v6 = msg.data.length - 52;
        v2 = v7 = msg.data[v6] >> 96;
    }
    if (varg0 >> 248 & 0x80) {
        v0 = v8 = msg.data[v4 - 20] >> 96;
    }
    if (msg.data[5 + (varg0 >> 243 & 0x1e0)]) {
        v9 = msg.data[5 + (varg0 >> 243 & 0x1e0)].approve(v2, msg.data[v5]).gas(msg.gas);
        if (!((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v9)) {
            v10 = msg.data[5 + (varg0 >> 243 & 0x1e0)].approve(v2, 0).gas(msg.gas);
            if ((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v10) {
                v11 = msg.data[5 + (varg0 >> 243 & 0x1e0)].approve(v2, msg.data[v5]).gas(msg.gas);
                if ((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v11) {
                    // Unknown jump to Block 0x1350. Refer to 3-address code (TAC);
                }
            }
            revert(ApproveFailed());
        }
    }
    v12 = v13 = MEM[64] + (bool(varg0 >> 248) + 1 << 5) + 292;
    v14 = v15 = 0;
    while (v14 < bool(varg0 >> 248)) {
        MEM[MEM[64] + (v14 << 5) + 324] = (varg0 >> 243 & 0x1e0) + v14 * 192;
        MEM[v12] = msg.data[5 + (v14 << 5)];
        MEM[v12 + 32] = v14;
        MEM[v12 + 64] = v14 + 1;
        MEM[v12 + 96] = msg.data[v5] * !v14;
        MEM[v12 + 128] = 160;
        MEM[v12 + 160] = 0;
        v12 = v12 + 192;
        v14 = v14 + 1;
    }
    MEM[MEM[64] + 224 * bool(varg0 >> 248) + 324] = bool(varg0 >> 248) + 1;
    CALLDATACOPY(MEM[64] + 224 * bool(varg0 >> 248) + 356, 5 + (varg0 >> 243 & 0x1e0), bool(varg0 >> 248) + 1 << 5);
    MEM[MEM[64] + (224 * bool(varg0 >> 248) + (bool(varg0 >> 248) + 2 << 5)) + 324] = bool(varg0 >> 248) + 1;
    MEM[MEM[64] + (224 * bool(varg0 >> 248) + (bool(varg0 >> 248) + 2 << 5)) + 356] = int256.max;
    CALLDATACOPY(MEM[64] + (224 * bool(varg0 >> 248) + (bool(varg0 >> 248) + 2 << 5)) + 388, msg.data.length, varg0 >> 243 & 0x1e0);
    v16 = v2.batchSwap(0, 288, 320 + 224 * bool(varg0 >> 248), this, 0, v0, 0, 224 * bool(varg0 >> 248) + (bool(varg0 >> 248) + 2 << 5) + 320, block.timestamp, bool(varg0 >> 248)).value(!msg.data[5 + (varg0 >> 243 & 0x1e0)] * msg.data[v5]).gas(msg.gas);
    if (!v16) {
        v17 = RETURNDATASIZE();
        revert(v18, v18, v18, v18, v18, v18, v18, v18, v18, bool(varg0 >> 248));
    } else {
        return 0 - MEM[RETURNDATASIZE() + MEM[64] - 32];
    }
}

function receive() public payable { 
    require(msg.sender != tx.origin, EthDepositRejected());
}

function 0xfd53121f(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = 0;
    v2 = v3 = 0;
    if (36 == msg.data.length) {
        v0 = v4 = this;
    } else if (56 == msg.data.length) {
        v0 = v5 = varg0 >> 96;
    } else if (44 == msg.data.length) {
        v0 = v6 = this;
        v2 = v7 = varg0 >> 192;
    } else if (64 == msg.data.length) {
        v0 = v8 = varg0 >> 96;
        v2 = v9 = varg2 >> 192;
    }
    v10 = v11 = v0 * 10 ** 12;
    if (v2) {
        v10 = v12 = v11 - v0 * v2 / 10 ** 18;
    }
    v13 = 0x4261(v0);
    if (!v13) {
        v14 = v15 = 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48.approve(0xf6e72db5454dd049d0788e411b06cfaf16853042, 0).gas(msg.gas);
        if (v15) {
            if (!RETURNDATASIZE()) {
                v14 = v16 = bool(0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48.code.size);
            } else {
                v14 = v17 = (RETURNDATASIZE() > 31) & (MEM[0] == 1);
            }
        }
        v18 = v19 = !v14;
        if (bool(v14)) {
            v20 = 0x4261(v0);
            v18 = v21 = !v20;
        }
        require(!v18, ForceApproveFailed());
    }
    v22, /* uint256 */ v23 = 0xf6e72db5454dd049d0788e411b06cfaf16853042.sellGem(v0, v0).gas(msg.gas);
    require(v22, MEM[64], RETURNDATASIZE());
    return v10;
}

function 0xa87a1ae8(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = new struct(11);
    require(!((v1 + 352 > uint64.max) | (v1 + 352 < v1)), Panic(65)); // failed memory allocation (too much memory)
    v1.word0 = 0;
    v1.word1 = 0;
    v1.word2 = 0;
    v1.word3 = 0;
    v1.word4 = 0;
    v1.word5 = 0;
    v1.word6 = 0;
    v1.word7 = 0;
    v1.word8 = 0;
    v1.word9 = 0;
    v1.word10 = 0;
    v2, /* uint256 */ v3, /* uint256 */ v4 = (varg0 >> 96).getOraclePrice().gas(msg.gas);
    v5, /* uint256 */ v6, /* uint256 */ v7 = (varg0 >> 96).getOraclePrice().gas(msg.gas);
    v8, /* uint256 */ v9, /* uint256 */ v10, /* uint256 */ v11 = (varg0 >> 96).getOraclePrice().gas(msg.gas);
    v12, /* uint256 */ v13, /* uint256 */ v14, /* uint256 */ v15 = (varg0 >> 96).getOraclePrice().gas(msg.gas);
    v16, /* uint256 */ v17, /* uint256 */ v18 = (varg0 >> 96).getOraclePrice().gas(msg.gas);
    v19 = (varg0 >> 96).getOraclePrice().gas(msg.gas);
    v20 = (varg0 >> 96).getOraclePrice().gas(msg.gas);
    v21 = (varg0 >> 96).getOraclePrice().gas(msg.gas);
    v22 = (varg0 >> 96)._TARGET_QUOTE_TOKEN_AMOUNT_().gas(msg.gas);
    v23, v24 = 0x4317(v1);
    v1.word5 = v23;
    v1.word4 = v24;
    require(v17 < 3, Panic(33)); // failed convertion to enum type
    if (v17) {
        require(v18 < 3, Panic(33)); // failed convertion to enum type
        v25 = v26 = 6199;
        v27 = v28 = 0x15370;
        if (1 - v18) {
            if (0 == varg2 <= v1.word5 - v13) {
                v27 = v29 = uint8.max + 1;
                v30 = 0x3cc1(varg2 - (v1.word5 - v13), v1);
                v31 = v32 = v30 + (v11 - v1.word4);
            } else {
                v25 = v33 = uint8.max + 1;
                v0 = v34 = v14 + varg2;
                v35 = 0x3597(v4);
                v27 = v36 = 10 ** 18;
                v37 = _SafeDiv(v1.word5 * v1.word5, v34);
                v31 = v38 = (v15 - 6575) * v36 / v7 * (v7 - v15 + v15 * v37 / v36) / v35;
            }
        } else {
            v27 = v39 = uint8.max + 1;
            v40 = 0x3597(v3);
            v41 = 0x43f3(v1.word4, v9, v40 * varg2 / 10 ** 18, v6);
            v31 = v42 = v10 - v41;
        }
    } else {
        v27 = v43 = 0x1533f;
        v27 = v44 = uint8.max + 1;
        v25 = v45 = 6199;
        v31 = v46 = 0x3cc1(varg2, v1);
    }
    require(MEM[v0 + v27] + MEM[v0 + 224] + 10 ** 18, Panic(18)); // division by zero
    v47 = v31 * 10 ** 18 / (MEM[v0 + v27] + MEM[v0 + 224] + 10 ** 18);
    // Unknown jump to Block ['0x1533f', '0x15370']. Refer to 3-address code (TAC);
    v48 = v49 = varg0 >> 96;
    v50 = v51 = varg1 >> 96;
    v52 = 0x42d0(v50, v48, v0);
    if (!v52) {
        v53 = v50.approve(v48, 0).gas(msg.gas);
        if (v53) {
            if (!RETURNDATASIZE()) {
                v53 = v54 = bool(v50.code.size);
            } else {
                v53 = v55 = (RETURNDATASIZE() > 31) & (MEM[0] == 1);
            }
        }
        v56 = !v53;
        if (bool(v53)) {
            v57 = 0x42d0(v50, v48, v0);
            v56 = v58 = !v57;
        }
        require(!v56, ForceApproveFailed());
        // Unknown jump to Block 0x1837. Refer to 3-address code (TAC);
    }
    v59 = (varg0 >> 96).buyBaseToken(v47, int256.min, 96, 0).gas(msg.gas);
    require(v59, MEM[64], RETURNDATASIZE());
    if (v59) {
        v60 = v61 = 32;
        if (v61 > RETURNDATASIZE()) {
            v60 = v62 = RETURNDATASIZE();
        }
        require(!((MEM[64] + (v60 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (v60 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = MEM[64] + (v60 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
        require(MEM[64] + v60 - MEM[64] >= v61);
    }
    return v47;
    v48 = v63 = varg0 >> 96;
    v50 = v64 = varg1 >> 96;
    // Unknown jump to Block 0x366b0x1658. Refer to 3-address code (TAC);
}

function 0x98aed105(uint256 varg0, uint256 varg1) public payable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = 0;
    v2 = v3 = varg0 >> 96;
    v4 = v5 = varg1 >> 16;
    v6 = v7 = msg.data[msg.data.length - 32];
    while (v2) {
        if (uint16(v2) + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0001) {
            v0 = v0 + uint16(v2);
        }
        v2 = v2 >> 16;
    }
    v8 = v9 = 0;
    while (v4) {
        v8 = v10 = uint24(v4);
        if (uint16(v2) == uint16.max) {
            v0 = v11 = 0;
            v12 = v13 = 0;
            CALLDATACOPY(MEM[64], 54 + v8, v10 - v8);
            v14 = v15 = MEM[64] + (v10 - v8);
            v16 = v17 = MEM[64] + 2;
            if (v18 | !(MEM[MEM[64]] >> 240 & 0x8000)) {
                v19 = v20 = this;
                if (MEM[MEM[64]] >> 240 & 0x4000) {
                    v19 = v21 = MEM[v17] >> 96;
                    v16 = v22 = MEM[64] + 22;
                }
                v23 = v24 = 0;
                if (MEM[MEM[64]] >> 240 & 0x2000) {
                    v23 = v25 = MEM[v16] >> 128;
                    v16 = v26 = v16 + 16;
                }
                if (MEM[MEM[64]] >> 240 & 0x1800) {
                    v16 = v27 = v16 + 20;
                    if (MEM[MEM[64]] >> 240 & 0x400) {
                        v19 = v28 = MEM[v27] >> 96;
                        v16 = v29 = v16 + 40;
                    }
                    if (!(MEM[MEM[64]] >> 240 & 0x1000)) {
                        MEM[v15] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
                        MEM[v15 + 4] = v19;
                        MEM[v15 + 36] = v18;
                        v30 = (MEM[v16] >> 96).call(MEM[v3ecdV0x1b43:v3ecdV0x1b43 + 68], MEM[0:32]).gas(msg.gas);
                        require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v30, TransferFailed());
                    } else {
                        MEM[v15] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                        MEM[v15 + 4] = v19;
                        MEM[v15 + 36] = v18;
                        v31 = (MEM[v16] >> 96).call(MEM[v3ecdV0x1b43:v3ecdV0x1b43 + 68], MEM[0:32]).gas(msg.gas);
                        if (!((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v31)) {
                            MEM[v15 + 36] = 0;
                            v32 = (MEM[v16] >> 96).call(MEM[v3ecdV0x1b43:v3ecdV0x1b43 + 68], MEM[0:32]).gas(msg.gas);
                            require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v32, ApproveFailed());
                            MEM[v15 + 36] = v18;
                            v33 = (MEM[v16] >> 96).call(MEM[v3ecdV0x1b43:v3ecdV0x1b43 + 68], MEM[0:32]).gas(msg.gas);
                            require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v33, ApproveFailed());
                        }
                    }
                }
                v34 = v35 = 0;
                if (MEM[MEM[64]] >> 240 & 0x200) {
                    v34 = v36 = MEM[v16];
                    v16 = v37 = v16 + 32;
                }
                if (0 != MEM[MEM[64]] >> 247 & 0x3) {
                    if (1 == MEM[MEM[64]] >> 247 & 0x3) {
                        MEM[v15] = v18;
                        v14 = v38 = 32 + v15;
                    } else {
                        v16 = v39 = v16 + (MEM[MEM[64]] >> 247 & 0x3);
                        if (v39 + (MEM[v16] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18)) + 32 > v15) {
                            MEM[v39] = 0xc700990000000000000000000000000000000000000000000000000000000000;
                            revert(v39, 4);
                        } else {
                            MEM[v39 + (MEM[v16] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18))] = v18;
                        }
                    }
                }
                if (MEM[MEM[64]] >> 240 & 0x40) {
                    v23 = v40 = v23 + v18;
                }
                if (v16 > v14) {
                    MEM[v16] = 0x31560a0e00000000000000000000000000000000000000000000000000000000;
                    revert(v16, 4);
                } else {
                    v41 = this.balance;
                    if (v23 > v41) {
                        MEM[v16] = 0xf4d678b800000000000000000000000000000000000000000000000000000000;
                        revert(v16, 4);
                    } else {
                        v42 = v19.call(MEM[v4003_0x2V0x1b43:v4003_0x2V0x1b43 + v3f72_0x0V0x1b43 - v4003_0x2V0x1b43], MEM[v4003_0x2V0x1b43:v4003_0x2V0x1b43 + uint8.max + 1]).value(v23).gas(msg.gas);
                        if (!v42) {
                            if (0x20 & MEM[MEM[64]] >> 240) {
                                RETURNDATACOPY(v16, 0, RETURNDATASIZE());
                                revert(v16, RETURNDATASIZE());
                            }
                        } else if (1 == v42) {
                            if (0 != RETURNDATASIZE() * !(MEM[MEM[64]] >> 240 & 0x1)) {
                                if ((0xe0 & MEM[MEM[64]] >> 236) + 32 > RETURNDATASIZE()) {
                                    MEM[v16] = 0x310a48700000000000000000000000000000000000000000000000000000000;
                                    revert(v16, 4);
                                } else {
                                    v0 = MEM[v16 + (0xe0 & MEM[MEM[64]] >> 236)];
                                    v12 = 1;
                                    if (MEM[MEM[64]] >> 240 & 0x10) {
                                        v0 = v43 = 0 - v0;
                                    }
                                }
                            }
                        }
                        if (MEM[MEM[64]] >> 240 & 0x200) {
                            if (!v12) {
                                MEM[v16] = 0x2dd205a100000000000000000000000000000000000000000000000000000000;
                                revert(v16, 4);
                            } else if (v0 < v34) {
                                MEM[v16] = 0x9a44647500000000000000000000000000000000000000000000000000000000;
                                MEM[v16 + 4] = v0;
                                revert(v16, 36);
                            }
                        }
                    }
                }
            }
        } else if (!uint16(v2)) {
            require(v2);
            v6 = v44 = 0;
            v45 = v46 = 0;
            CALLDATACOPY(MEM[64], 54 + v8, v10 - v8);
            v47 = v48 = MEM[64] + (v10 - v8);
            v49 = v50 = MEM[64] + 2;
            if (v51 | !(MEM[MEM[64]] >> 240 & 0x8000)) {
                v52 = v53 = this;
                if (MEM[MEM[64]] >> 240 & 0x4000) {
                    v52 = v54 = MEM[v50] >> 96;
                    v49 = v55 = MEM[64] + 22;
                }
                v56 = v57 = 0;
                if (MEM[MEM[64]] >> 240 & 0x2000) {
                    v56 = v58 = MEM[v49] >> 128;
                    v49 = v59 = v49 + 16;
                }
                if (MEM[MEM[64]] >> 240 & 0x1800) {
                    v49 = v60 = v49 + 20;
                    if (MEM[MEM[64]] >> 240 & 0x400) {
                        v52 = v61 = MEM[v60] >> 96;
                        v49 = v62 = v49 + 40;
                    }
                    if (!(MEM[MEM[64]] >> 240 & 0x1000)) {
                        MEM[v48] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
                        MEM[v48 + 4] = v52;
                        MEM[v48 + 36] = v51;
                        v63 = (MEM[v49] >> 96).call(MEM[v3ecdV0x1b2c:v3ecdV0x1b2c + 68], MEM[0:32]).gas(msg.gas);
                        require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v63, TransferFailed());
                    } else {
                        MEM[v48] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                        MEM[v48 + 4] = v52;
                        MEM[v48 + 36] = v51;
                        v64 = (MEM[v49] >> 96).call(MEM[v3ecdV0x1b2c:v3ecdV0x1b2c + 68], MEM[0:32]).gas(msg.gas);
                        if (!((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v64)) {
                            MEM[v48 + 36] = 0;
                            v65 = (MEM[v49] >> 96).call(MEM[v3ecdV0x1b2c:v3ecdV0x1b2c + 68], MEM[0:32]).gas(msg.gas);
                            require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v65, ApproveFailed());
                            MEM[v48 + 36] = v51;
                            v66 = (MEM[v49] >> 96).call(MEM[v3ecdV0x1b2c:v3ecdV0x1b2c + 68], MEM[0:32]).gas(msg.gas);
                            require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v66, ApproveFailed());
                        }
                    }
                }
                v67 = v68 = 0;
                if (MEM[MEM[64]] >> 240 & 0x200) {
                    v67 = v69 = MEM[v49];
                    v49 = v70 = v49 + 32;
                }
                if (0 != MEM[MEM[64]] >> 247 & 0x3) {
                    if (1 == MEM[MEM[64]] >> 247 & 0x3) {
                        MEM[v48] = v51;
                        v47 = v71 = 32 + v48;
                    } else {
                        v49 = v72 = v49 + (MEM[MEM[64]] >> 247 & 0x3);
                        if (v72 + (MEM[v49] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18)) + 32 > v48) {
                            MEM[v72] = 0xc700990000000000000000000000000000000000000000000000000000000000;
                            revert(v72, 4);
                        } else {
                            MEM[v72 + (MEM[v49] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18))] = v51;
                        }
                    }
                }
                if (MEM[MEM[64]] >> 240 & 0x40) {
                    v56 = v73 = v56 + v51;
                }
                if (v49 > v47) {
                    MEM[v49] = 0x31560a0e00000000000000000000000000000000000000000000000000000000;
                    revert(v49, 4);
                } else {
                    v74 = this.balance;
                    if (v56 > v74) {
                        MEM[v49] = 0xf4d678b800000000000000000000000000000000000000000000000000000000;
                        revert(v49, 4);
                    } else {
                        v75 = v52.call(MEM[v4003_0x2V0x1b2c:v4003_0x2V0x1b2c + v3f72_0x0V0x1b2c - v4003_0x2V0x1b2c], MEM[v4003_0x2V0x1b2c:v4003_0x2V0x1b2c + uint8.max + 1]).value(v56).gas(msg.gas);
                        if (!v75) {
                            if (0x20 & MEM[MEM[64]] >> 240) {
                                RETURNDATACOPY(v49, 0, RETURNDATASIZE());
                                revert(v49, RETURNDATASIZE());
                            }
                        } else if (1 == v75) {
                            if (0 != RETURNDATASIZE() * !(MEM[MEM[64]] >> 240 & 0x1)) {
                                if ((0xe0 & MEM[MEM[64]] >> 236) + 32 > RETURNDATASIZE()) {
                                    MEM[v49] = 0x310a48700000000000000000000000000000000000000000000000000000000;
                                    revert(v49, 4);
                                } else {
                                    v6 = MEM[v49 + (0xe0 & MEM[MEM[64]] >> 236)];
                                    v45 = 1;
                                    if (MEM[MEM[64]] >> 240 & 0x10) {
                                        v6 = v76 = 0 - v6;
                                    }
                                }
                            }
                        }
                        if (MEM[MEM[64]] >> 240 & 0x200) {
                            if (!v45) {
                                MEM[v49] = 0x2dd205a100000000000000000000000000000000000000000000000000000000;
                                revert(v49, 4);
                            } else if (v6 < v67) {
                                MEM[v49] = 0x9a44647500000000000000000000000000000000000000000000000000000000;
                                MEM[v49 + 4] = v6;
                                revert(v49, 36);
                            }
                        }
                    }
                }
            }
        } else {
            v77 = v78 = _SafeDiv(v6 * uint16(v2), v0);
            v0 = v0 - uint16(v2);
            v77 = v79 = 0;
            v80 = v81 = 0;
            CALLDATACOPY(MEM[64], 54 + v8, v10 - v8);
            v82 = v83 = MEM[64] + (v10 - v8);
            v84 = v85 = MEM[64] + 2;
            if (v78 | !(MEM[MEM[64]] >> 240 & 0x8000)) {
                v86 = v87 = this;
                if (MEM[MEM[64]] >> 240 & 0x4000) {
                    v86 = v88 = MEM[v85] >> 96;
                    v84 = v89 = MEM[64] + 22;
                }
                v90 = v91 = 0;
                if (MEM[MEM[64]] >> 240 & 0x2000) {
                    v90 = v92 = MEM[v84] >> 128;
                    v84 = v93 = v84 + 16;
                }
                if (MEM[MEM[64]] >> 240 & 0x1800) {
                    v84 = v94 = v84 + 20;
                    if (MEM[MEM[64]] >> 240 & 0x400) {
                        v86 = v95 = MEM[v94] >> 96;
                        v84 = v96 = v84 + 40;
                    }
                    if (!(MEM[MEM[64]] >> 240 & 0x1000)) {
                        MEM[v83] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
                        MEM[v83 + 4] = v86;
                        MEM[v83 + 36] = v78;
                        v97 = (MEM[v84] >> 96).call(MEM[v3ecdV0x153a1:v3ecdV0x153a1 + 68], MEM[0:32]).gas(msg.gas);
                        require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v97, TransferFailed());
                    } else {
                        MEM[v83] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                        MEM[v83 + 4] = v86;
                        MEM[v83 + 36] = v78;
                        v98 = (MEM[v84] >> 96).call(MEM[v3ecdV0x153a1:v3ecdV0x153a1 + 68], MEM[0:32]).gas(msg.gas);
                        if (!((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v98)) {
                            MEM[v83 + 36] = 0;
                            v99 = (MEM[v84] >> 96).call(MEM[v3ecdV0x153a1:v3ecdV0x153a1 + 68], MEM[0:32]).gas(msg.gas);
                            require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v99, ApproveFailed());
                            MEM[v83 + 36] = v78;
                            v100 = (MEM[v84] >> 96).call(MEM[v3ecdV0x153a1:v3ecdV0x153a1 + 68], MEM[0:32]).gas(msg.gas);
                            require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v100, ApproveFailed());
                        }
                    }
                }
                v101 = v102 = 0;
                if (MEM[MEM[64]] >> 240 & 0x200) {
                    v101 = v103 = MEM[v84];
                    v84 = v104 = v84 + 32;
                }
                if (0 != MEM[MEM[64]] >> 247 & 0x3) {
                    if (1 == MEM[MEM[64]] >> 247 & 0x3) {
                        MEM[v83] = v78;
                        v82 = v105 = 32 + v83;
                    } else {
                        v84 = v106 = v84 + (MEM[MEM[64]] >> 247 & 0x3);
                        if (v106 + (MEM[v84] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18)) + 32 > v83) {
                            MEM[v106] = 0xc700990000000000000000000000000000000000000000000000000000000000;
                            revert(v106, 4);
                        } else {
                            MEM[v106 + (MEM[v84] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18))] = v78;
                        }
                    }
                }
                if (MEM[MEM[64]] >> 240 & 0x40) {
                    v90 = v107 = v90 + v78;
                }
                if (v84 > v82) {
                    MEM[v84] = 0x31560a0e00000000000000000000000000000000000000000000000000000000;
                    revert(v84, 4);
                } else {
                    v108 = this.balance;
                    if (v90 > v108) {
                        MEM[v84] = 0xf4d678b800000000000000000000000000000000000000000000000000000000;
                        revert(v84, 4);
                    } else {
                        v109 = v86.call(MEM[v4003_0x2V0x153a1:v4003_0x2V0x153a1 + v3f72_0x0V0x153a1 - v4003_0x2V0x153a1], MEM[v4003_0x2V0x153a1:v4003_0x2V0x153a1 + uint8.max + 1]).value(v90).gas(msg.gas);
                        if (!v109) {
                            if (0x20 & MEM[MEM[64]] >> 240) {
                                RETURNDATACOPY(v84, 0, RETURNDATASIZE());
                                revert(v84, RETURNDATASIZE());
                            }
                        } else if (1 == v109) {
                            if (0 != RETURNDATASIZE() * !(MEM[MEM[64]] >> 240 & 0x1)) {
                                if ((0xe0 & MEM[MEM[64]] >> 236) + 32 > RETURNDATASIZE()) {
                                    MEM[v84] = 0x310a48700000000000000000000000000000000000000000000000000000000;
                                    revert(v84, 4);
                                } else {
                                    v77 = MEM[v84 + (0xe0 & MEM[MEM[64]] >> 236)];
                                    v80 = 1;
                                    if (MEM[MEM[64]] >> 240 & 0x10) {
                                        v77 = v110 = 0 - v77;
                                    }
                                }
                            }
                        }
                        if (MEM[MEM[64]] >> 240 & 0x200) {
                            if (!v80) {
                                MEM[v84] = 0x2dd205a100000000000000000000000000000000000000000000000000000000;
                                revert(v84, 4);
                            } else if (v77 < v101) {
                                MEM[v84] = 0x9a44647500000000000000000000000000000000000000000000000000000000;
                                MEM[v84 + 4] = v77;
                                revert(v84, 36);
                            }
                        }
                    }
                }
            }
            v111 = v112 = bool(v77);
            if (!v77) {
                v111 = v113 = 1;
            }
            if (v111) {
                v0 = _SafeAdd(v0, v77);
                v6 = v6 - v78;
            }
        }
        v4 = v4 >> 24;
        v2 = v2 >> 16;
    }
    require(!v2);
    return v0;
}

function limited(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    require(varg1 >> 232 <= msg.data.length - 71);
    v0 = v1 = 0;
    CALLDATACOPY(MEM[64], 39, varg1 >> 232);
    v2 = v3 = MEM[64] + (varg1 >> 232);
    v4 = v5 = MEM[64] + 2;
    if (varg0 ^ (msg.data[msg.data.length - 32] ^ varg0) * (msg.data[msg.data.length - 32] < varg0) | !(MEM[MEM[64]] >> 240 & 0x8000)) {
        v6 = v7 = this;
        if (MEM[MEM[64]] >> 240 & 0x4000) {
            v6 = v8 = MEM[v5] >> 96;
            v4 = v9 = MEM[64] + 22;
        }
        v10 = v11 = 0;
        if (MEM[MEM[64]] >> 240 & 0x2000) {
            v10 = v12 = MEM[v4] >> 128;
            v4 = v13 = v4 + 16;
        }
        if (MEM[MEM[64]] >> 240 & 0x1800) {
            v4 = v14 = v4 + 20;
            if (MEM[MEM[64]] >> 240 & 0x400) {
                v6 = v15 = MEM[v14] >> 96;
                v4 = v16 = v4 + 40;
            }
            if (0 == MEM[MEM[64]] >> 240 & 0x1000) {
                MEM[v3] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
                MEM[v3 + 4] = v6;
                MEM[v3 + 36] = varg0 ^ (msg.data[msg.data.length - 32] ^ varg0) * (msg.data[msg.data.length - 32] < varg0);
                v17 = (MEM[v4] >> 96).call(MEM[v1c13:v1c13 + 68], MEM[0:32]).gas(msg.gas);
                require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v17, TransferFailed());
            } else {
                MEM[v3] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                MEM[v3 + 4] = v6;
                MEM[v3 + 36] = varg0 ^ (msg.data[msg.data.length - 32] ^ varg0) * (msg.data[msg.data.length - 32] < varg0);
                v18 = (MEM[v4] >> 96).call(MEM[v1c13:v1c13 + 68], MEM[0:32]).gas(msg.gas);
                if (!((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v18)) {
                    MEM[v3 + 36] = 0;
                    v19 = (MEM[v4] >> 96).call(MEM[v1c13:v1c13 + 68], MEM[0:32]).gas(msg.gas);
                    require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v19, ApproveFailed());
                    MEM[v3 + 36] = varg0 ^ (msg.data[msg.data.length - 32] ^ varg0) * (msg.data[msg.data.length - 32] < varg0);
                    v20 = (MEM[v4] >> 96).call(MEM[v1c13:v1c13 + 68], MEM[0:32]).gas(msg.gas);
                    require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v20, ApproveFailed());
                }
            }
        }
        v21 = v22 = 0;
        if (MEM[MEM[64]] >> 240 & 0x200) {
            v21 = v23 = MEM[v4];
            v4 = v24 = v4 + 32;
        }
        if (0 != MEM[MEM[64]] >> 247 & 0x3) {
            if (1 == MEM[MEM[64]] >> 247 & 0x3) {
                MEM[v3] = (varg0 > msg.data[msg.data.length - 32]) * (varg0 ^ msg.data[msg.data.length - 32]) ^ varg0;
                v2 = v25 = 32 + v3;
            } else {
                v4 = v26 = v4 + (MEM[MEM[64]] >> 247 & 0x3);
                if (v26 + (MEM[v4] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18)) + 32 > v3) {
                    MEM[v26] = 0xc700990000000000000000000000000000000000000000000000000000000000;
                    revert(v26, 4);
                } else {
                    MEM[v26 + (MEM[v4] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18))] = varg0 ^ (msg.data[msg.data.length - 32] ^ varg0) * (msg.data[msg.data.length - 32] < varg0);
                }
            }
        }
        if (MEM[MEM[64]] >> 240 & 0x40) {
            v10 = v27 = (varg0 ^ (msg.data[msg.data.length - 32] ^ varg0) * (msg.data[msg.data.length - 32] < varg0)) + v10;
        }
        if (v4 > v2) {
            MEM[v4] = 0x31560a0e00000000000000000000000000000000000000000000000000000000;
            revert(v4, 4);
        } else if (v10 > this.balance) {
            MEM[v4] = 0xf4d678b800000000000000000000000000000000000000000000000000000000;
            revert(v4, 4);
        } else {
            v28 = v6.call(MEM[v9546_0x3:v9546_0x3 + v1e3f_0x0 - v9546_0x3], MEM[v9546_0x3:v9546_0x3 + uint8.max + 1]).value(v10).gas(msg.gas);
            if (!v28) {
                if (0x20 & MEM[MEM[64]] >> 240) {
                    RETURNDATACOPY(v4, 0, RETURNDATASIZE());
                    revert(v4, RETURNDATASIZE());
                }
            } else if (1 == v28) {
                if (0 == RETURNDATASIZE() * !(MEM[MEM[64]] >> 240 & 0x1)) {
                    v0 = v29 = varg0 ^ (msg.data[msg.data.length - 32] ^ varg0) * (msg.data[msg.data.length - 32] < varg0);
                } else if ((MEM[MEM[64]] >> 236 & 0xe0) + 32 > RETURNDATASIZE()) {
                    MEM[v4] = 0x310a48700000000000000000000000000000000000000000000000000000000;
                    revert(v4, 4);
                } else {
                    v0 = v30 = MEM[v4 + (MEM[MEM[64]] >> 236 & 0xe0)];
                    v0 = v31 = 1;
                    if (MEM[MEM[64]] >> 240 & 0x10) {
                        v0 = v32 = 0 - v30;
                    }
                }
            }
            if (MEM[MEM[64]] >> 240 & 0x200) {
                if (!v0) {
                    MEM[v4] = 0x2dd205a100000000000000000000000000000000000000000000000000000000;
                    revert(v4, 4);
                } else if (v0 < v21) {
                    MEM[v4] = 0x9a44647500000000000000000000000000000000000000000000000000000000;
                    MEM[v4 + 4] = v0;
                    revert(v4, 36);
                }
            }
        }
    }
    v33 = v34 = msg.data[msg.data.length - 32] > varg0;
    if (v34) {
        v33 = v35 = varg1 >> 232 < msg.data.length - 71;
    }
    if (v33) {
        v36 = v37 = msg.data[msg.data.length - 32] - varg0;
        v36 = v38 = 0;
        v39 = v40 = 0;
        CALLDATACOPY(MEM[64], 39 + (varg1 >> 232), msg.data.length - (varg1 >> 232) - 71);
        v41 = v42 = MEM[64] + (msg.data.length - (varg1 >> 232) - 71);
        v43 = v44 = MEM[64] + 2;
        if (v37 | !(MEM[MEM[64]] >> 240 & 0x8000)) {
            v45 = v46 = this;
            if (MEM[MEM[64]] >> 240 & 0x4000) {
                v45 = v47 = MEM[v44] >> 96;
                v43 = v48 = MEM[64] + 22;
            }
            v49 = v50 = 0;
            if (MEM[MEM[64]] >> 240 & 0x2000) {
                v49 = v51 = MEM[v43] >> 128;
                v43 = v52 = v43 + 16;
            }
            if (MEM[MEM[64]] >> 240 & 0x1800) {
                v43 = v53 = v43 + 20;
                if (MEM[MEM[64]] >> 240 & 0x400) {
                    v45 = v54 = MEM[v53] >> 96;
                    v43 = v55 = v43 + 40;
                }
                if (!(MEM[MEM[64]] >> 240 & 0x1000)) {
                    MEM[v42] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
                    MEM[v42 + 4] = v45;
                    MEM[v42 + 36] = v37;
                    v56 = (MEM[v43] >> 96).call(MEM[v3ecdV0x1cc0:v3ecdV0x1cc0 + 68], MEM[0:32]).gas(msg.gas);
                    require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v56, TransferFailed());
                } else {
                    MEM[v42] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                    MEM[v42 + 4] = v45;
                    MEM[v42 + 36] = v37;
                    v57 = (MEM[v43] >> 96).call(MEM[v3ecdV0x1cc0:v3ecdV0x1cc0 + 68], MEM[0:32]).gas(msg.gas);
                    if (!((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v57)) {
                        MEM[v42 + 36] = 0;
                        v58 = (MEM[v43] >> 96).call(MEM[v3ecdV0x1cc0:v3ecdV0x1cc0 + 68], MEM[0:32]).gas(msg.gas);
                        require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v58, ApproveFailed());
                        MEM[v42 + 36] = v37;
                        v59 = (MEM[v43] >> 96).call(MEM[v3ecdV0x1cc0:v3ecdV0x1cc0 + 68], MEM[0:32]).gas(msg.gas);
                        require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v59, ApproveFailed());
                    }
                }
            }
            v60 = v61 = 0;
            if (MEM[MEM[64]] >> 240 & 0x200) {
                v60 = v62 = MEM[v43];
                v43 = v63 = v43 + 32;
            }
            if (0 != MEM[MEM[64]] >> 247 & 0x3) {
                if (1 == MEM[MEM[64]] >> 247 & 0x3) {
                    MEM[v42] = v37;
                    v41 = v64 = 32 + v42;
                } else {
                    v43 = v65 = v43 + (MEM[MEM[64]] >> 247 & 0x3);
                    if (v65 + (MEM[v43] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18)) + 32 > v42) {
                        MEM[v65] = 0xc700990000000000000000000000000000000000000000000000000000000000;
                        revert(v65, 4);
                    } else {
                        MEM[v65 + (MEM[v43] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18))] = v37;
                    }
                }
            }
            if (MEM[MEM[64]] >> 240 & 0x40) {
                v49 = v66 = v49 + v37;
            }
            if (v43 > v41) {
                MEM[v43] = 0x31560a0e00000000000000000000000000000000000000000000000000000000;
                revert(v43, 4);
            } else if (v49 > this.balance) {
                MEM[v43] = 0xf4d678b800000000000000000000000000000000000000000000000000000000;
                revert(v43, 4);
            } else {
                v67 = v45.call(MEM[v4003_0x2V0x1cc0:v4003_0x2V0x1cc0 + v3f72_0x0V0x1cc0 - v4003_0x2V0x1cc0], MEM[v4003_0x2V0x1cc0:v4003_0x2V0x1cc0 + uint8.max + 1]).value(v49).gas(msg.gas);
                if (!v67) {
                    if (0x20 & MEM[MEM[64]] >> 240) {
                        RETURNDATACOPY(v43, 0, RETURNDATASIZE());
                        revert(v43, RETURNDATASIZE());
                    }
                } else if (1 == v67) {
                    if (0 != RETURNDATASIZE() * !(MEM[MEM[64]] >> 240 & 0x1)) {
                        if ((0xe0 & MEM[MEM[64]] >> 236) + 32 > RETURNDATASIZE()) {
                            MEM[v43] = 0x310a48700000000000000000000000000000000000000000000000000000000;
                            revert(v43, 4);
                        } else {
                            v36 = MEM[v43 + (0xe0 & MEM[MEM[64]] >> 236)];
                            v39 = 1;
                            if (MEM[MEM[64]] >> 240 & 0x10) {
                                v36 = v68 = 0 - v36;
                            }
                        }
                    }
                }
                if (MEM[MEM[64]] >> 240 & 0x200) {
                    if (!v39) {
                        MEM[v43] = 0x2dd205a100000000000000000000000000000000000000000000000000000000;
                        revert(v43, 4);
                    } else if (v36 < v60) {
                        MEM[v43] = 0x9a44647500000000000000000000000000000000000000000000000000000000;
                        MEM[v43 + 4] = v36;
                        revert(v43, 36);
                    }
                }
            }
        }
        return v0;
    } else {
        return v0;
    }
}

function 0x773e7756(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    require(!(msg.sender - this), OnlyThis());
    v0 = _SafeMul(varg5, varg2 >> 240);
    v1 = _SafeMul(varg5, varg4 >> 240);
    v2 = _SafeAdd(v0 / 0x186a0, v1 / 0x186a0);
    v3 = _SafeSub(varg5, v2);
    if (varg0 >> 96) {
        0x3707(varg0 >> 96, varg1 >> 96, v0 / 0x186a0);
        0x3707(varg0 >> 96, varg3 >> 96, v1 / 0x186a0);
        return v3;
    } else {
        v4, /* uint256 */ v5 = (varg1 >> 96).call().value(v0 / 0x186a0).gas(msg.gas);
        if (RETURNDATASIZE()) {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v6 = v7 = new bytes[](RETURNDATASIZE());
            require(!((v7 + ((RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v7 + ((RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v7)), Panic(65)); // failed memory allocation (too much memory)
            v5 = v7.data;
            RETURNDATACOPY(v5, 0, RETURNDATASIZE());
        }
        require(v4, ETHTransferFailed());
        v8, /* uint256 */ v9 = (varg3 >> 96).call().value(v1 / 0x186a0).gas(msg.gas);
        if (RETURNDATASIZE()) {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v10 = v11 = new bytes[](RETURNDATASIZE());
            require(!((v11 + ((RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v11 + ((RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v11)), Panic(65)); // failed memory allocation (too much memory)
            v9 = v11.data;
            RETURNDATACOPY(v9, 0, RETURNDATASIZE());
        }
        require(v8, ETHTransferFailed());
        return v3;
    }
}

function chargeFee(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    require(!(msg.sender - this), OnlyThis());
    v0 = _SafeSub(varg3, varg2);
    if (varg0 >> 96) {
        0x3707(varg0 >> 96, varg1 >> 96, varg2);
        return v0;
    } else {
        v1, /* uint256 */ v2 = (varg1 >> 96).call().value(varg2).gas(msg.gas);
        if (RETURNDATASIZE()) {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v3 = v4 = new bytes[](RETURNDATASIZE());
            require(!((v4 + ((RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v4 + ((RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v4)), Panic(65)); // failed memory allocation (too much memory)
            v2 = v4.data;
            RETURNDATACOPY(v2, 0, RETURNDATASIZE());
        }
        require(v1, ETHTransferFailed());
        return v0;
    }
}

function 0x7225b0d0(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    require(!(msg.sender - this), OnlyThis());
    v0 = _SafeAdd(varg2, varg4);
    v1 = _SafeSub(varg5, v0);
    if (varg0 >> 96) {
        0x3707(varg0 >> 96, varg1 >> 96, varg2);
        0x3707(varg0 >> 96, varg3 >> 96, varg4);
        return v1;
    } else {
        v2, /* uint256 */ v3 = (varg1 >> 96).call().value(varg2).gas(msg.gas);
        if (RETURNDATASIZE()) {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v4 = v5 = new bytes[](RETURNDATASIZE());
            require(!((v5 + ((RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v5 + ((RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v5)), Panic(65)); // failed memory allocation (too much memory)
            v3 = v5.data;
            RETURNDATACOPY(v3, 0, RETURNDATASIZE());
        }
        require(v2, ETHTransferFailed());
        v6, /* uint256 */ v7 = (varg3 >> 96).call().value(varg4).gas(msg.gas);
        if (RETURNDATASIZE()) {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v8 = v9 = new bytes[](RETURNDATASIZE());
            require(!((v9 + ((RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v9 + ((RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v9)), Panic(65)); // failed memory allocation (too much memory)
            v7 = v9.data;
            RETURNDATACOPY(v7, 0, RETURNDATASIZE());
        }
        require(v6, ETHTransferFailed());
        return v1;
    }
}

function 0x6f5ec5ce(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    if (!(varg0 >> 96)) {
        v0 = v1 = this.balance;
    } else {
        v2 = (varg0 >> 96).balanceOf(this).gas(msg.gas);
        require(v2, MEM[64], RETURNDATASIZE());
        require(!(RETURNDATASIZE() - 32));
        v0 = v3 = MEM[0];
    }
    v4, v5 = 0x383f();
    if (!(varg0 >> 96)) {
        v6 = v7 = this.balance;
    } else {
        v8 = (varg0 >> 96).balanceOf(this).gas(msg.gas);
        require(v8, MEM[64], RETURNDATASIZE());
        require(!(RETURNDATASIZE() - 32));
        v6 = v9 = MEM[0];
    }
    v10 = _SafeSub(v6, v0);
    return v10;
}

function tokenTransfer(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    require(!(msg.sender - this), OnlyThis());
    0x3707(varg0 >> 96, varg1 >> 96, varg2);
    return varg2;
}

function ethBalanceOf( varg0) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = varg0 >> 96;
    if (!v1) {
        v0 = v2 = this;
    }
    v3 = v4 = v0.balance;
    if (this == v0) {
        if (v4) {
            v3 = uint256.max + v4;
        }
        return v3;
    } else {
        return v4;
    }
}

function swapUniV2(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = 29;
    v2 = v3 = this;
    if ((byte(varg0, 0x0)) & 0x20) {
        v0 = v4 = 49;
        v2 = v5 = varg3 >> 96;
    }
    v6 = v7 = 0;
    if (0x10 & (byte(varg0, 0x0))) {
        v6 = v8 = msg.data[v0];
        v0 = v9 = 32 + v0;
    }
    v10 = v11 = msg.data[v0];
    v12 = (varg2 >> 96).getReserves().gas(msg.gas);
    require(v12, MEM[64], RETURNDATASIZE());
    if ((byte(varg0, 0x0)) & 0x8) {
        v13 = (v11 >> 96).getReserves(varg2 >> 96).gas(msg.gas);
        require(v13, MEM[64], RETURNDATASIZE());
        v10 = v14 = MEM[0] - MEM[!((byte(varg0, 0x0)) >> 7) << 5];
    }
    v15 = v16 = 1000;
    if (varg1 >> 224 > v16) {
        v15 = v17 = 10 ** 9;
    }
    v18 = (v15 - (varg1 >> 224)) * v10 * MEM[(byte(varg0, 0x0)) >> 2 & 0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0] / (MEM[!((byte(varg0, 0x0)) >> 7) << 5] * v15 + (v15 - (varg1 >> 224)) * v10);
    v19 = v20 = MEM[64];
    require(v18 >= v6, ReturnAmountIsNotEnough(v18, v6));
    MEM[v20] = 0x902f1ac022c0d9f6d9a640a70a0823100000000000000000000000000000000;
    if (1 == 0x1 & (byte(varg0, 0x0)) >> 6) {
        v19 = v21 = v20 + 8;
    } else if (!(0x1 & (byte(varg0, 0x0)) >> 6)) {
        v19 = v22 = v20 + 4;
    }
    MEM[v19 + 4] = v18 * !((byte(varg0, 0x0)) >> 7);
    MEM[v19 + 36] = v18 * ((byte(varg0, 0x0)) >> 7);
    MEM[v19 + 68] = v2;
    MEM[v19 + 100] = 128;
    MEM[v19 + 132] = 0;
    v23 = (varg2 >> 96).call(MEM[v99c6_0x1:v99c6_0x1 + 164 - 0x40 & 0x0 byte varg0], MEM[0:0]).gas(msg.gas);
    if (!v23) {
        RETURNDATACOPY(v19, 0, RETURNDATASIZE());
        revert(v19, RETURNDATASIZE());
    } else {
        return v18;
    }
}

function version() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 1;
}

function swapSolidly(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = 29;
    v2 = v3 = this;
    if (0x40 & (byte(varg0, 0x0))) {
        v2 = v4 = varg1 >> 96;
        v0 = v5 = 49;
    }
    v6 = v7 = 0;
    if (0x20 & (byte(varg0, 0x0))) {
        v6 = v8 = msg.data[v0];
        v0 = v9 = v0 + 32;
    }
    v10 = v11 = 0;
    v12 = v13 = 0;
    if ((byte(varg0, 0x0)) >> 4 & 0x1) {
        v10 = v14 = 10 ** (msg.data[v0] >> 248);
        v12 = v15 = 10 ** uint8(msg.data[v0] >> 240);
        v0 = v16 = v0 + 2;
    }
    v17 = v18 = msg.data[v0];
    v19 = address(varg0 >> 56).getReserves().gas(msg.gas);
    require(v19, MEM[64], RETURNDATASIZE());
    v20 = v21 = MEM[0];
    v20 = v22 = MEM[32];
    if ((byte(varg0, 0x0)) & 0x8) {
        v23 = (v18 >> 96).getReserves(address(varg0 >> 56)).gas(msg.gas);
        require(v23, MEM[64], RETURNDATASIZE());
        v20 = v24 = 0;
        if (1 != (byte(varg0, 0x0)) >> 7) {
            if ((byte(varg0, 0x0)) >> 7) {
            }
        }
        v17 = v25 = MEM[0] - v20;
    }
    v26 = v27 = v17 - v17 * uint32(varg0 >> 216) / 10 ** 6;
    v28 = v29 = 0;
    if (1 == (byte(varg0, 0x0)) >> 4 & 0x1) {
        v30 = v31 = v21 * 10 ** 18 / v10;
        v30 = v32 = v22 * 10 ** 18 / v12;
        v30 = v33 = 0;
        v30 = v34 = 0;
        if (1 != (byte(varg0, 0x0)) >> 7) {
            if ((byte(varg0, 0x0)) >> 7) {
            }
        }
        if (1 == (byte(varg0, 0x0)) >> 7) {
            v26 = v35 = v27 * 10 ** 18 / v10;
        } else if (!((byte(varg0, 0x0)) >> 7)) {
            v26 = v36 = v27 * 10 ** 18 / v12;
        }
        v37 = v26 + v30;
        v38 = v39 = 0;
        while (v38 < uint8.max) {
            v40 = v37 * (v30 * v30 / 10 ** 18 * v30 / 10 ** 18) / 10 ** 18 + v37 * v37 / 10 ** 18 * v37 / 10 ** 18 * v30 / 10 ** 18;
            if (1 == v40 < v31 * v32 / 10 ** 18 * (v31 * v31 / 10 ** 18 + v32 * v32 / 10 ** 18) / 10 ** 18) {
                v30 += (v31 * v32 / 10 ** 18 * (v31 * v31 / 10 ** 18 + v32 * v32 / 10 ** 18) / 10 ** 18 - v40) * 10 ** 18 / (v30 * v30 / 10 ** 18 * v37 * 3 / 10 ** 18 + v37 * v37 / 10 ** 18 * v37 / 10 ** 18);
            } else if (v40 >= v31 * v32 / 10 ** 18 * (v31 * v31 / 10 ** 18 + v32 * v32 / 10 ** 18) / 10 ** 18) {
                v30 = v30 - (v40 - v31 * v32 / 10 ** 18 * (v31 * v31 / 10 ** 18 + v32 * v32 / 10 ** 18) / 10 ** 18) * 10 ** 18 / (v30 * v30 / 10 ** 18 * v37 * 3 / 10 ** 18 + v37 * v37 / 10 ** 18 * v37 / 10 ** 18);
            }
            if (1 == v30 > v30) {
                if (1 != v30 - v30 > 1) {
                    if (v30 - v30 > 1) {
                    }
                }
            } else if (v30 <= v30) {
                if (1 != v30 - v30 > 1) {
                    if (v30 - v30 > 1) {
                    }
                }
            }
            v38 = v38 + 1;
            continue;
            break;
            // Unknown jump to Block 0x2af0. Refer to 3-address code (TAC);
        }
        if (1 == (byte(varg0, 0x0)) >> 7) {
            v28 = v41 = (v30 - v30) * v12 / 10 ** 18;
        } else if (!(0 - ((byte(varg0, 0x0)) >> 7))) {
            v28 = v42 = (v30 - v30) * v10 / 10 ** 18;
        }
    } else if (0 == (byte(varg0, 0x0)) >> 4 & 0x1) {
        v20 = v43 = 0;
        v20 = v44 = 0;
        if (1 != (byte(varg0, 0x0)) >> 7) {
            if ((byte(varg0, 0x0)) >> 7) {
            }
        }
        v28 = v45 = v27 * v20 / (v20 + v27);
    }
    require(v28 >= v6, ReturnAmountIsNotEnough(v28, v6));
    v46, /* uint256 */ v47 = address(varg0 >> 56).getReserves(v28 * !((byte(varg0, 0x0)) >> 7), v28 * ((byte(varg0, 0x0)) >> 7), v2, 128, 0).gas(msg.gas);
    require(v46, MEM[64] + 4, RETURNDATASIZE());
    return v28;
}

function execute(address varg0, uint256 varg1) public payable { 
    require(msg.data.length - 4 >= 32);
    v0 = v1 = varg1 >> 16;
    v2 = v3 = msg.data[msg.data.length - 32];
    v4 = v5 = 0;
    while (v0) {
        v4 = v6 = uint24(v0);
        v2 = v7 = 0;
        v8 = v9 = 0;
        CALLDATACOPY(MEM[64], 66 + v4, v6 - v4);
        v10 = v11 = MEM[64] + (v6 - v4);
        v12 = v13 = MEM[64] + 2;
        if (v2 | !(MEM[MEM[64]] >> 240 & 0x8000)) {
            v14 = v15 = this;
            if (MEM[MEM[64]] >> 240 & 0x4000) {
                v14 = v16 = MEM[v13] >> 96;
                v12 = v17 = MEM[64] + 22;
            }
            v18 = v19 = 0;
            if (MEM[MEM[64]] >> 240 & 0x2000) {
                v18 = v20 = MEM[v12] >> 128;
                v12 = v21 = v12 + 16;
            }
            if (MEM[MEM[64]] >> 240 & 0x1800) {
                v12 = v22 = v12 + 20;
                if (MEM[MEM[64]] >> 240 & 0x400) {
                    v14 = v23 = MEM[v22] >> 96;
                    v12 = v24 = v12 + 40;
                }
                if (!(MEM[MEM[64]] >> 240 & 0x1000)) {
                    MEM[v11] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
                    MEM[v11 + 4] = v14;
                    MEM[v11 + 36] = v2;
                    v25 = (MEM[v12] >> 96).call(MEM[v3ecdV0x3647V0x2c8c:v3ecdV0x3647V0x2c8c + 68], MEM[0:32]).gas(msg.gas);
                    require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v25, TransferFailed());
                } else {
                    MEM[v11] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                    MEM[v11 + 4] = v14;
                    MEM[v11 + 36] = v2;
                    v26 = (MEM[v12] >> 96).call(MEM[v3ecdV0x3647V0x2c8c:v3ecdV0x3647V0x2c8c + 68], MEM[0:32]).gas(msg.gas);
                    if (!((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v26)) {
                        MEM[v11 + 36] = 0;
                        v27 = (MEM[v12] >> 96).call(MEM[v3ecdV0x3647V0x2c8c:v3ecdV0x3647V0x2c8c + 68], MEM[0:32]).gas(msg.gas);
                        require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v27, ApproveFailed());
                        MEM[v11 + 36] = v2;
                        v28 = (MEM[v12] >> 96).call(MEM[v3ecdV0x3647V0x2c8c:v3ecdV0x3647V0x2c8c + 68], MEM[0:32]).gas(msg.gas);
                        require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v28, ApproveFailed());
                    }
                }
            }
            v29 = v30 = 0;
            if (MEM[MEM[64]] >> 240 & 0x200) {
                v29 = v31 = MEM[v12];
                v12 = v32 = v12 + 32;
            }
            if (0 != MEM[MEM[64]] >> 247 & 0x3) {
                if (1 == MEM[MEM[64]] >> 247 & 0x3) {
                    MEM[v11] = v2;
                    v10 = v33 = 32 + v11;
                } else {
                    v12 = v34 = v12 + (MEM[MEM[64]] >> 247 & 0x3);
                    if (v34 + (MEM[v12] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18)) + 32 > v11) {
                        MEM[v34] = 0xc700990000000000000000000000000000000000000000000000000000000000;
                        revert(v34, 4);
                    } else {
                        MEM[v34 + (MEM[v12] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18))] = v2;
                    }
                }
            }
            if (MEM[MEM[64]] >> 240 & 0x40) {
                v18 = v35 = v18 + v2;
            }
            if (v12 > v10) {
                MEM[v12] = 0x31560a0e00000000000000000000000000000000000000000000000000000000;
                revert(v12, 4);
            } else {
                v36 = this.balance;
                if (v18 > v36) {
                    MEM[v12] = 0xf4d678b800000000000000000000000000000000000000000000000000000000;
                    revert(v12, 4);
                } else {
                    v37 = v14.call(MEM[v4003_0x2V0x3647V0x2c8c:v4003_0x2V0x3647V0x2c8c + v3f72_0x0V0x3647V0x2c8c - v4003_0x2V0x3647V0x2c8c], MEM[v4003_0x2V0x3647V0x2c8c:v4003_0x2V0x3647V0x2c8c + uint8.max + 1]).value(v18).gas(msg.gas);
                    if (!v37) {
                        if (0x20 & MEM[MEM[64]] >> 240) {
                            RETURNDATACOPY(v12, 0, RETURNDATASIZE());
                            revert(v12, RETURNDATASIZE());
                        }
                    } else if (1 == v37) {
                        if (0 != RETURNDATASIZE() * !(MEM[MEM[64]] >> 240 & 0x1)) {
                            if ((0xe0 & MEM[MEM[64]] >> 236) + 32 > RETURNDATASIZE()) {
                                MEM[v12] = 0x310a48700000000000000000000000000000000000000000000000000000000;
                                revert(v12, 4);
                            } else {
                                v2 = MEM[v12 + (0xe0 & MEM[MEM[64]] >> 236)];
                                v8 = 1;
                                if (MEM[MEM[64]] >> 240 & 0x10) {
                                    v2 = v38 = 0 - v2;
                                }
                            }
                        }
                    }
                    if (MEM[MEM[64]] >> 240 & 0x200) {
                        if (!v8) {
                            MEM[v12] = 0x2dd205a100000000000000000000000000000000000000000000000000000000;
                            revert(v12, 4);
                        } else if (v2 < v29) {
                            MEM[v12] = 0x9a44647500000000000000000000000000000000000000000000000000000000;
                            MEM[v12 + 4] = v2;
                            revert(v12, 36);
                        }
                    }
                }
            }
        }
        v0 = v0 >> 24;
    }
    return v2;
}

function 0x4b02d2f6() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    require(!(block.timestamp % 12 - 11));
    CALLDATACOPY(0, 4, 32);
    return MEM[0:32];
}

function 0x454c96c2(uint256 varg0, uint256 varg1, uint256 varg2) public payable { 
    require(msg.data.length - 4 >= 0);
    v0 = new uint256[](varg2 >> 192);
    v1 = v2 = 0;
    v3 = v4 = 0;
    while (v3 < (varg2 >> 192) * 48) {
        v1 = v1 + (msg.data[v3 + 84] >> 128);
        v3 += 48;
    }
    v5 = v6 = msg.data[msg.data.length - 32];
    v7 = v8 = v0.data;
    v9 = v10 = 0;
    while (v9 < (varg2 >> 192) * 48) {
        MEM[v7] = msg.data[v9 + 52];
        MEM[v7 + 32] = v5 * (msg.data[v9 + 84] >> 128) / v1;
        v7 = v7 + 64;
        v5 = v5 - v5 * (msg.data[v9 + 84] >> 128) / v1;
        v1 = v1 - (msg.data[v9 + 84] >> 128);
        v9 += 48;
    }
    v11, /* uint256 */ v12 = 0xc537e898cd774e2dcba3b14ea6f34c93d5ea45e1.tradeBySourceAmount(varg0 >> 96, varg1 >> 96, v0, uint40.max, 1).value(msg.value).gas(msg.gas);
    require(v11, MEM[64], RETURNDATASIZE());
    return v12;
}

function d3MMSwapCallBack(address token, uint256 value, bytes data) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(data <= uint64.max);
    require(data + 35 < msg.data.length);
    require(data.length <= uint64.max);
    require(36 + (data + data.length) <= msg.data.length);
    0x3707(token, msg.sender, value);
}

function 0x3dd5cfd1(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = 0;
    v2 = v3 = 0;
    if (36 == msg.data.length) {
        v0 = v4 = this;
    } else if (56 == msg.data.length) {
        v0 = v5 = varg0 >> 96;
    } else if (44 == msg.data.length) {
        v0 = v6 = this;
        v2 = v7 = varg0 >> 192;
    } else if (64 == msg.data.length) {
        v0 = v8 = varg0 >> 96;
        v2 = v9 = varg2 >> 192;
    }
    v10 = v11 = v0 / 10 ** 12 * 10 ** 12;
    if (v2) {
        v10 = v12 = v0 / 10 ** 12 * v2 * 10 ** 12 / 10 ** 18 + v11;
    }
    v13 = 0x41d5(v10);
    if (!v13) {
        v14 = v15 = 0x6b175474e89094c44da98b954eedeac495271d0f.approve(0xf6e72db5454dd049d0788e411b06cfaf16853042, 0).gas(msg.gas);
        if (v15) {
            if (!RETURNDATASIZE()) {
                v14 = v16 = bool(0x6b175474e89094c44da98b954eedeac495271d0f.code.size);
            } else {
                v14 = v17 = (RETURNDATASIZE() > 31) & (MEM[0] == 1);
            }
        }
        v18 = v19 = !v14;
        if (bool(v14)) {
            v20 = 0x41d5(v10);
            v18 = v21 = !v20;
        }
        require(!v18, ForceApproveFailed());
    }
    v22, /* uint256 */ v23 = 0xf6e72db5454dd049d0788e411b06cfaf16853042.buyGem(v0, v0 / 10 ** 12).gas(msg.gas);
    require(v22, MEM[64], RETURNDATASIZE());
    return v0 / 10 ** 12;
}

function 0x26678dcd(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    require(!(msg.sender - this), OnlyThis());
    if (0 == !(varg0 >> 96)) {
        0x3707(varg0 >> 96, varg1 >> 96, varg2);
        return varg2;
    } else {
        v0, /* uint256 */ v1 = (varg1 >> 96).call().value(varg2).gas(msg.gas);
        if (RETURNDATASIZE()) {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v2 = v3 = new bytes[](RETURNDATASIZE());
            require(!((v3 + ((RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v3 + ((RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v3)), Panic(65)); // failed memory allocation (too much memory)
            v1 = v3.data;
            RETURNDATACOPY(v1, 0, RETURNDATASIZE());
        }
        require(v0, ETHTransferFailed());
        return varg2;
    }
}

function callBytes(address _receiver, bytes _data) public payable { 
    require(msg.data.length - 4 >= 32);
    v0 = v1 = _data >> 16;
    v2 = v3 = msg.data[msg.data.length - 32];
    v4 = v5 = 0;
    while (1) {
        if (v0) {
            v4 = v6 = uint24(v0);
            v2 = v7 = 0;
            v8 = v9 = 0;
            CALLDATACOPY(MEM[64], 66 + v4, v6 - v4);
            v10 = v11 = MEM[64] + (v6 - v4);
            v12 = v13 = MEM[64] + 2;
            if (v2 | !(MEM[MEM[64]] >> 240 & 0x8000)) {
                v14 = v15 = this;
                if (MEM[MEM[64]] >> 240 & 0x4000) {
                    v14 = v16 = MEM[v13] >> 96;
                    v12 = v17 = MEM[64] + 22;
                }
                v18 = v19 = 0;
                if (MEM[MEM[64]] >> 240 & 0x2000) {
                    v18 = v20 = MEM[v12] >> 128;
                    v12 = v21 = v12 + 16;
                }
                if (MEM[MEM[64]] >> 240 & 0x1800) {
                    v12 = v22 = v12 + 20;
                    if (MEM[MEM[64]] >> 240 & 0x400) {
                        v14 = v23 = MEM[v22] >> 96;
                        v12 = v24 = v12 + 40;
                    }
                    if (!(MEM[MEM[64]] >> 240 & 0x1000)) {
                        MEM[v11] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
                        MEM[v11 + 4] = v14;
                        MEM[v11 + 36] = v2;
                        v25 = (MEM[v12] >> 96).call(MEM[v3ecdV0x3647V0x3188:v3ecdV0x3647V0x3188 + 68], MEM[0:32]).gas(msg.gas);
                        require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v25, TransferFailed());
                    } else {
                        MEM[v11] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                        MEM[v11 + 4] = v14;
                        MEM[v11 + 36] = v2;
                        v26 = (MEM[v12] >> 96).call(MEM[v3ecdV0x3647V0x3188:v3ecdV0x3647V0x3188 + 68], MEM[0:32]).gas(msg.gas);
                        if (!((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v26)) {
                            MEM[v11 + 36] = 0;
                            v27 = (MEM[v12] >> 96).call(MEM[v3ecdV0x3647V0x3188:v3ecdV0x3647V0x3188 + 68], MEM[0:32]).gas(msg.gas);
                            require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v27, ApproveFailed());
                            MEM[v11 + 36] = v2;
                            v28 = (MEM[v12] >> 96).call(MEM[v3ecdV0x3647V0x3188:v3ecdV0x3647V0x3188 + 68], MEM[0:32]).gas(msg.gas);
                            require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v28, ApproveFailed());
                        }
                    }
                }
                v29 = v30 = 0;
                if (MEM[MEM[64]] >> 240 & 0x200) {
                    v29 = v31 = MEM[v12];
                    v12 = v32 = v12 + 32;
                }
                if (0 != MEM[MEM[64]] >> 247 & 0x3) {
                    if (1 == MEM[MEM[64]] >> 247 & 0x3) {
                        MEM[v11] = v2;
                        v10 = v33 = 32 + v11;
                    } else {
                        v12 = v34 = v12 + (MEM[MEM[64]] >> 247 & 0x3);
                        if (v34 + (MEM[v12] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18)) + 32 > v11) {
                            MEM[v34] = 0xc700990000000000000000000000000000000000000000000000000000000000;
                            revert(v34, 4);
                        } else {
                            MEM[v34 + (MEM[v12] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18))] = v2;
                        }
                    }
                }
                if (MEM[MEM[64]] >> 240 & 0x40) {
                    v18 = v35 = v18 + v2;
                }
                if (v12 > v10) {
                    MEM[v12] = 0x31560a0e00000000000000000000000000000000000000000000000000000000;
                    revert(v12, 4);
                } else {
                    v36 = this.balance;
                    if (v18 > v36) {
                        MEM[v12] = 0xf4d678b800000000000000000000000000000000000000000000000000000000;
                        revert(v12, 4);
                    } else {
                        v37 = v14.call(MEM[v4003_0x2V0x3647V0x3188:v4003_0x2V0x3647V0x3188 + v3f72_0x0V0x3647V0x3188 - v4003_0x2V0x3647V0x3188], MEM[v4003_0x2V0x3647V0x3188:v4003_0x2V0x3647V0x3188 + uint8.max + 1]).value(v18).gas(msg.gas);
                        if (!v37) {
                            if (0x20 & MEM[MEM[64]] >> 240) {
                                RETURNDATACOPY(v12, 0, RETURNDATASIZE());
                                revert(v12, RETURNDATASIZE());
                            }
                        } else if (1 == v37) {
                            if (0 != RETURNDATASIZE() * !(MEM[MEM[64]] >> 240 & 0x1)) {
                                if ((0xe0 & MEM[MEM[64]] >> 236) + 32 > RETURNDATASIZE()) {
                                    MEM[v12] = 0x310a48700000000000000000000000000000000000000000000000000000000;
                                    revert(v12, 4);
                                } else {
                                    v2 = MEM[v12 + (0xe0 & MEM[MEM[64]] >> 236)];
                                    v8 = 1;
                                    if (MEM[MEM[64]] >> 240 & 0x10) {
                                        v2 = v38 = 0 - v2;
                                    }
                                }
                            }
                        }
                        if (MEM[MEM[64]] >> 240 & 0x200) {
                            if (!v8) {
                                MEM[v12] = 0x2dd205a100000000000000000000000000000000000000000000000000000000;
                                revert(v12, 4);
                            } else if (v2 < v29) {
                                MEM[v12] = 0x9a44647500000000000000000000000000000000000000000000000000000000;
                                MEM[v12 + 4] = v2;
                                revert(v12, 36);
                            }
                        }
                    }
                }
            }
            v0 = v0 >> 24;
            continue;
        } else {
            exit;
        }
    }
}

function 0x26367361(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = 0;
    if (!((varg1 ^ 0x27a9b42400000000000000000000000000000000000000000000000000000000) >> 224)) {
        v0 = v2 = msg.data[msg.data.length - 224];
    }
    CALLDATACOPY(MEM[64], 24, msg.data.length - 24);
    MEM[MEM[64] + msg.data.length - 24] = msg.data.length + 4;
    MEM[MEM[64] + msg.data.length + 39] = 0x531696e63680000000000000000000000000000000000000000000000000000;
    v3, /* uint256 */ v4 = (varg0 >> 96).call(MEM[MEM[64]:MEM[64] + msg.data.length + 45], MEM[MEM[64]:MEM[64]]).value(v0).gas(msg.gas);
    require(v3, MEM[64], RETURNDATASIZE());
    return msg.data[msg.data.length - 192];
}

function tokenApprove(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    require(!(msg.sender - this), OnlyThis());
    0x366b(varg0 >> 96, varg1 >> 96, varg2);
    return varg2;
}

function 0x10c3405f(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    require(!(msg.sender - this), OnlyThis());
    v0 = v1 = varg1 >> 16;
    v2 = v3 = msg.data[msg.data.length - 32];
    v4 = v5 = 0;
    while (v0) {
        v4 = v6 = uint24(v0);
        v2 = v7 = 0;
        v8 = v9 = 0;
        CALLDATACOPY(MEM[64], 66 + v4, v6 - v4);
        v10 = v11 = MEM[64] + (v6 - v4);
        v12 = v13 = MEM[64] + 2;
        if (v2 | !(MEM[MEM[64]] >> 240 & 0x8000)) {
            v14 = v15 = this;
            if (MEM[MEM[64]] >> 240 & 0x4000) {
                v14 = v16 = MEM[v13] >> 96;
                v12 = v17 = MEM[64] + 22;
            }
            v18 = v19 = 0;
            if (MEM[MEM[64]] >> 240 & 0x2000) {
                v18 = v20 = MEM[v12] >> 128;
                v12 = v21 = v12 + 16;
            }
            if (MEM[MEM[64]] >> 240 & 0x1800) {
                v12 = v22 = v12 + 20;
                if (MEM[MEM[64]] >> 240 & 0x400) {
                    v14 = v23 = MEM[v22] >> 96;
                    v12 = v24 = v12 + 40;
                }
                if (!(MEM[MEM[64]] >> 240 & 0x1000)) {
                    MEM[v11] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
                    MEM[v11 + 4] = v14;
                    MEM[v11 + 36] = v2;
                    v25 = (MEM[v12] >> 96).call(MEM[v3ecdV0x3647V0x335f:v3ecdV0x3647V0x335f + 68], MEM[0:32]).gas(msg.gas);
                    require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v25, TransferFailed());
                } else {
                    MEM[v11] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                    MEM[v11 + 4] = v14;
                    MEM[v11 + 36] = v2;
                    v26 = (MEM[v12] >> 96).call(MEM[v3ecdV0x3647V0x335f:v3ecdV0x3647V0x335f + 68], MEM[0:32]).gas(msg.gas);
                    if (!((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v26)) {
                        MEM[v11 + 36] = 0;
                        v27 = (MEM[v12] >> 96).call(MEM[v3ecdV0x3647V0x335f:v3ecdV0x3647V0x335f + 68], MEM[0:32]).gas(msg.gas);
                        require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v27, ApproveFailed());
                        MEM[v11 + 36] = v2;
                        v28 = (MEM[v12] >> 96).call(MEM[v3ecdV0x3647V0x335f:v3ecdV0x3647V0x335f + 68], MEM[0:32]).gas(msg.gas);
                        require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v28, ApproveFailed());
                    }
                }
            }
            v29 = v30 = 0;
            if (MEM[MEM[64]] >> 240 & 0x200) {
                v29 = v31 = MEM[v12];
                v12 = v32 = v12 + 32;
            }
            if (0 != MEM[MEM[64]] >> 247 & 0x3) {
                if (1 == MEM[MEM[64]] >> 247 & 0x3) {
                    MEM[v11] = v2;
                    v10 = v33 = 32 + v11;
                } else {
                    v12 = v34 = v12 + (MEM[MEM[64]] >> 247 & 0x3);
                    if (v34 + (MEM[v12] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18)) + 32 > v11) {
                        MEM[v34] = 0xc700990000000000000000000000000000000000000000000000000000000000;
                        revert(v34, 4);
                    } else {
                        MEM[v34 + (MEM[v12] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18))] = v2;
                    }
                }
            }
            if (MEM[MEM[64]] >> 240 & 0x40) {
                v18 = v35 = v18 + v2;
            }
            if (v12 > v10) {
                MEM[v12] = 0x31560a0e00000000000000000000000000000000000000000000000000000000;
                revert(v12, 4);
            } else {
                v36 = this.balance;
                if (v18 > v36) {
                    MEM[v12] = 0xf4d678b800000000000000000000000000000000000000000000000000000000;
                    revert(v12, 4);
                } else {
                    v37 = v14.call(MEM[v4003_0x2V0x3647V0x335f:v4003_0x2V0x3647V0x335f + v3f72_0x0V0x3647V0x335f - v4003_0x2V0x3647V0x335f], MEM[v4003_0x2V0x3647V0x335f:v4003_0x2V0x3647V0x335f + uint8.max + 1]).value(v18).gas(msg.gas);
                    if (!v37) {
                        if (0x20 & MEM[MEM[64]] >> 240) {
                            RETURNDATACOPY(v12, 0, RETURNDATASIZE());
                            revert(v12, RETURNDATASIZE());
                        }
                    } else if (1 == v37) {
                        if (0 != RETURNDATASIZE() * !(MEM[MEM[64]] >> 240 & 0x1)) {
                            if ((0xe0 & MEM[MEM[64]] >> 236) + 32 > RETURNDATASIZE()) {
                                MEM[v12] = 0x310a48700000000000000000000000000000000000000000000000000000000;
                                revert(v12, 4);
                            } else {
                                v2 = MEM[v12 + (0xe0 & MEM[MEM[64]] >> 236)];
                                v8 = 1;
                                if (MEM[MEM[64]] >> 240 & 0x10) {
                                    v2 = v38 = 0 - v2;
                                }
                            }
                        }
                    }
                    if (MEM[MEM[64]] >> 240 & 0x200) {
                        if (!v8) {
                            MEM[v12] = 0x2dd205a100000000000000000000000000000000000000000000000000000000;
                            revert(v12, 4);
                        } else if (v2 < v29) {
                            MEM[v12] = 0x9a44647500000000000000000000000000000000000000000000000000000000;
                            MEM[v12 + 4] = v2;
                            revert(v12, 36);
                        }
                    }
                }
            }
        }
        v0 = v0 >> 24;
    }
    require(v2 >= varg0, ReturnAmountIsNotEnough(v2, varg0));
    return v2;
}

function 0x07e5c0d2(uint256 varg0) public payable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = msg.data[msg.data.length - 32];
    v2 = v3 = varg0 >> 16;
    v4 = v5 = 0;
    while (v2) {
        v4 = v6 = uint24(v2);
        v0 = v7 = 0;
        v8 = v9 = 0;
        CALLDATACOPY(MEM[64], 34 + v4, v6 - v4);
        v10 = v11 = MEM[64] + (v6 - v4);
        v12 = v13 = MEM[64] + 2;
        if (v0 | !(MEM[MEM[64]] >> 240 & 0x8000)) {
            v14 = v15 = this;
            if (MEM[MEM[64]] >> 240 & 0x4000) {
                v14 = v16 = MEM[v13] >> 96;
                v12 = v17 = MEM[64] + 22;
            }
            v18 = v19 = 0;
            if (MEM[MEM[64]] >> 240 & 0x2000) {
                v18 = v20 = MEM[v12] >> 128;
                v12 = v21 = v12 + 16;
            }
            if (MEM[MEM[64]] >> 240 & 0x1800) {
                v12 = v22 = v12 + 20;
                if (MEM[MEM[64]] >> 240 & 0x400) {
                    v14 = v23 = MEM[v22] >> 96;
                    v12 = v24 = v12 + 40;
                }
                if (!(MEM[MEM[64]] >> 240 & 0x1000)) {
                    MEM[v11] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
                    MEM[v11 + 4] = v14;
                    MEM[v11 + 36] = v0;
                    v25 = (MEM[v12] >> 96).call(MEM[v3ecdV0x3403:v3ecdV0x3403 + 68], MEM[0:32]).gas(msg.gas);
                    require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v25, TransferFailed());
                } else {
                    MEM[v11] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                    MEM[v11 + 4] = v14;
                    MEM[v11 + 36] = v0;
                    v26 = (MEM[v12] >> 96).call(MEM[v3ecdV0x3403:v3ecdV0x3403 + 68], MEM[0:32]).gas(msg.gas);
                    if (!((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v26)) {
                        MEM[v11 + 36] = 0;
                        v27 = (MEM[v12] >> 96).call(MEM[v3ecdV0x3403:v3ecdV0x3403 + 68], MEM[0:32]).gas(msg.gas);
                        require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v27, ApproveFailed());
                        MEM[v11 + 36] = v0;
                        v28 = (MEM[v12] >> 96).call(MEM[v3ecdV0x3403:v3ecdV0x3403 + 68], MEM[0:32]).gas(msg.gas);
                        require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v28, ApproveFailed());
                    }
                }
            }
            v29 = v30 = 0;
            if (MEM[MEM[64]] >> 240 & 0x200) {
                v29 = v31 = MEM[v12];
                v12 = v32 = v12 + 32;
            }
            if (0 != MEM[MEM[64]] >> 247 & 0x3) {
                if (1 == MEM[MEM[64]] >> 247 & 0x3) {
                    MEM[v11] = v0;
                    v10 = v33 = 32 + v11;
                } else {
                    v12 = v34 = v12 + (MEM[MEM[64]] >> 247 & 0x3);
                    if (v34 + (MEM[v12] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18)) + 32 > v11) {
                        MEM[v34] = 0xc700990000000000000000000000000000000000000000000000000000000000;
                        revert(v34, 4);
                    } else {
                        MEM[v34 + (MEM[v12] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18))] = v0;
                    }
                }
            }
            if (MEM[MEM[64]] >> 240 & 0x40) {
                v18 = v35 = v18 + v0;
            }
            if (v12 > v10) {
                MEM[v12] = 0x31560a0e00000000000000000000000000000000000000000000000000000000;
                revert(v12, 4);
            } else {
                v36 = this.balance;
                if (v18 > v36) {
                    MEM[v12] = 0xf4d678b800000000000000000000000000000000000000000000000000000000;
                    revert(v12, 4);
                } else {
                    v37 = v14.call(MEM[v4003_0x2V0x3403:v4003_0x2V0x3403 + v3f72_0x0V0x3403 - v4003_0x2V0x3403], MEM[v4003_0x2V0x3403:v4003_0x2V0x3403 + uint8.max + 1]).value(v18).gas(msg.gas);
                    if (!v37) {
                        if (0x20 & MEM[MEM[64]] >> 240) {
                            RETURNDATACOPY(v12, 0, RETURNDATASIZE());
                            revert(v12, RETURNDATASIZE());
                        }
                    } else if (1 == v37) {
                        if (0 != RETURNDATASIZE() * !(MEM[MEM[64]] >> 240 & 0x1)) {
                            if ((0xe0 & MEM[MEM[64]] >> 236) + 32 > RETURNDATASIZE()) {
                                MEM[v12] = 0x310a48700000000000000000000000000000000000000000000000000000000;
                                revert(v12, 4);
                            } else {
                                v0 = MEM[v12 + (0xe0 & MEM[MEM[64]] >> 236)];
                                v8 = 1;
                                if (MEM[MEM[64]] >> 240 & 0x10) {
                                    v0 = v38 = 0 - v0;
                                }
                            }
                        }
                    }
                    if (MEM[MEM[64]] >> 240 & 0x200) {
                        if (!v8) {
                            MEM[v12] = 0x2dd205a100000000000000000000000000000000000000000000000000000000;
                            revert(v12, 4);
                        } else if (v0 < v29) {
                            MEM[v12] = 0x9a44647500000000000000000000000000000000000000000000000000000000;
                            MEM[v12 + 4] = v0;
                            revert(v12, 36);
                        }
                    }
                }
            }
        }
        v2 = v2 >> 24;
    }
    return v0;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= varg0 + varg1, Panic(17)); // arithmetic overflow or underflow
    return varg0 + varg1;
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require((varg0 * varg1 / varg0 == varg1) | !varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 * varg1;
}

function 0x3597(uint256 varg0) private { 
    require(varg0, Panic(18)); // division by zero
    return 10 ** 36 / varg0;
}

function _SafeDiv(uint256 varg0, uint256 varg1) private { 
    require(varg1, Panic(18)); // division by zero
    return varg0 / varg1;
}

function 0x366b(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    v0 = 0x42d0(varg0, varg1, varg2);
    if (!v0) {
        v1 = varg0.approve(varg1, 0).gas(msg.gas);
        if (v1) {
            if (!RETURNDATASIZE()) {
                v1 = v2 = bool(varg0.code.size);
            } else {
                v1 = v3 = (RETURNDATASIZE() > 31) & (MEM[0] == 1);
            }
        }
        v4 = !v1;
        if (bool(v1)) {
            v5 = 0x42d0(varg0, varg1, varg2);
            v4 = v6 = !v5;
        }
        require(!v4, ForceApproveFailed());
        return ;
    } else {
        return ;
    }
}

function 0x3707(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    v0 = v1 = varg0.transfer(varg1, varg2).gas(msg.gas);
    if (v1) {
        if (!RETURNDATASIZE()) {
            v0 = v2 = bool(varg0.code.size);
        } else {
            v0 = (RETURNDATASIZE() > 31) & (MEM[0] == 1);
        }
    }
    require(v0, SafeTransferFailed());
    return ;
}

function 0x383f() private { 
    v0 = v1 = msg.data[msg.data.length - 32];
    v0 = v2 = 0;
    v3 = v4 = 0;
    CALLDATACOPY(MEM[64], 24, msg.data.length - 56);
    v5 = v6 = MEM[64] + msg.data.length - 56;
    v7 = v8 = MEM[64] + 2;
    if (v1 | !(MEM[MEM[64]] >> 240 & 0x8000)) {
        v9 = v10 = this;
        if (MEM[MEM[64]] >> 240 & 0x4000) {
            v9 = v11 = MEM[v8] >> 96;
            v7 = v12 = MEM[64] + 22;
        }
        v13 = v14 = 0;
        if (MEM[MEM[64]] >> 240 & 0x2000) {
            v13 = v15 = MEM[v7] >> 128;
            v7 = v16 = v7 + 16;
        }
        if (MEM[MEM[64]] >> 240 & 0x1800) {
            v7 = v17 = v7 + 20;
            if (MEM[MEM[64]] >> 240 & 0x400) {
                v9 = v18 = MEM[v17] >> 96;
                v7 = v19 = v7 + 40;
            }
            if (!(MEM[MEM[64]] >> 240 & 0x1000)) {
                MEM[v6] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
                MEM[MEM[64] + msg.data.length - 52] = v9;
                MEM[MEM[64] + msg.data.length - 20] = v1;
                v20 = (MEM[v7] >> 96).call(MEM[v389c:v389c + 68], MEM[0:32]).gas(msg.gas);
                require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v20, TransferFailed());
            } else {
                MEM[v6] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                MEM[MEM[64] + msg.data.length - 52] = v9;
                MEM[MEM[64] + msg.data.length - 20] = v1;
                v21 = (MEM[v7] >> 96).call(MEM[v389c:v389c + 68], MEM[0:32]).gas(msg.gas);
                if (!((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v21)) {
                    MEM[MEM[64] + msg.data.length - 20] = 0;
                    v22 = (MEM[v7] >> 96).call(MEM[v389c:v389c + 68], MEM[0:32]).gas(msg.gas);
                    require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v22, ApproveFailed());
                    MEM[MEM[64] + msg.data.length - 20] = v1;
                    v23 = (MEM[v7] >> 96).call(MEM[v389c:v389c + 68], MEM[0:32]).gas(msg.gas);
                    require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v23, ApproveFailed());
                }
            }
        }
        v24 = v25 = 0;
        if (MEM[MEM[64]] >> 240 & 0x200) {
            v24 = v26 = MEM[v7];
            v7 = v27 = v7 + 32;
        }
        if (0 != MEM[MEM[64]] >> 247 & 0x3) {
            if (1 == MEM[MEM[64]] >> 247 & 0x3) {
                MEM[v6] = v1;
                v5 = v28 = MEM[64] + msg.data.length - 24;
            } else {
                v7 = v29 = v7 + (MEM[MEM[64]] >> 247 & 0x3);
                if (v29 + (MEM[v7] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18)) + 32 > v6) {
                    MEM[v29] = 0xc700990000000000000000000000000000000000000000000000000000000000;
                    revert(v29, 4);
                } else {
                    MEM[v29 + (MEM[v7] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18))] = v1;
                }
            }
        }
        if (MEM[MEM[64]] >> 240 & 0x40) {
            v13 = v30 = v13 + v1;
        }
        if (v7 > v5) {
            MEM[v7] = 0x31560a0e00000000000000000000000000000000000000000000000000000000;
            revert(v7, 4);
        } else if (v13 > this.balance) {
            MEM[v7] = 0xf4d678b800000000000000000000000000000000000000000000000000000000;
            revert(v7, 4);
        } else {
            v31 = v9.call(MEM[va4f3_0x2:va4f3_0x2 + v3948_0x0 - va4f3_0x2], MEM[va4f3_0x2:va4f3_0x2 + uint8.max + 1]).value(v13).gas(msg.gas);
            if (!v31) {
                if (0x20 & MEM[MEM[64]] >> 240) {
                    RETURNDATACOPY(v7, 0, RETURNDATASIZE());
                    revert(v7, RETURNDATASIZE());
                }
            } else if (1 == v31) {
                if (0 != RETURNDATASIZE() * !(MEM[MEM[64]] >> 240 & 0x1)) {
                    if ((0xe0 & MEM[MEM[64]] >> 236) + 32 > RETURNDATASIZE()) {
                        MEM[v7] = 0x310a48700000000000000000000000000000000000000000000000000000000;
                        revert(v7, 4);
                    } else {
                        v0 = v32 = MEM[v7 + (0xe0 & MEM[MEM[64]] >> 236)];
                        v3 = v33 = 1;
                        if (MEM[MEM[64]] >> 240 & 0x10) {
                            v0 = v34 = 0 - v32;
                        }
                    }
                }
            }
            if (MEM[MEM[64]] >> 240 & 0x200) {
                if (!v3) {
                    MEM[v7] = 0x2dd205a100000000000000000000000000000000000000000000000000000000;
                    revert(v7, 4);
                } else if (v0 < v24) {
                    MEM[v7] = 0x9a44647500000000000000000000000000000000000000000000000000000000;
                    MEM[v7 + 4] = v0;
                    revert(v7, 36);
                }
            }
        }
    }
    return v3, v0;
}

function 0x3cc1(uint256 varg0, struct(11) varg1) private { 
    v0 = 0x3597(varg1.word0);
    v1 = 0x43f3(varg1.word4, varg1.word4, v0 * varg0 / 10 ** 18, varg1.word1);
    return varg1.word4 - v1;
}

function 0x3cf6(uint256 varg0, address varg1, uint256 varg2) private { 
    if (varg2) {
        v0 = v1 = !address(varg0);
        if (bool(address(varg0))) {
            v0 = v2 = address(varg0) == 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee;
        }
        if (!v0) {
            0x3707(varg0, varg1, varg2);
            return ;
        } else {
            require(this.balance >= varg2, InsufficientBalance());
            v3, /* uint256 */ v4 = varg1.call().value(varg2).gas(msg.gas);
            if (RETURNDATASIZE()) {
                require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                v5 = v6 = new bytes[](RETURNDATASIZE());
                require(!((v6 + ((RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v6 + ((RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v6)), Panic(65)); // failed memory allocation (too much memory)
                v4 = v6.data;
                RETURNDATACOPY(v4, 0, RETURNDATASIZE());
            }
            require(v3, ETHTransferFailed());
            return ;
        }
    } else {
        return ;
    }
}

function 0x41d5(uint256 varg0) private { 
    v0 = 0x6b175474e89094c44da98b954eedeac495271d0f.approve(0xf6e72db5454dd049d0788e411b06cfaf16853042, varg0).gas(msg.gas);
    if (v0) {
        if (!RETURNDATASIZE()) {
            return bool(0x6b175474e89094c44da98b954eedeac495271d0f.code.size);
        } else {
            return (RETURNDATASIZE() > 31) & (MEM[0] == 1);
        }
    } else {
        return v0;
    }
}

function 0x4261(uint256 varg0) private { 
    v0 = 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48.approve(0xf6e72db5454dd049d0788e411b06cfaf16853042, varg0).gas(msg.gas);
    if (v0) {
        if (!RETURNDATASIZE()) {
            return bool(0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48.code.size);
        } else {
            return (RETURNDATASIZE() > 31) & (MEM[0] == 1);
        }
    } else {
        return v0;
    }
}

function 0x42d0(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    v0 = varg0.approve(varg1, varg2).gas(msg.gas);
    if (v0) {
        if (!RETURNDATASIZE()) {
            return bool(varg0.code.size);
        } else {
            return (RETURNDATASIZE() > 31) & (MEM[0] == 1);
        }
    } else {
        return v0;
    }
}

function 0x4317(struct(11) varg0) private { 
    require(varg0.word6 < 3, Panic(33)); // failed convertion to enum type
    if (varg0.word6) {
        require(varg0.word6 < 3, Panic(33)); // failed convertion to enum type
        if (2 - varg0.word6) {
            require(varg0.word6 < 3, Panic(33)); // failed convertion to enum type
            if (1 == varg0.word6) {
                v0 = _SafeDiv((varg0.word3 - varg0.word10) * 10 ** 18, varg0.word0);
                v1 = 0x44a7(varg0.word2, varg0.word1, v0);
                return varg0.word10, v1 - varg0.word2 + varg0.word2;
            } else {
                return 0, 0;
            }
        } else {
            v2 = 0x44a7(varg0.word3, varg0.word1, varg0.word0 * (varg0.word2 - varg0.word9) / 10 ** 18);
            return v2 - varg0.word3 + varg0.word3, varg0.word9;
        }
    } else {
        return varg0.word10, varg0.word9;
    }
}

function 0x43f3(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) private { 
    v0 = varg3 * varg0 / 10 ** 18 * varg0;
    v1 = _SafeDiv(v0, varg1);
    v2 = (10 ** 18 - varg3) * varg1 / 10 ** 18;
    if (0 == v2 >= v1 + varg2) {
        v3 = v4, v5 = v6, v7 = v8, v9 = v10, v11 = v12 = 0x4432(v0, 10 ** 18, 17473, v1 + varg2 - v2, 0, 10 ** 18);
    } else {
        v3 = v13, v5 = v14, v7 = v15, v9 = v16, v11 = v17 = 0x4432(v0, 10 ** 18, 17473, v2 - (v1 + varg2), 1, 10 ** 18);
    }
    if (!v7) {
        v18 = v19 = v3 - v5;
    } else {
        v18 = v20 = v5 + v3;
    }
    v21 = v22 = _SafeDiv(v18 * v9, v11 << 1);
    if (v22 * (v11 << 1) != v18 * v9) {
        v21 = 1 + v22;
    }
    return v21;
}

function 0x4432(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5) private { 
    v0 = v1 = varg3 * varg3 + (v2 << 2) * varg0 / varg1;
    if (1 == v1 > 2) {
        v0 = (v1 >> 1) + 1;
        while (v0 < v0) {
            v0 = v0 + v1 / v0 >> 1;
        }
        return v0, varg3, varg4, varg5, v2;
    } else {
        return 1 + v1 >> 1, varg3, varg4, varg5, v2;
    }
}

function 0x446c(uint256 varg0) private { 
    if (1 == varg0 > 2) {
        varg0 = v0 = (varg0 >> 1) + 1;
        while (varg0 < varg0) {
            varg0 = varg0 + varg0 / varg0 >> 1;
        }
        return varg0;
    } else {
        return 1 + varg0 >> 1;
    }
}

function 0x44a7(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    v0 = 0x450c((varg1 * varg2 / 10 ** 18 << 2) * 10 ** 18, varg0);
    v1 = 0x446c((v0 + 10 ** 18) * 10 ** 18);
    v2 = 0x450c((v1 + 0xfffffffffffffffffffffffffffffffffffffffffffffffff21f494c589c0000) * 10 ** 18, varg1 << 1);
    return (10 ** 18 + v2) * varg0 / 10 ** 18;
}

function 0x450c(uint256 varg0, uint256 varg1) private { 
    v0 = _SafeDiv(varg0, varg1);
    if (v0 * varg1 == varg0) {
        return v0;
    } else {
        return 1 + v0;
    }
}

function 0xfbb7cd06(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = this;
    v2 = v3 = 0xba12222222228d8ba445958a75a0704d566bf2c8;
    v4 = v5 = msg.data.length - 32;
    if (varg0 >> 248 & 0x40) {
        v4 = v6 = msg.data.length - 52;
        v2 = v7 = msg.data[v6] >> 96;
    }
    if (0x80 & varg0 >> 248) {
        v0 = v8 = msg.data[v4 - 20] >> 96;
    }
    if (bool(varg2 >> 96)) {
        0x366b(varg2 >> 96, v2, msg.data[v5]);
    }
    v9 = new uint256[](varg1);
    MEM[v9.data] = 0;
    v10 = v2.swap(v9, this, 0, v0, 0, 0, block.timestamp, v11, v11, varg2 >> 96, varg3 >> 96, msg.data[v5], 192, 0).value(!(varg2 >> 96) * msg.data[v5]).gas(msg.gas);
    if (!v10) {
        v12 = RETURNDATASIZE();
        revert(v11, v11, v11, v11, v11, v11, v11, v11, v11, varg2 >> 96, varg3 >> 96);
    } else {
        return MEM[0];
    }
}

function swapCallback(int256 amount0Delta, int256 amount1Delta, bytes _data) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    if (amount1Delta <= amount0Delta) {
    }
    v0 = msg.data[36 + _data].transfer(msg.sender, v1).gas(msg.gas);
    if (v0) {
        if (!RETURNDATASIZE()) {
            v0 = v2 = bool((msg.data[36 + _data]).code.size);
        } else {
            v0 = v3 = (RETURNDATASIZE() > 31) & (MEM[0] == 1);
        }
    }
    require(v0, SafeTransferFailed());
}

function 0xf65ca39c(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    if (!(varg0 >> 96)) {
        v0 = v1 = this.balance;
    } else {
        v2 = (varg0 >> 96).balanceOf(this).gas(msg.gas);
        require(v2, MEM[64], RETURNDATASIZE());
        require(!(RETURNDATASIZE() - 32));
        v0 = v3 = MEM[0];
    }
    v4, v5 = v6 = 0x383f();
    if (!v4) {
        if (!(varg0 >> 96)) {
            v7 = v8 = this.balance;
        } else {
            v9 = (varg0 >> 96).balanceOf(this).gas(msg.gas);
            require(v9, MEM[64], RETURNDATASIZE());
            require(!(RETURNDATASIZE() - 32));
            v7 = v10 = MEM[0];
        }
        v5 = v11 = _SafeSub(v7, v0);
    }
    return v5;
}

function 0xf3e98cb3(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0, v1 = v2 = 0x383f();
    if (!v0) {
        if (!(varg0 >> 96)) {
            v1 = v3 = this.balance;
        } else {
            v4 = (varg0 >> 96).balanceOf(this).gas(msg.gas);
            require(v4, MEM[64], RETURNDATASIZE());
            require(!(RETURNDATASIZE() - 32));
            v1 = v5 = MEM[0];
        }
    }
    return v1;
}

function 0xf2fa6b66(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    if (varg3 > varg1) {
        if (varg3 - varg1 > varg2 >> 128) {
            if (varg3 - varg1 > varg2 >> 128) {
                0x3cf6(varg0 >> 96, 0xb01f8f528702d411d24c9bb8cc0e2fff779ec013, varg3 - varg1);
                v0 = v1 = varg3 - (varg3 - varg1);
            }
        }
    }
    return v0;
}

function 0xef35c31f(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0, v1 = 0x383f();
    if (!(varg0 >> 96)) {
        v2 = v3 = this.balance;
    } else {
        v4 = (varg0 >> 96).balanceOf(this).gas(msg.gas);
        require(v4, MEM[64], RETURNDATASIZE());
        require(!(RETURNDATASIZE() - 32));
        v2 = v5 = MEM[0];
    }
    return v2;
}

function 0xee777b01(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    require(!(msg.sender - this), OnlyThis());
    v0 = _SafeMul(varg3, varg2 >> 240);
    if (varg0 >> 96) {
        0x3707(varg0 >> 96, varg1 >> 96, v0 / 0x186a0);
    } else {
        v1, /* uint256 */ v2 = (varg1 >> 96).call().value(v0 / 0x186a0).gas(msg.gas);
        if (RETURNDATASIZE()) {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v3 = v4 = new bytes[](RETURNDATASIZE());
            require(!((v4 + ((RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v4 + ((RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v4)), Panic(65)); // failed memory allocation (too much memory)
            v2 = v4.data;
            RETURNDATACOPY(v2, 0, RETURNDATASIZE());
        }
        require(v1, ETHTransferFailed());
    }
    return varg3 - v0 / 0x186a0;
}

function swapUniV3(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = 45;
    v2 = v3 = 0;
    if ((byte(varg0, 0x0)) & 0x80) {
        v2 = v4 = varg3 >> 96;
        v0 = v5 = 65;
    }
    if (!v2) {
        v2 = v6 = this;
    }
    if (!((byte(varg0, 0x0)) & 0x40)) {
        v7 = v8 = 0xfffd8963efd1fc6a506488495d951d5263988d25;
        if ((byte(varg0, 0x0)) & 0x1) {
            v7 = v9 = 0x1000276a4;
        }
    } else {
        v7 = v10 = msg.data[v0] >> 96;
        v0 = v11 = v0 + 20;
    }
    if (0 == (byte(varg0, 0x0)) & 0x20) {
        if ((byte(varg0, 0x0)) & 0x10) {
        }
    }
    MEM[MEM[64] + ((byte(varg0, 0x0)) & 0x20) + 36] = (byte(varg0, 0x0)) & 0x1;
    MEM[MEM[64] + (68 - ((byte(varg0, 0x0)) & 0x20))] = msg.data[v0];
    if (0 == (byte(varg0, 0x0)) & 0x10) {
        v12 = new uint256[](varg2 >> 96);
        MEM[v12.data] = varg2 >> 96;
        v13 = v14 = 0;
    } else {
        v15 = new uint256[](varg2 >> 96);
        v13 = v16 = 0;
    }
    v17 = (varg1 >> 96).swap(0x1f18b37100000000000000000000000000000000000000000000000000000000, 0x128acb0800000000000000000000000000000000000000000000000000000000, v2, v18, v18, 32, 32, v15, v12).value(v13).gas(msg.gas);
    require(v17, MEM[64], RETURNDATASIZE());
    return 0 - MEM[(byte(varg0, 0x0)) << 5 & 0x20];
}

function curveSwapCallback(address varg0, address varg1, address varg2, uint256 varg3) public nonPayable { 
    require(msg.data.length - 4 >= 160);
    0x3707(varg2, msg.sender, varg3);
}

function 0xe2e1d3c6(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0 = (varg0 >> 96).ocean().gas(msg.gas);
    require(v0, MEM[64], RETURNDATASIZE());
    0x366b(varg1 >> 96, address(MEM[0x0]), varg4);
    v1 = new uint256[](3);
    MEM[v1.data] = varg1 >> 96;
    MEM[MEM[64] + 132] = 0;
    v2 = new uint256[](2);
    MEM[v2.data] = keccak256(varg1 >> 96, 0);
    MEM[MEM[64] + 644] = keccak256(varg2 >> 96, 0);
    v3, /* uint256 */ v4, /* uint256 */ v1, /* uint256 */ v2 = MEM[0x0].doMultipleInteractions(v1, v2, v5, v5, v5, 0, 10 ** (varg3 >> 248) * varg4, 0, 0x700000000000000000000000000000000000000000000000000000000000000 | varg0 >> 96, keccak256(varg1 >> 96, 0), keccak256(varg2 >> 96, 0), uint256.max, 0, 0x100000000000000000000000000000000000000000000000000000000000000 | varg2 >> 96, 0, 0, uint256.max, 0).gas(msg.gas);
    if (!v3) {
        v6 = RETURNDATASIZE();
        revert(v5, v5, v5, v5, v5, v5, v5, v5, v5, keccak256(varg1 >> 96, 0), keccak256(varg2 >> 96, 0));
    } else {
        exit;
    }
}

function callBytes(bytes callerCallData) public payable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = callerCallData >> 16;
    v2 = v3 = msg.data[msg.data.length - 32];
    v4 = v5 = 0;
    while (1) {
        if (v0) {
            v4 = v6 = uint24(v0);
            v2 = v7 = 0;
            v8 = v9 = 0;
            CALLDATACOPY(MEM[64], 34 + v4, v6 - v4);
            v10 = v11 = MEM[64] + (v6 - v4);
            v12 = v13 = MEM[64] + 2;
            if (v2 | !(MEM[MEM[64]] >> 240 & 0x8000)) {
                v14 = v15 = this;
                if (MEM[MEM[64]] >> 240 & 0x4000) {
                    v14 = v16 = MEM[v13] >> 96;
                    v12 = v17 = MEM[64] + 22;
                }
                v18 = v19 = 0;
                if (MEM[MEM[64]] >> 240 & 0x2000) {
                    v18 = v20 = MEM[v12] >> 128;
                    v12 = v21 = v12 + 16;
                }
                if (MEM[MEM[64]] >> 240 & 0x1800) {
                    v12 = v22 = v12 + 20;
                    if (MEM[MEM[64]] >> 240 & 0x400) {
                        v14 = v23 = MEM[v22] >> 96;
                        v12 = v24 = v12 + 40;
                    }
                    if (!(MEM[MEM[64]] >> 240 & 0x1000)) {
                        MEM[v11] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
                        MEM[v11 + 4] = v14;
                        MEM[v11 + 36] = v2;
                        v25 = (MEM[v12] >> 96).call(MEM[v3ecdV0xcd4:v3ecdV0xcd4 + 68], MEM[0:32]).gas(msg.gas);
                        require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v25, TransferFailed());
                    } else {
                        MEM[v11] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                        MEM[v11 + 4] = v14;
                        MEM[v11 + 36] = v2;
                        v26 = (MEM[v12] >> 96).call(MEM[v3ecdV0xcd4:v3ecdV0xcd4 + 68], MEM[0:32]).gas(msg.gas);
                        if (!((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v26)) {
                            MEM[v11 + 36] = 0;
                            v27 = (MEM[v12] >> 96).call(MEM[v3ecdV0xcd4:v3ecdV0xcd4 + 68], MEM[0:32]).gas(msg.gas);
                            require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v27, ApproveFailed());
                            MEM[v11 + 36] = v2;
                            v28 = (MEM[v12] >> 96).call(MEM[v3ecdV0xcd4:v3ecdV0xcd4 + 68], MEM[0:32]).gas(msg.gas);
                            require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v28, ApproveFailed());
                        }
                    }
                }
                v29 = v30 = 0;
                if (MEM[MEM[64]] >> 240 & 0x200) {
                    v29 = v31 = MEM[v12];
                    v12 = v32 = v12 + 32;
                }
                if (0 != MEM[MEM[64]] >> 247 & 0x3) {
                    if (1 == MEM[MEM[64]] >> 247 & 0x3) {
                        MEM[v11] = v2;
                        v10 = v33 = 32 + v11;
                    } else {
                        v12 = v34 = v12 + (MEM[MEM[64]] >> 247 & 0x3);
                        if (v34 + (MEM[v12] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18)) + 32 > v11) {
                            MEM[v34] = 0xc700990000000000000000000000000000000000000000000000000000000000;
                            revert(v34, 4);
                        } else {
                            MEM[v34 + (MEM[v12] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18))] = v2;
                        }
                    }
                }
                if (MEM[MEM[64]] >> 240 & 0x40) {
                    v18 = v35 = v18 + v2;
                }
                if (v12 > v10) {
                    MEM[v12] = 0x31560a0e00000000000000000000000000000000000000000000000000000000;
                    revert(v12, 4);
                } else {
                    v36 = this.balance;
                    if (v18 > v36) {
                        MEM[v12] = 0xf4d678b800000000000000000000000000000000000000000000000000000000;
                        revert(v12, 4);
                    } else {
                        v37 = v14.call(MEM[v4003_0x2V0xcd4:v4003_0x2V0xcd4 + v3f72_0x0V0xcd4 - v4003_0x2V0xcd4], MEM[v4003_0x2V0xcd4:v4003_0x2V0xcd4 + uint8.max + 1]).value(v18).gas(msg.gas);
                        if (!v37) {
                            if (0x20 & MEM[MEM[64]] >> 240) {
                                RETURNDATACOPY(v12, 0, RETURNDATASIZE());
                                revert(v12, RETURNDATASIZE());
                            }
                        } else if (1 == v37) {
                            if (0 != RETURNDATASIZE() * !(MEM[MEM[64]] >> 240 & 0x1)) {
                                if ((0xe0 & MEM[MEM[64]] >> 236) + 32 > RETURNDATASIZE()) {
                                    MEM[v12] = 0x310a48700000000000000000000000000000000000000000000000000000000;
                                    revert(v12, 4);
                                } else {
                                    v2 = MEM[v12 + (0xe0 & MEM[MEM[64]] >> 236)];
                                    v8 = 1;
                                    if (MEM[MEM[64]] >> 240 & 0x10) {
                                        v2 = v38 = 0 - v2;
                                    }
                                }
                            }
                        }
                        if (MEM[MEM[64]] >> 240 & 0x200) {
                            if (!v8) {
                                MEM[v12] = 0x2dd205a100000000000000000000000000000000000000000000000000000000;
                                revert(v12, 4);
                            } else if (v2 < v29) {
                                MEM[v12] = 0x9a44647500000000000000000000000000000000000000000000000000000000;
                                MEM[v12 + 4] = v2;
                                revert(v12, 36);
                            }
                        }
                    }
                }
            }
            v0 = v0 >> 24;
            continue;
        } else {
            exit;
        }
    }
}

function tokenBalanceOf(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = varg1 >> 96;
    if (!v1) {
        v0 = v2 = this;
    }
    v3 = (varg0 >> 96).balanceOf(v0).gas(msg.gas);
    require(!((RETURNDATASIZE() <= 31) | !v3));
    v4 = v5 = MEM[0];
    if (this == v0) {
        if (v5) {
            v4 = uint256.max + v5;
        }
        return v4;
    } else {
        return v5;
    }
}

function 0xcd211e1e(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    if (varg5 > varg1) {
        if (varg5 - varg1 > varg2 >> 128) {
            if (!address(varg4 >> 96)) {
                v0 = v1 = 0;
            } else {
                v0 = v2 = _SafeDiv((varg5 - varg1) * (byte(varg3, 0x0)), byte(varg3, 0x1));
            }
            if (varg5 - varg1 - v0 > varg2 >> 128) {
                0x3cf6(varg0 >> 96, 0xb01f8f528702d411d24c9bb8cc0e2fff779ec013, varg5 - varg1 - v0);
                v3 = v4 = varg5 - (varg5 - varg1 - v0);
            }
            if (v0 > varg2 >> 128) {
                0x3cf6(varg0 >> 96, varg4 >> 96, v0);
                v3 = v5 = v3 - v0;
            }
        }
    }
    return v3;
}

function 0xc9e75c48(uint256 varg0, uint256 varg1) public payable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = 0;
    v2 = v3 = varg0 >> 96;
    v4 = v5 = varg1 >> 16;
    v6 = v7 = msg.data[msg.data.length - 32];
    while (v2) {
        if (uint16(v2) + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0001) {
            v0 = v0 + uint16(v2);
        }
        v2 = v2 >> 16;
    }
    v8 = v9 = 0;
    while (v4) {
        v8 = v10 = uint24(v4);
        if (uint16(v2) == uint16.max) {
            v0 = v11 = 0;
            v12 = v13 = 0;
            CALLDATACOPY(MEM[64], 54 + v8, v10 - v8);
            v14 = v15 = MEM[64] + (v10 - v8);
            v16 = v17 = MEM[64] + 2;
            if (v18 | !(MEM[MEM[64]] >> 240 & 0x8000)) {
                v19 = v20 = this;
                if (MEM[MEM[64]] >> 240 & 0x4000) {
                    v19 = v21 = MEM[v17] >> 96;
                    v16 = v22 = MEM[64] + 22;
                }
                v23 = v24 = 0;
                if (MEM[MEM[64]] >> 240 & 0x2000) {
                    v23 = v25 = MEM[v16] >> 128;
                    v16 = v26 = v16 + 16;
                }
                if (MEM[MEM[64]] >> 240 & 0x1800) {
                    v16 = v27 = v16 + 20;
                    if (MEM[MEM[64]] >> 240 & 0x400) {
                        v19 = v28 = MEM[v27] >> 96;
                        v16 = v29 = v16 + 40;
                    }
                    if (!(MEM[MEM[64]] >> 240 & 0x1000)) {
                        MEM[v15] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
                        MEM[v15 + 4] = v19;
                        MEM[v15 + 36] = v18;
                        v30 = (MEM[v16] >> 96).call(MEM[v3ecdV0xf91:v3ecdV0xf91 + 68], MEM[0:32]).gas(msg.gas);
                        require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v30, TransferFailed());
                    } else {
                        MEM[v15] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                        MEM[v15 + 4] = v19;
                        MEM[v15 + 36] = v18;
                        v31 = (MEM[v16] >> 96).call(MEM[v3ecdV0xf91:v3ecdV0xf91 + 68], MEM[0:32]).gas(msg.gas);
                        if (!((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v31)) {
                            MEM[v15 + 36] = 0;
                            v32 = (MEM[v16] >> 96).call(MEM[v3ecdV0xf91:v3ecdV0xf91 + 68], MEM[0:32]).gas(msg.gas);
                            require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v32, ApproveFailed());
                            MEM[v15 + 36] = v18;
                            v33 = (MEM[v16] >> 96).call(MEM[v3ecdV0xf91:v3ecdV0xf91 + 68], MEM[0:32]).gas(msg.gas);
                            require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v33, ApproveFailed());
                        }
                    }
                }
                v34 = v35 = 0;
                if (MEM[MEM[64]] >> 240 & 0x200) {
                    v34 = v36 = MEM[v16];
                    v16 = v37 = v16 + 32;
                }
                if (0 != MEM[MEM[64]] >> 247 & 0x3) {
                    if (1 == MEM[MEM[64]] >> 247 & 0x3) {
                        MEM[v15] = v18;
                        v14 = v38 = 32 + v15;
                    } else {
                        v16 = v39 = v16 + (MEM[MEM[64]] >> 247 & 0x3);
                        if (v39 + (MEM[v16] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18)) + 32 > v15) {
                            MEM[v39] = 0xc700990000000000000000000000000000000000000000000000000000000000;
                            revert(v39, 4);
                        } else {
                            MEM[v39 + (MEM[v16] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18))] = v18;
                        }
                    }
                }
                if (MEM[MEM[64]] >> 240 & 0x40) {
                    v23 = v40 = v23 + v18;
                }
                if (v16 > v14) {
                    MEM[v16] = 0x31560a0e00000000000000000000000000000000000000000000000000000000;
                    revert(v16, 4);
                } else {
                    v41 = this.balance;
                    if (v23 > v41) {
                        MEM[v16] = 0xf4d678b800000000000000000000000000000000000000000000000000000000;
                        revert(v16, 4);
                    } else {
                        v42 = v19.call(MEM[v4003_0x2V0xf91:v4003_0x2V0xf91 + v3f72_0x0V0xf91 - v4003_0x2V0xf91], MEM[v4003_0x2V0xf91:v4003_0x2V0xf91 + uint8.max + 1]).value(v23).gas(msg.gas);
                        if (!v42) {
                            if (0x20 & MEM[MEM[64]] >> 240) {
                                RETURNDATACOPY(v16, 0, RETURNDATASIZE());
                                revert(v16, RETURNDATASIZE());
                            }
                        } else if (1 == v42) {
                            if (0 != RETURNDATASIZE() * !(MEM[MEM[64]] >> 240 & 0x1)) {
                                if ((0xe0 & MEM[MEM[64]] >> 236) + 32 > RETURNDATASIZE()) {
                                    MEM[v16] = 0x310a48700000000000000000000000000000000000000000000000000000000;
                                    revert(v16, 4);
                                } else {
                                    v0 = MEM[v16 + (0xe0 & MEM[MEM[64]] >> 236)];
                                    v12 = 1;
                                    if (MEM[MEM[64]] >> 240 & 0x10) {
                                        v0 = v43 = 0 - v0;
                                    }
                                }
                            }
                        }
                        if (MEM[MEM[64]] >> 240 & 0x200) {
                            if (!v12) {
                                MEM[v16] = 0x2dd205a100000000000000000000000000000000000000000000000000000000;
                                revert(v16, 4);
                            } else if (v0 < v34) {
                                MEM[v16] = 0x9a44647500000000000000000000000000000000000000000000000000000000;
                                MEM[v16 + 4] = v0;
                                revert(v16, 36);
                            }
                        }
                    }
                }
            }
        } else if (!uint16(v2)) {
            require(v2);
            v6 = v44 = 0;
            v45 = v46 = 0;
            CALLDATACOPY(MEM[64], 54 + v8, v10 - v8);
            v47 = v48 = MEM[64] + (v10 - v8);
            v49 = v50 = MEM[64] + 2;
            if (v51 | !(MEM[MEM[64]] >> 240 & 0x8000)) {
                v52 = v53 = this;
                if (MEM[MEM[64]] >> 240 & 0x4000) {
                    v52 = v54 = MEM[v50] >> 96;
                    v49 = v55 = MEM[64] + 22;
                }
                v56 = v57 = 0;
                if (MEM[MEM[64]] >> 240 & 0x2000) {
                    v56 = v58 = MEM[v49] >> 128;
                    v49 = v59 = v49 + 16;
                }
                if (MEM[MEM[64]] >> 240 & 0x1800) {
                    v49 = v60 = v49 + 20;
                    if (MEM[MEM[64]] >> 240 & 0x400) {
                        v52 = v61 = MEM[v60] >> 96;
                        v49 = v62 = v49 + 40;
                    }
                    if (!(MEM[MEM[64]] >> 240 & 0x1000)) {
                        MEM[v48] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
                        MEM[v48 + 4] = v52;
                        MEM[v48 + 36] = v51;
                        v63 = (MEM[v49] >> 96).call(MEM[v3ecdV0xf7a:v3ecdV0xf7a + 68], MEM[0:32]).gas(msg.gas);
                        require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v63, TransferFailed());
                    } else {
                        MEM[v48] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                        MEM[v48 + 4] = v52;
                        MEM[v48 + 36] = v51;
                        v64 = (MEM[v49] >> 96).call(MEM[v3ecdV0xf7a:v3ecdV0xf7a + 68], MEM[0:32]).gas(msg.gas);
                        if (!((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v64)) {
                            MEM[v48 + 36] = 0;
                            v65 = (MEM[v49] >> 96).call(MEM[v3ecdV0xf7a:v3ecdV0xf7a + 68], MEM[0:32]).gas(msg.gas);
                            require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v65, ApproveFailed());
                            MEM[v48 + 36] = v51;
                            v66 = (MEM[v49] >> 96).call(MEM[v3ecdV0xf7a:v3ecdV0xf7a + 68], MEM[0:32]).gas(msg.gas);
                            require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v66, ApproveFailed());
                        }
                    }
                }
                v67 = v68 = 0;
                if (MEM[MEM[64]] >> 240 & 0x200) {
                    v67 = v69 = MEM[v49];
                    v49 = v70 = v49 + 32;
                }
                if (0 != MEM[MEM[64]] >> 247 & 0x3) {
                    if (1 == MEM[MEM[64]] >> 247 & 0x3) {
                        MEM[v48] = v51;
                        v47 = v71 = 32 + v48;
                    } else {
                        v49 = v72 = v49 + (MEM[MEM[64]] >> 247 & 0x3);
                        if (v72 + (MEM[v49] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18)) + 32 > v48) {
                            MEM[v72] = 0xc700990000000000000000000000000000000000000000000000000000000000;
                            revert(v72, 4);
                        } else {
                            MEM[v72 + (MEM[v49] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18))] = v51;
                        }
                    }
                }
                if (MEM[MEM[64]] >> 240 & 0x40) {
                    v56 = v73 = v56 + v51;
                }
                if (v49 > v47) {
                    MEM[v49] = 0x31560a0e00000000000000000000000000000000000000000000000000000000;
                    revert(v49, 4);
                } else {
                    v74 = this.balance;
                    if (v56 > v74) {
                        MEM[v49] = 0xf4d678b800000000000000000000000000000000000000000000000000000000;
                        revert(v49, 4);
                    } else {
                        v75 = v52.call(MEM[v4003_0x2V0xf7a:v4003_0x2V0xf7a + v3f72_0x0V0xf7a - v4003_0x2V0xf7a], MEM[v4003_0x2V0xf7a:v4003_0x2V0xf7a + uint8.max + 1]).value(v56).gas(msg.gas);
                        if (!v75) {
                            if (0x20 & MEM[MEM[64]] >> 240) {
                                RETURNDATACOPY(v49, 0, RETURNDATASIZE());
                                revert(v49, RETURNDATASIZE());
                            }
                        } else if (1 == v75) {
                            if (0 != RETURNDATASIZE() * !(MEM[MEM[64]] >> 240 & 0x1)) {
                                if ((0xe0 & MEM[MEM[64]] >> 236) + 32 > RETURNDATASIZE()) {
                                    MEM[v49] = 0x310a48700000000000000000000000000000000000000000000000000000000;
                                    revert(v49, 4);
                                } else {
                                    v6 = MEM[v49 + (0xe0 & MEM[MEM[64]] >> 236)];
                                    v45 = 1;
                                    if (MEM[MEM[64]] >> 240 & 0x10) {
                                        v6 = v76 = 0 - v6;
                                    }
                                }
                            }
                        }
                        if (MEM[MEM[64]] >> 240 & 0x200) {
                            if (!v45) {
                                MEM[v49] = 0x2dd205a100000000000000000000000000000000000000000000000000000000;
                                revert(v49, 4);
                            } else if (v6 < v67) {
                                MEM[v49] = 0x9a44647500000000000000000000000000000000000000000000000000000000;
                                MEM[v49 + 4] = v6;
                                revert(v49, 36);
                            }
                        }
                    }
                }
            }
        } else {
            v77 = v78 = _SafeDiv(v6 * uint16(v2), v0);
            v0 = v0 - uint16(v2);
            v77 = v79 = 0;
            v80 = v81 = 0;
            CALLDATACOPY(MEM[64], 54 + v8, v10 - v8);
            v82 = v83 = MEM[64] + (v10 - v8);
            v84 = v85 = MEM[64] + 2;
            if (v78 | !(MEM[MEM[64]] >> 240 & 0x8000)) {
                v86 = v87 = this;
                if (MEM[MEM[64]] >> 240 & 0x4000) {
                    v86 = v88 = MEM[v85] >> 96;
                    v84 = v89 = MEM[64] + 22;
                }
                v90 = v91 = 0;
                if (MEM[MEM[64]] >> 240 & 0x2000) {
                    v90 = v92 = MEM[v84] >> 128;
                    v84 = v93 = v84 + 16;
                }
                if (MEM[MEM[64]] >> 240 & 0x1800) {
                    v84 = v94 = v84 + 20;
                    if (MEM[MEM[64]] >> 240 & 0x400) {
                        v86 = v95 = MEM[v94] >> 96;
                        v84 = v96 = v84 + 40;
                    }
                    if (!(MEM[MEM[64]] >> 240 & 0x1000)) {
                        MEM[v83] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
                        MEM[v83 + 4] = v86;
                        MEM[v83 + 36] = v78;
                        v97 = (MEM[v84] >> 96).call(MEM[v3ecdV0x15278:v3ecdV0x15278 + 68], MEM[0:32]).gas(msg.gas);
                        require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v97, TransferFailed());
                    } else {
                        MEM[v83] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                        MEM[v83 + 4] = v86;
                        MEM[v83 + 36] = v78;
                        v98 = (MEM[v84] >> 96).call(MEM[v3ecdV0x15278:v3ecdV0x15278 + 68], MEM[0:32]).gas(msg.gas);
                        if (!((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v98)) {
                            MEM[v83 + 36] = 0;
                            v99 = (MEM[v84] >> 96).call(MEM[v3ecdV0x15278:v3ecdV0x15278 + 68], MEM[0:32]).gas(msg.gas);
                            require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v99, ApproveFailed());
                            MEM[v83 + 36] = v78;
                            v100 = (MEM[v84] >> 96).call(MEM[v3ecdV0x15278:v3ecdV0x15278 + 68], MEM[0:32]).gas(msg.gas);
                            require((!RETURNDATASIZE() | (RETURNDATASIZE() > 31) & (MEM[0] == 1)) & v100, ApproveFailed());
                        }
                    }
                }
                v101 = v102 = 0;
                if (MEM[MEM[64]] >> 240 & 0x200) {
                    v101 = v103 = MEM[v84];
                    v84 = v104 = v84 + 32;
                }
                if (0 != MEM[MEM[64]] >> 247 & 0x3) {
                    if (1 == MEM[MEM[64]] >> 247 & 0x3) {
                        MEM[v83] = v78;
                        v82 = v105 = 32 + v83;
                    } else {
                        v84 = v106 = v84 + (MEM[MEM[64]] >> 247 & 0x3);
                        if (v106 + (MEM[v84] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18)) + 32 > v83) {
                            MEM[v106] = 0xc700990000000000000000000000000000000000000000000000000000000000;
                            revert(v106, 4);
                        } else {
                            MEM[v106 + (MEM[v84] >> uint8.max + 1 - (MEM[MEM[64]] >> 244 & 0x18))] = v78;
                        }
                    }
                }
                if (MEM[MEM[64]] >> 240 & 0x40) {
                    v90 = v107 = v90 + v78;
                }
                if (v84 > v82) {
                    MEM[v84] = 0x31560a0e00000000000000000000000000000000000000000000000000000000;
                    revert(v84, 4);
                } else {
                    v108 = this.balance;
                    if (v90 > v108) {
                        MEM[v84] = 0xf4d678b800000000000000000000000000000000000000000000000000000000;
                        revert(v84, 4);
                    } else {
                        v109 = v86.call(MEM[v4003_0x2V0x15278:v4003_0x2V0x15278 + v3f72_0x0V0x15278 - v4003_0x2V0x15278], MEM[v4003_0x2V0x15278:v4003_0x2V0x15278 + uint8.max + 1]).value(v90).gas(msg.gas);
                        if (!v109) {
                            if (0x20 & MEM[MEM[64]] >> 240) {
                                RETURNDATACOPY(v84, 0, RETURNDATASIZE());
                                revert(v84, RETURNDATASIZE());
                            }
                        } else if (1 == v109) {
                            if (0 != RETURNDATASIZE() * !(MEM[MEM[64]] >> 240 & 0x1)) {
                                if ((0xe0 & MEM[MEM[64]] >> 236) + 32 > RETURNDATASIZE()) {
                                    MEM[v84] = 0x310a48700000000000000000000000000000000000000000000000000000000;
                                    revert(v84, 4);
                                } else {
                                    v77 = MEM[v84 + (0xe0 & MEM[MEM[64]] >> 236)];
                                    v80 = 1;
                                    if (MEM[MEM[64]] >> 240 & 0x10) {
                                        v77 = v110 = 0 - v77;
                                    }
                                }
                            }
                        }
                        if (MEM[MEM[64]] >> 240 & 0x200) {
                            if (!v80) {
                                MEM[v84] = 0x2dd205a100000000000000000000000000000000000000000000000000000000;
                                revert(v84, 4);
                            } else if (v77 < v101) {
                                MEM[v84] = 0x9a44647500000000000000000000000000000000000000000000000000000000;
                                MEM[v84 + 4] = v77;
                                revert(v84, 36);
                            }
                        }
                    }
                }
            }
            v111 = v112 = bool(v77);
            if (!v77) {
                v111 = v113 = 0;
            }
            if (v111) {
                v0 = _SafeAdd(v0, v77);
                v6 = v6 - v78;
            }
        }
        v4 = v4 >> 24;
        v2 = v2 >> 16;
    }
    require(!v2);
    return v0;
}

function 0xc028b46d(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = 0;
    v2 = v3 = 25;
    if ((byte(varg0, 0x0)) & 0x2) {
        v2 = v4 = 57;
    }
    if (0x4 & (byte(varg0, 0x0))) {
        v2 = v5 = v2 + 20;
        v0 = v6 = msg.data[v2] >> 96;
    }
    if (!v0) {
        v0 = v7 = this;
    }
    v8, v9, v9, v10, v11, v11, v10, /* uint256 */ v12 = (varg1 >> 96).getTradeInfo().gas(msg.gas);
    require(v8, MEM[64], RETURNDATASIZE());
    if (1 != (byte(varg0, 0x0)) & 0x1) {
    }
    v13 = msg.data[v2] * (10 ** 18 - v12) / 10 ** 18 * v11 / (v10 + msg.data[v2] * (10 ** 18 - v12) / 10 ** 18);
    if (1 != (byte(varg0, 0x0)) & 0x1) {
    }
    v14, /* uint256 */ v15 = (varg1 >> 96).swap(0, v13, 0, v13, v0, 128, 0).gas(msg.gas);
    require(v14, MEM[64], RETURNDATASIZE());
    require(v13 >= v0, ReturnAmountIsNotEnough(v13, v0));
    return v13;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        v0 = function_selector >> 224;
        if (0x7e5c0d2 == v0) {
            0x07e5c0d2();
        } else if (0x10c3405f == v0) {
            0x10c3405f();
        } else if (0x1c6eced5 == v0) {
            tokenApprove();
        } else {
            if (0x20b04554 != v0) {
                if (0x23a69e75 != v0) {
                    if (0x26367361 == v0) {
                        0x26367361();
                    } else if (0x2636f7f8 == v0) {
                        callBytes(address,bytes);
                    } else if (0x26678dcd == v0) {
                        0x26678dcd();
                    } else if (0x2c8958f6 != v0) {
                        if (0x3dd5cfd1 == v0) {
                            0x3dd5cfd1();
                        } else if (0x3e88c8ab == v0) {
                            d3MMSwapCallBack(address,uint256,bytes);
                        } else if (0x454c96c2 == v0) {
                            0x454c96c2();
                        } else if (0x4b02d2f6 == v0) {
                            0x4b02d2f6();
                        } else if (0x4b64e492 == v0) {
                            execute(address);
                        } else if (0x5109d8b6 == v0) {
                            swapSolidly();
                        } else if (0x54fd4d50 == v0) {
                            version();
                        } else if (0x654b6487 != v0) {
                            if (0x6ae40711 == v0) {
                                swapUniV2();
                            } else if (0x6b4be0b9 == v0) {
                                ethBalanceOf();
                            } else if (0x6c4eca27 == v0) {
                                tokenTransfer();
                            } else if (0x6f5ec5ce == v0) {
                                0x6f5ec5ce();
                            } else if (0x7225b0d0 == v0) {
                                0x7225b0d0();
                            } else if (0x744c8c09 == v0) {
                                chargeFee();
                            } else if (0x773e7756 == v0) {
                                0x773e7756();
                            } else if (0x860a32ec == v0) {
                                limited();
                            } else if (0x98aed105 == v0) {
                                0x98aed105();
                            } else if (0xa1dab4eb != v0) {
                                if (0xa87a1ae8 == v0) {
                                    0xa87a1ae8();
                                } else if (0xbd46a343 == v0) {
                                    0xbd46a343();
                                } else if (0xbdb69421 == v0) {
                                    0xbdb69421();
                                } else if (0xc028b46d == v0) {
                                    0xc028b46d();
                                } else if (0xc9e75c48 == v0) {
                                    0xc9e75c48();
                                } else if (0xcd211e1e == v0) {
                                    0xcd211e1e();
                                } else if (0xd6bdbf78 == v0) {
                                    tokenBalanceOf();
                                } else if (0xd9c45357 == v0) {
                                    callBytes(bytes);
                                } else if (0xe2e1d3c6 == v0) {
                                    0xe2e1d3c6();
                                } else if (0xe413f48d == v0) {
                                    curveSwapCallback(address,address,address,uint256,uint256);
                                } else if (0xee63c1e5 == v0) {
                                    swapUniV3();
                                } else if (0xee777b01 == v0) {
                                    0xee777b01();
                                } else if (0xef35c31f == v0) {
                                    0xef35c31f();
                                } else if (0xf2fa6b66 == v0) {
                                    0xf2fa6b66();
                                } else if (0xf3e98cb3 == v0) {
                                    0xf3e98cb3();
                                } else if (0xf65ca39c == v0) {
                                    0xf65ca39c();
                                } else if (0xfa461e33 != v0) {
                                    if (0xfa483e72 != v0) {
                                        if (0xfbb7cd06 == v0) {
                                            0xfbb7cd06();
                                        } else if (!(0xfd53121f - v0)) {
                                            0xfd53121f();
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            swapCallback(int256,int256,bytes);
        }
    }
    require(!msg.data.length);
    receive();
}
