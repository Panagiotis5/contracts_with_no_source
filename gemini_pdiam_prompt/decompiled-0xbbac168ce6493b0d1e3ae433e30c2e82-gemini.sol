// Decompiled by library.dedaub.com
// 2025.12.17 03:48 UTC
// Compiled using the solidity compiler version 0.8.28





function 0x13a(uint256 varg0) private { 
    v0 = v1;
    v4 = 'console.log'.log(v0, uint8(varg0 >> 248), v5, 'Dispatch: ').gas(msg.gas);
    if (0 - bytes1(varg0)) {
        if (uint248.max + 1 - bytes1(varg0)) {
            if (0x200000000000000000000000000000000000000000000000000000000000000 - bytes1(varg0)) {
                MEM[32 + v0.data] = 0x8c379a000000000000000000000000000000000000000000000000000000000;
                MEM[32 + v0.data + 4] = 32;
                revert(Error('Unknown selector'));
            } else {
                0x8b8();
            }
        } else {
            MEM[32 + v0.data] = 0;
            0xe39(32 + v0.data, 10 ** 20, 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
            v6 = v7 = msg.data[32] >> 96;
            v6 = v8 = msg.data[72] >> 96;
            v6 = v9 = 0xebb(v7, msg.data[52] >> 96);
            v10 = (msg.data[52] >> 96).transferFrom(v7, this, v9).gas(msg.gas);
            v11 = _SafeAdd(40, 144);
            if (v11 < msg.data.length) {
                v12 = 0x4133(144);
                v6 = v13 = 0x3f & (byte(msg.data[0x90], 0x0)) >> 2;
                v6 = v14 = (byte(msg.data[0x90], 0x0)) & 0x2;
                v15 = v16 = (byte(msg.data[0x90], 0x0)) & 0x1;
                v17 = v18;
                v21 = 'console.log'.staticcall(0xa7a8785300000000000000000000000000000000000000000000000000000000 | uint224(128), v17, v12, v9, v13, v5, 'SingleSwapInput Start: ').gas(msg.gas);
                v22 = v23 = !uint8(v13);
                if (uint8(v13)) {
                    v22 = 1 == uint8(v13);
                }
                if (!v22) {
                    v24 = v25 = 3 == uint8(v13);
                    if (3 != uint8(v13)) {
                        v24 = 4 == uint8(v13);
                    }
                    if (!v24) {
                        if (5 - uint8(v13)) {
                            if (6 - uint8(v13)) {
                                if (15 - uint8(v13)) {
                                    if (16 - uint8(v13)) {
                                        if (18 - uint8(v13)) {
                                            if (19 - uint8(v13)) {
                                                if (20 - uint8(v13)) {
                                                    if (21 - uint8(v13)) {
                                                        MEM[32 + v17.data] = 0x8c379a000000000000000000000000000000000000000000000000000000000;
                                                        MEM[32 + v17.data + 4] = 32;
                                                        revert(Error('Invalid Dex'));
                                                    } else {
                                                        v26 = _SafeAdd(v12, 20);
                                                        v27 = _SafeAdd(v26, 20);
                                                        v28 = _SafeAdd(1 + (v27 + (uint8.max + 1 - (byte(msg.data[v27], 0x0)) >> 3)), 3);
                                                        CALLDATACOPY(32 + v17.data + 32, v28, uint24(msg.data[1 + (v27 + (uint8.max + 1 - (byte(msg.data[v27], 0x0)) >> 3))] >> 232));
                                                        v29 = _SafeAdd(v28, uint24(msg.data[1 + (v27 + (uint8.max + 1 - (byte(msg.data[v27], 0x0)) >> 3))] >> 232));
                                                        0x927(msg.data[v27 + 1] >> (byte(msg.data[v27], 0x0)), 0x111111125421ca6dc452d289314280a0f8842a65, msg.data[v12] >> 96);
                                                        v30 = v31 = 0;
                                                        while (v30 < uint24(msg.data[1 + (v27 + (uint8.max + 1 - (byte(msg.data[v27], 0x0)) >> 3))] >> 232)) {
                                                            MEM[v30 + (32 + (32 + v17.data + uint24(msg.data[1 + (v27 + (uint8.max + 1 - (byte(msg.data[v27], 0x0)) >> 3))] >> 232)))] = MEM[v30 + (32 + v17.data + 32)];
                                                            v30 += 32;
                                                        }
                                                        MEM[uint24(msg.data[1 + (v27 + (uint8.max + 1 - (byte(msg.data[v27], 0x0)) >> 3))] >> 232) + (32 + (32 + v17.data + uint24(msg.data[1 + (v27 + (uint8.max + 1 - (byte(msg.data[v27], 0x0)) >> 3))] >> 232)))] = 0;
                                                        v32, /* uint256 */ v33, /* uint256 */ v34 = address(0x111111125421ca6dc452d289314280a0f8842a65).call(MEM[32 + 32 + v4178V0x153aV0x827V0x1fe.data + uint24(msg.data[1 + v1f12_0x0V0x827V0x1fe + uint8.max + 1 - 0x0 byte msg.data[v1f12_0x0V0x827V0x1fe] >> 3] >> 232):32 + 32 + v4178V0x153aV0x827V0x1fe.data + uint24(msg.data[1 + v1f12_0x0V0x827V0x1fe + uint8.max + 1 - 0x0 byte msg.data[v1f12_0x0V0x827V0x1fe] >> 3] >> 232) + uint24(msg.data[1 + v1f12_0x0V0x827V0x1fe + uint8.max + 1 - 0x0 byte msg.data[v1f12_0x0V0x827V0x1fe] >> 3] >> 232) + 32 + 32 + v4178V0x153aV0x827V0x1fe.data + uint24(msg.data[1 + v1f12_0x0V0x827V0x1fe + uint8.max + 1 - 0x0 byte msg.data[v1f12_0x0V0x827V0x1fe] >> 3] >> 232) - 32 + 32 + v4178V0x153aV0x827V0x1fe.data + uint24(msg.data[1 + v1f12_0x0V0x827V0x1fe + uint8.max + 1 - 0x0 byte msg.data[v1f12_0x0V0x827V0x1fe] >> 3] >> 232)], MEM[32 + 32 + v4178V0x153aV0x827V0x1fe.data + uint24(msg.data[1 + v1f12_0x0V0x827V0x1fe + uint8.max + 1 - 0x0 byte msg.data[v1f12_0x0V0x827V0x1fe] >> 3] >> 232):32 + 32 + v4178V0x153aV0x827V0x1fe.data + uint24(msg.data[1 + v1f12_0x0V0x827V0x1fe + uint8.max + 1 - 0x0 byte msg.data[v1f12_0x0V0x827V0x1fe] >> 3] >> 232)]).gas(msg.gas);
                                                        if (RETURNDATASIZE() == 0) {
                                                            v35 = v36 = 96;
                                                        } else {
                                                            v35 = v37 = new bytes[](RETURNDATASIZE());
                                                            RETURNDATACOPY(v37.data, 0, RETURNDATASIZE());
                                                        }
                                                        if (v32) {
                                                            v38 = 0xebb(this, msg.data[v26] >> 96);
                                                            v39 = 0xebb(this, msg.data[v12] >> 96);
                                                            if (v39) {
                                                                MEM[4] = 0;
                                                                v40 = (msg.data[v12] >> 96).transfer(0xa487e3c1d7880675f5578e24110ba138c2558c1e, v39).gas(msg.gas);
                                                                require(v40, Error('Failed to transfer remained token'));
                                                            }
                                                        } else {
                                                            require(!MEM[v35], v34, MEM[v35]);
                                                            revert(Error('Failed to swap'));
                                                        }
                                                    }
                                                } else {
                                                    v41 = v42 = 5560;
                                                    v43 = _SafeAdd(v12, 1);
                                                    v44 = _SafeAdd(v43, 20);
                                                    v45 = _SafeAdd(v44, 20);
                                                    v46 = v47 = msg.data[v45 + 1] >> (byte(msg.data[v45], 0x0));
                                                    v48 = _SafeAdd(1 + (v45 + (uint8.max + 1 - (byte(msg.data[v45], 0x0)) >> 3)), 3);
                                                    CALLDATACOPY(32 + v17.data + 32, v48, uint24(msg.data[1 + (v45 + (uint8.max + 1 - (byte(msg.data[v45], 0x0)) >> 3))] >> 232));
                                                    v49 = 32 + (32 + v17.data + uint24(msg.data[1 + (v45 + (uint8.max + 1 - (byte(msg.data[v45], 0x0)) >> 3))] >> 232));
                                                    v50 = _SafeAdd(v48, uint24(msg.data[1 + (v45 + (uint8.max + 1 - (byte(msg.data[v45], 0x0)) >> 3))] >> 232));
                                                    v46 = v51 = 0;
                                                    if (byte(msg.data[v12], 0x0)) {
                                                        v52 = v53 = 0x6000da47483062a0d734ba3dc7576ce6a0b645c4;
                                                    } else {
                                                        v52 = v54 = 0x11f84b9aa48e5f8aa8b9897600006289be;
                                                    }
                                                    if (!address(msg.data[v43] >> 96)) {
                                                        v55 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(v47).gas(msg.gas);
                                                        require(v55, Error('Failed to withdraw WETH'));
                                                    } else {
                                                        0x927(v47, v52, msg.data[v43] >> 96);
                                                    }
                                                    v56 = v57 = 0;
                                                    while (v56 < uint24(msg.data[1 + (v45 + (uint8.max + 1 - (byte(msg.data[v45], 0x0)) >> 3))] >> 232)) {
                                                        MEM[v56 + v49] = MEM[v56 + (32 + v17.data + 32)];
                                                        v56 += 32;
                                                    }
                                                    MEM[uint24(msg.data[1 + (v45 + (uint8.max + 1 - (byte(msg.data[v45], 0x0)) >> 3))] >> 232) + v49] = 0;
                                                    v58, /* uint256 */ v59, /* uint256 */ v60 = address(v52).call(MEM[v3317V0x1eb9V0x827V0x1fe:v3317V0x1eb9V0x827V0x1fe + uint24(msg.data[1 + v1e8a_0x0V0x827V0x1fe + uint8.max + 1 - 0x0 byte msg.data[v1e8a_0x0V0x827V0x1fe] >> 3] >> 232) + v3317V0x1eb9V0x827V0x1fe - v3317V0x1eb9V0x827V0x1fe], MEM[v3317V0x1eb9V0x827V0x1fe:v3317V0x1eb9V0x827V0x1fe]).value(v46).gas(msg.gas);
                                                    if (RETURNDATASIZE() == 0) {
                                                        v61 = v62 = 96;
                                                    } else {
                                                        v61 = v63 = new bytes[](RETURNDATASIZE());
                                                        RETURNDATACOPY(v63.data, 0, RETURNDATASIZE());
                                                    }
                                                    if (v58) {
                                                        v64 = 0xebb(this, msg.data[v44] >> 96);
                                                        v65 = 0xebb(this, msg.data[v43] >> 96);
                                                        if (v65) {
                                                            if (address(msg.data[v43] >> 96)) {
                                                                MEM[4] = 0;
                                                                v66 = (msg.data[v43] >> 96).transfer(0xa487e3c1d7880675f5578e24110ba138c2558c1e, v65).gas(msg.gas);
                                                                require(v66, Error('Failed to transfer remained token'));
                                                            } else {
                                                                v67 = 0xa487e3c1d7880675f5578e24110ba138c2558c1e.call().value(v65).gas(msg.gas);
                                                                require(v67, Error('Failed to transfer reamined ETH'));
                                                            }
                                                        }
                                                    } else {
                                                        require(!MEM[v61], v60, MEM[v61]);
                                                        revert(Error('Failed to swap'));
                                                    }
                                                }
                                            } else {
                                                v15 = v68 = 5560;
                                                v69 = _SafeAdd(v12, 20);
                                                v70 = _SafeAdd(v69, 20);
                                                v71 = _SafeAdd(v70, 20);
                                                v72 = _SafeAdd(v71, 20);
                                                v73 = _SafeAdd(1 + (v72 + (uint8.max + 1 - (byte(msg.data[v72], 0x0)) >> 3)), 3);
                                                CALLDATACOPY(32 + v17.data + 32, v73, uint24(msg.data[1 + (v72 + (uint8.max + 1 - (byte(msg.data[v72], 0x0)) >> 3))] >> 232));
                                                v74 = _SafeAdd(v73, uint24(msg.data[1 + (v72 + (uint8.max + 1 - (byte(msg.data[v72], 0x0)) >> 3))] >> 232));
                                                0x927(msg.data[v72 + 1] >> (byte(msg.data[v72], 0x0)), msg.data[v12] >> 96, msg.data[v70] >> 96);
                                                v75 = v76 = 0;
                                                while (v75 < uint24(msg.data[1 + (v72 + (uint8.max + 1 - (byte(msg.data[v72], 0x0)) >> 3))] >> 232)) {
                                                    MEM[v75 + (32 + (32 + v17.data + uint24(msg.data[1 + (v72 + (uint8.max + 1 - (byte(msg.data[v72], 0x0)) >> 3))] >> 232)))] = MEM[v75 + (32 + v17.data + 32)];
                                                    v75 += 32;
                                                }
                                                MEM[uint24(msg.data[1 + (v72 + (uint8.max + 1 - (byte(msg.data[v72], 0x0)) >> 3))] >> 232) + (32 + (32 + v17.data + uint24(msg.data[1 + (v72 + (uint8.max + 1 - (byte(msg.data[v72], 0x0)) >> 3))] >> 232)))] = 0;
                                                v77, /* uint256 */ v78, /* uint256 */ v79 = address(msg.data[v69] >> 96).call(MEM[32 + 32 + v4178V0x153aV0x827V0x1fe.data + uint24(msg.data[1 + v1df0_0x0V0x827V0x1fe + uint8.max + 1 - 0x0 byte msg.data[v1df0_0x0V0x827V0x1fe] >> 3] >> 232):32 + 32 + v4178V0x153aV0x827V0x1fe.data + uint24(msg.data[1 + v1df0_0x0V0x827V0x1fe + uint8.max + 1 - 0x0 byte msg.data[v1df0_0x0V0x827V0x1fe] >> 3] >> 232) + uint24(msg.data[1 + v1df0_0x0V0x827V0x1fe + uint8.max + 1 - 0x0 byte msg.data[v1df0_0x0V0x827V0x1fe] >> 3] >> 232) + 32 + 32 + v4178V0x153aV0x827V0x1fe.data + uint24(msg.data[1 + v1df0_0x0V0x827V0x1fe + uint8.max + 1 - 0x0 byte msg.data[v1df0_0x0V0x827V0x1fe] >> 3] >> 232) - 32 + 32 + v4178V0x153aV0x827V0x1fe.data + uint24(msg.data[1 + v1df0_0x0V0x827V0x1fe + uint8.max + 1 - 0x0 byte msg.data[v1df0_0x0V0x827V0x1fe] >> 3] >> 232)], MEM[32 + 32 + v4178V0x153aV0x827V0x1fe.data + uint24(msg.data[1 + v1df0_0x0V0x827V0x1fe + uint8.max + 1 - 0x0 byte msg.data[v1df0_0x0V0x827V0x1fe] >> 3] >> 232):32 + 32 + v4178V0x153aV0x827V0x1fe.data + uint24(msg.data[1 + v1df0_0x0V0x827V0x1fe + uint8.max + 1 - 0x0 byte msg.data[v1df0_0x0V0x827V0x1fe] >> 3] >> 232)]).gas(msg.gas);
                                                if (RETURNDATASIZE() == 0) {
                                                    v80 = v81 = 96;
                                                } else {
                                                    v80 = v82 = new bytes[](RETURNDATASIZE());
                                                    RETURNDATACOPY(v82.data, 0, RETURNDATASIZE());
                                                }
                                                if (v77) {
                                                    v83 = 0xebb(this, msg.data[v71] >> 96);
                                                } else {
                                                    require(!MEM[v80], v79, MEM[v80]);
                                                    revert(Error('Failed to swap'));
                                                }
                                            }
                                        } else if (v9 > msg.data[v12 + 1] >> (byte(msg.data[v12], 0x0))) {
                                            v84 = _SafeSub(v9, msg.data[v12 + 1] >> (byte(msg.data[v12], 0x0)));
                                        } else {
                                            MEM[32 + v17.data] = 0x8c379a000000000000000000000000000000000000000000000000000000000;
                                            MEM[32 + v17.data + 4] = 32;
                                            revert(Error('Failed to keep token'));
                                        }
                                    } else {
                                        v41 = v85 = 5560;
                                        v86 = _SafeAdd(v12, 20);
                                        v87 = _SafeAdd(v86, 20);
                                        v88 = _SafeAdd(v87, 20);
                                        if (bool(!((byte(msg.data[0x90], 0x0)) & 0x2))) {
                                            if (!bool(!((byte(msg.data[0x90], 0x0)) & 0x1))) {
                                                v6 = v89 = 0xebb(this, msg.data[v86] >> 96);
                                            }
                                        } else {
                                            v6 = v90 = msg.data[v88 + 1] >> (byte(msg.data[v88], 0x0));
                                        }
                                        v91 = 0x2f98(0, v6, msg.data[v87] >> 96, msg.data[v86] >> 96, msg.data[v12] >> 96);
                                        v92 = v93;
                                        v96 = 'console.log'.staticcall(0xca47c4eb00000000000000000000000000000000000000000000000000000000 | uint224(96), v92, v6, v91, v5, 'Exec Fluid Swap: ').gas(msg.gas);
                                    }
                                    // Unknown jump to Block 0x833B0x1fe. Refer to 3-address code (TAC);
                                } else {
                                    v15 = v97 = 5560;
                                    v98 = v99 = msg.data[v12] >> 96;
                                    v100 = _SafeAdd(v12, 20);
                                    v98 = v101 = msg.data[v100] >> 96;
                                    v102 = _SafeAdd(v100, 20);
                                    v98 = v103 = msg.data[v102];
                                    v104 = _SafeAdd(v102, 32);
                                    v98 = v105 = byte(msg.data[v104], 0x0);
                                    v106 = _SafeAdd(v104, 1);
                                    if (bool(!((byte(msg.data[0x90], 0x0)) & 0x2))) {
                                        if (!bool(!((byte(msg.data[0x90], 0x0)) & 0x1))) {
                                            v107 = v108 = 6995;
                                            if (!v105) {
                                            }
                                        }
                                    } else {
                                        v6 = v109 = msg.data[v106];
                                        v110 = _SafeAdd(v106, 32);
                                    }
                                }
                            } else {
                                v111 = _SafeAdd(v12, 20);
                                v112 = _SafeAdd(v111, 20);
                                v113 = _SafeAdd(v112, 20);
                                v114 = v115 = _SafeAdd(v113, 1);
                                if (bool(!((byte(msg.data[0x90], 0x0)) & 0x2))) {
                                    if (!bool(!((byte(msg.data[0x90], 0x0)) & 0x1))) {
                                        v6 = v116 = 0xebb(this, msg.data[v111] >> 96);
                                    }
                                } else {
                                    v6 = msg.data[v115 + 1] >> (byte(msg.data[v115], 0x0));
                                }
                                v117 = 0x27cd(byte(msg.data[v113], 0x0), 0, v6, msg.data[v112] >> 96, msg.data[v111] >> 96, msg.data[v12] >> 96);
                            }
                            while (1) {
                                // Unknown jump to Block 0x15b8B0x827B0x1fe. Refer to 3-address code (TAC);
                            }
                        } else {
                            v118 = _SafeAdd(v12, 20);
                            v119 = _SafeAdd(v118, 20);
                            v120 = _SafeAdd(v119, 3);
                            v121 = _SafeAdd(v120, 3);
                            if (bool(!((byte(msg.data[0x90], 0x0)) & 0x2))) {
                                if (!bool(!((byte(msg.data[0x90], 0x0)) & 0x1))) {
                                    v6 = v122 = 0xebb(this, msg.data[v12] >> 96);
                                }
                            } else {
                                v6 = v123 = msg.data[v121 + 1] >> (byte(msg.data[v121], 0x0));
                            }
                            if (!bool(address(msg.data[v12] >> 96))) {
                                v124 = 0xebb(this, msg.data[v12] >> 96);
                                if (v124 < uint128(v6)) {
                                    v125 = _SafeSub(uint128(v6), v124);
                                    v126 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(v125).gas(msg.gas);
                                }
                            }
                            v127 = 0xebb(this, msg.data[v12] >> 96);
                            if (v127 >= uint128(v6)) {
                                if (address(msg.data[v12] >> 96)) {
                                    0x39c4(300, uint128(v6), 0x66a9893cc07d91d95644aedd05d03f95e1dba8af, msg.data[v12] >> 96);
                                }
                                v128, v129 = 0x3ac0(msg.data[v120] >> 232, msg.data[v119] >> 232, msg.data[v118] >> 96, msg.data[v12] >> 96);
                                v130 = v131 = 1;
                                v132 = v133 = 97 + v17.data;
                                while (v130) {
                                    MEM[v132] = 96;
                                    v132 += 32;
                                    v130 = v130 - 1;
                                }
                                MEM[32 + v17.data + 97 + 32] = 0x600000000000000000000000000000000000000000000000000000000000000;
                                MEM[32 + v17.data + 97 + 33] = 0xc00000000000000000000000000000000000000000000000000000000000000;
                                MEM[32 + v17.data + 97 + 34] = 0xf00000000000000000000000000000000000000000000000000000000000000;
                                v134 = 3;
                                v135 = 67 + (32 + v17.data + 97);
                                while (v134) {
                                    MEM[v135] = 96;
                                    v135 += 32;
                                    v134 = v134 - 1;
                                }
                                v136 = new struct(5);
                                v136.word0 = v129;
                                v136.word1 = bool(v128);
                                v136.word2 = uint128(v6);
                                v136.word3 = uint128(0);
                                v137 = new struct(1);
                                v137.word0 = 0;
                                v136.word4 = v137;
                                MEM[64 + v137] = 32;
                                MEM[64 + v137 + 32] = address(MEM[v136.word0]);
                                MEM[64 + v137 + 64] = address(MEM[v136.word0 + 32]);
                                MEM[64 + v137 + 96] = uint24(MEM[v136.word0 + 64]);
                                MEM[64 + v137 + 128] = int24(MEM[v136.word0 + 96]);
                                MEM[64 + v137 + 160] = address(MEM[v136.word0 + 128]);
                                MEM[64 + v137 + 192] = bool(v136.word1);
                                MEM[64 + v137 + 224] = uint128(v136.word2);
                                MEM[64 + v137 + (uint8.max + 1)] = uint128(v136.word3);
                                MEM[64 + v137 + 288] = 288;
                                MEM[64 + v137 + 320] = MEM[v136.word4];
                                v138 = v139 = 0;
                                while (v138 < MEM[v136.word4]) {
                                    MEM[v138 + (64 + v137 + 320 + 32)] = MEM[v138 + (v136.word4 + 32)];
                                    v138 += 32;
                                }
                                MEM[MEM[v136.word4] + (64 + v137 + 320 + 32)] = 0;
                                MEM[32 + v137] = 32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320)) - (32 + v137) - 32;
                                require(0 < 3, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                                MEM[32 + (32 + v17.data + 97 + 35)] = 32 + v137;
                                MEM[64 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320))] = address(msg.data[v12] >> 96);
                                MEM[64 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320)) + 32] = uint128(v6);
                                MEM[32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320))] = 64;
                                require(1 < 3, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                                MEM[64 + (32 + v17.data + 97 + 35)] = 32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320));
                                MEM[160 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320))] = address(msg.data[v118] >> 96);
                                MEM[160 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320)) + 32] = uint128(0);
                                MEM[128 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320))] = 64;
                                require(2 < 3, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                                MEM[96 + (32 + v17.data + 97 + 35)] = 128 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320));
                                MEM[256 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320))] = 64;
                                MEM[256 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320)) + 64] = v140;
                                v141 = v142 = 0;
                                while (v141 < v140) {
                                    MEM[v141 + (256 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320)) + 64 + 32)] = MEM[v141 + (32 + v17.data + 97 + 32)];
                                    v141 += 32;
                                }
                                MEM[v140 + (256 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320)) + 64 + 32)] = 0;
                                v143 = 64 + (256 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320)) + 64);
                                MEM[256 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320)) + 32] = 128;
                                MEM[v143] = 3;
                                v144 = v145 = v143 + 32;
                                v146 = v147 = v143 + 96 + 32;
                                v148 = v149 = 32 + v17.data + 97 + 35 + 32;
                                v150 = v151 = 0;
                                while (v150 < 3) {
                                    MEM[v144] = v146 - v143 - 32;
                                    MEM[v146] = MEM[MEM[v148]];
                                    v152 = v153 = 0;
                                    while (v152 < MEM[MEM[v148]]) {
                                        MEM[v152 + (v146 + 32)] = MEM[v152 + (MEM[v148] + 32)];
                                        v152 += 32;
                                    }
                                    MEM[MEM[MEM[v148]] + (v146 + 32)] = 0;
                                    v146 = 32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[MEM[v148]]) + v146);
                                    v144 += 32;
                                    v148 += 32;
                                    v150 += 1;
                                }
                                MEM[224 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320))] = v146 - (224 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320))) - 32;
                                require(0 < 1, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                                MEM[32 + (32 + v17.data + 33)] = 224 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v136.word4]) + (64 + v137 + 320));
                                v154 = 0xebb(this, msg.data[v118] >> 96);
                                if (bool(address(msg.data[v12] >> 96))) {
                                    v155 = new uint256[](1);
                                    v156 = v157 = 0;
                                    while (v156 < 1) {
                                        MEM[v156 + v155.data] = MEM[v156 + (32 + v17.data + 32)];
                                        v156 += 32;
                                    }
                                    MEM[1 + v155.data] = 0;
                                    v158 = v155.data;
                                    v159 = new uint256[](1);
                                    v160 = v161 = v159.data;
                                    v162 = v163 = v159.data + 32;
                                    v164 = v165 = 32 + v17.data + 33 + 32;
                                    v166 = v167 = 0;
                                    while (v166 < 1) {
                                        MEM[v160] = v162 - v159 - 32;
                                        MEM[v162] = MEM[MEM[v164]];
                                        v168 = v169 = 0;
                                        while (v168 < MEM[MEM[v164]]) {
                                            MEM[v168 + (v162 + 32)] = MEM[v168 + (MEM[v164] + 32)];
                                            v168 += 32;
                                        }
                                        MEM[MEM[MEM[v164]] + (v162 + 32)] = 0;
                                        v162 = 32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[MEM[v164]]) + v162);
                                        v160 += 32;
                                        v164 += 32;
                                        v166 += 1;
                                    }
                                    require(bool(0x66a9893cc07d91d95644aedd05d03f95e1dba8af.code.size));
                                    v170 = 0x66a9893cc07d91d95644aedd05d03f95e1dba8af.execute(v155, v159, v5, 0x1000000000000000000000000000000000000000000000000000000000000000).gas(msg.gas);
                                    require(bool(v170), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
                                } else {
                                    v171 = new uint256[](1);
                                    v172 = v173 = 0;
                                    while (v172 < 1) {
                                        MEM[v172 + v171.data] = MEM[v172 + (32 + v17.data + 32)];
                                        v172 += 32;
                                    }
                                    MEM[1 + v171.data] = 0;
                                    v174 = v171.data;
                                    v175 = new uint256[](1);
                                    v176 = v177 = v175.data;
                                    v178 = v179 = v175.data + 32;
                                    v180 = v181 = 32 + v17.data + 33 + 32;
                                    v182 = v183 = 0;
                                    while (v182 < 1) {
                                        MEM[v176] = v178 - v175 - 32;
                                        MEM[v178] = MEM[MEM[v180]];
                                        v184 = v185 = 0;
                                        while (v184 < MEM[MEM[v180]]) {
                                            MEM[v184 + (v178 + 32)] = MEM[v184 + (MEM[v180] + 32)];
                                            v184 += 32;
                                        }
                                        MEM[MEM[MEM[v180]] + (v178 + 32)] = 0;
                                        v178 = 32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[MEM[v180]]) + v178);
                                        v176 += 32;
                                        v180 += 32;
                                        v182 += 1;
                                    }
                                    require(bool((address(0x66a9893cc07d91d95644aedd05d03f95e1dba8af)).code.size));
                                    v186 = address(0x66a9893cc07d91d95644aedd05d03f95e1dba8af).execute(v171, v175, v5, 0x1000000000000000000000000000000000000000000000000000000000000000).value(uint128(v6)).gas(msg.gas);
                                    require(bool(v186), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
                                }
                                v187 = 0xebb(this, msg.data[v118] >> 96);
                                v188 = _SafeSub(v187, v154);
                                require(v188 >= uint128(0), Error('Insufficient output amount'));
                                if (!address(msg.data[v118] >> 96)) {
                                    v189 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.deposit().value(v187).gas(msg.gas);
                                    require(v189, Error('Failed to deposith ETH'));
                                }
                                // Unknown jump to Block 0x833B0x1fe. Refer to 3-address code (TAC);
                            } else {
                                MEM[32 + v17.data] = 0x8c379a000000000000000000000000000000000000000000000000000000000;
                                MEM[32 + v17.data + 4] = 32;
                                revert(Error('Insufficient balance'));
                            }
                        }
                    } else {
                        v15 = v190 = 5560;
                        v98 = v191 = 0;
                        v192 = v193 = 6370;
                        v194 = v195 = 0x4133(v12);
                    }
                } else {
                    v15 = v196 = 5560;
                    v98 = v197 = 0;
                    v192 = v198 = 6196;
                    v194 = v199 = 0x4133(v12);
                }
                // Unknown jump to Block ['0x1834B0x827B0x1fe', '0x18e2B0x827B0x1fe']. Refer to 3-address code (TAC);
                v98 = v200 = 1 == uint8(byte(msg.data[v12], 0x0));
                v98 = v201 = msg.data[v194] >> 96;
                v202 = _SafeAdd(v194, 20);
                v98 = v203 = msg.data[v202] >> 96;
                v204 = _SafeAdd(v202, 20);
                if (bool(!((byte(msg.data[0x90], 0x0)) & 0x2))) {
                    if (!bool(!((byte(msg.data[0x90], 0x0)) & 0x1))) {
                        v107 = v205 = 6320;
                        if (1 != uint8(byte(msg.data[v12], 0x0))) {
                        }
                    }
                } else {
                    v6 = v206 = msg.data[v204 + 1] >> (byte(msg.data[v204], 0x0));
                }
                v207 = 0x1f81(v98, v6, v98, v98, v6);
                // Unknown jump to Block 0x833B0x1fe. Refer to 3-address code (TAC);
                v208 = v209 = this;
                v6 = v210 = 0;
                v211 = v212 = !address(v98);
                if (address(v98)) {
                    v211 = 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == address(v98);
                }
                if (!v211) {
                    v213 = v98.balanceOf(v208).gas(msg.gas);
                    if (v213) {
                        v6 = v214 = MEM[0];
                        // Unknown jump to Block ['0x18b0B0x827B0x1fe', '0x196fB0x827B0x1fe', '0x1b53B0x827B0x1fe']. Refer to 3-address code (TAC);
                    }
                } else {
                    v6 = v215 = (address(v208)).balance;
                }
                // Unknown jump to Block ['0x18b0B0x827B0x1fe', '0x196fB0x827B0x1fe', '0x1b53B0x827B0x1fe']. Refer to 3-address code (TAC);
                v98 = v216 = 1 == uint8(byte(msg.data[v12], 0x0));
                v98 = v217 = msg.data[v194] >> 96;
                v218 = _SafeAdd(v194, 20);
                v98 = v219 = msg.data[v218] >> 96;
                v220 = _SafeAdd(v218, 20);
                v98 = v221 = msg.data[v220] >> 240;
                v15 = v222 = _SafeAdd(v220, 2);
                if (bool(!((byte(msg.data[0x90], 0x0)) & 0x2))) {
                    if (!bool(!((byte(msg.data[0x90], 0x0)) & 0x1))) {
                        v107 = v223 = 6511;
                        if (1 != uint8(byte(msg.data[v12], 0x0))) {
                        }
                    }
                } else {
                    v6 = v224 = msg.data[v222 + 1] >> (byte(msg.data[v222], 0x0));
                }
                v225 = 0x2016(0, v98, v6, v98, v98, v98, v6);
                // Unknown jump to Block 0x833B0x1fe. Refer to 3-address code (TAC);
                v208 = v226 = this;
                // Unknown jump to Block 0xebb0x9eeB0x827B0x1fe. Refer to 3-address code (TAC);
                v227 = v228;
                v231 = 'console.log'.staticcall(0xfcec75e000000000000000000000000000000000000000000000000000000000 | uint224(96), v227, address(v98), address(v98), v5, 'Before-Exec Ekubo Swap-1: ').gas(msg.gas);
                v232 = v233;
                v236 = 'console.log'.staticcall(0xca47c4eb00000000000000000000000000000000000000000000000000000000 | uint224(96), v232, v6, v6, v5, 'Before-Exec Ekubo Swap-2: ').gas(msg.gas);
                v237 = 0x2baa(v6, v98, v98, v98, v98);
                v238 = v239;
                v242 = 'console.log'.staticcall(0xca47c4eb00000000000000000000000000000000000000000000000000000000 | uint224(96), v238, v6, v237, v5, 'Exec Ekubo Swap: ').gas(msg.gas);
                // Unknown jump to Block 0x1c27B0x827B0x1fe. Refer to 3-address code (TAC);
                // Unknown jump to Block 0x833B0x1fe. Refer to 3-address code (TAC);
            }
            MEM[4] = 0;
            v243 = (msg.data[92] >> 96).transfer(v8, msg.data[112]).gas(msg.gas);
            require(v243, Error('Failed to repay borrow token'));
            v6 = v244 = 2224;
            v6 = v245 = 1;
            v6 = v246 = msg.data[v245] >> 176;
            v247 = v248 = 4146;
            v249 = v250 = _SafeAdd(10, v245);
            while (1) {
                v6 = v251 = msg.data[v249] >> 176;
                // Unknown jump to Block ['0x1032B0x8a4B0x1fe', '0x1044B0x8a4B0x1fe']. Refer to 3-address code (TAC);
                v247 = v252 = 4164;
                v249 = v253 = _SafeAdd(20, v6);
            }
            v254 = 0xebb(this, 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
            v255 = _SafeAdd(v6, v6);
            v256 = _SafeAdd(v255, v251);
            require(v254 > v256, Error('Failed due to no profit'));
            v257 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(v254).gas(msg.gas);
            require(v257, Error('Failed to withdraw WETH'));
            v258 = _SafeSub(v254, v256);
            v259 = _SafeAdd(30, v6);
            v260 = _SafeMul(v258, uint8(byte(msg.data[v259], 0x0)));
            v261 = _SafeDiv(v260, 100);
            v262 = _SafeSub(v258, v261);
            if (v261) {
                v263 = block.coinbase.call().value(v261).gas(msg.gas);
                require(v263, Error('Failed to transfer ETH to Coinbase'));
            }
            if (v6) {
                v264 = v6.call().value(v6).gas(msg.gas);
                require(v264, Error('Failed to recover token wallet gasfee'));
            }
            if (v6) {
                v265 = v6.call().value(v6).gas(msg.gas);
                require(v265, Error('Failed to recover aggregator wallet gasfee'));
            }
            if (v251) {
                v266 = tx.origin.call().value(v251).gas(msg.gas);
                require(v266, Error('Failed to recover gasfee'));
            }
            if (v262) {
                v267 = 0xa487e3c1d7880675f5578e24110ba138c2558c1e.call().value(this.balance).gas(msg.gas);
                require(v267, Error('Failed to transfer profit'));
            }
            // Unknown jump to Block 0x1b10x13a. Refer to 3-address code (TAC);
        }
    } else {
        v268 = _SafeAdd(12, 20);
        v269 = v270;
        v273 = 'console.log'.log(v269, msg.data[v268 + 1] >> (byte(msg.data[v268], 0x0)), v5, 'FlashMultiSwap: ').gas(msg.gas);
        require(12 <= msg.data.length);
        require(msg.data.length <= msg.data.length);
        v274 = new bytes[](msg.data.length - 12);
        v275 = v274 + (32 + (31 + (msg.data.length - 12) >> 5 << 5));
        CALLDATACOPY(v274.data, 12, msg.data.length - 12);
        v274[msg.data.length - 12] = 0;
        0xe39(v274, msg.data[v268 + 1] >> (byte(msg.data[v268], 0x0)), msg.data[12] >> 96);
        v276 = 0xebb(this, 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
        require(v276 > msg.data[1] >> 176, Error('Failed due to no profit'));
        v277 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(v276).gas(msg.gas);
        require(v277, Error('Failed to withdraw WETH'));
        v278 = _SafeSub(v276, msg.data[1] >> 176);
        v279 = _SafeAdd(10, 1);
        v280 = _SafeMul(v278, uint8(byte(msg.data[v279], 0x0)));
        v281 = _SafeDiv(v280, 100);
        v282 = _SafeSub(v278, v281);
        if (v281) {
            v283 = block.coinbase.call().value(v281).gas(msg.gas);
            require(v283, Error('Failed to transfer ETH to Coinbase'));
        }
        if (msg.data[1] >> 176) {
            v284 = tx.origin.call().value(msg.data[1] >> 176).gas(msg.gas);
            require(v284, Error('Failed to recover gasfee'));
        }
        if (v282) {
            v285 = 0xa487e3c1d7880675f5578e24110ba138c2558c1e.call().value(this.balance).gas(msg.gas);
            require(v285, Error('Failed to transfer profit'));
        }
    }
    return ;
}

function 0x1f81(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint8 varg4) private { 
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
        v8 = v9 = 0x373f(uint112(MEM[32]), uint112(MEM[0]), varg1);
    } else {
        v8 = v10 = 0x373f(uint112(MEM[0]), uint112(MEM[32]), varg1);
    }
    if (!varg0) {
        0x376c(0, v8, varg1, varg2, v1);
    } else {
        0x376c(v8, 0, varg1, varg3, v1);
    }
    return v8;
}

function 0x2016(uint256 varg0, uint256 varg1, uint256 varg2, uint16 varg3, uint256 varg4, uint256 varg5, uint256 varg6) private { 
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

function 0x27cd(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5) private { 
    varg3 = v0 = 0;
    v1 = v2 = 0x3c0c(varg4, varg5);
    v1 = v3 = 0x3c0c(varg3, varg5);
    if (address(varg4) + 0xffffffffffffffffffffffff1111111111111111111111111111111111111112) {
        varg0 = v4 = 10694;
        0x927(varg2, varg5, varg4);
        if (!varg0) {
            require(bool((address(v1)).code.size));
            v5 = address(v1).setMetaGold(v1, v1, v1, v1).gas(msg.gas);
            require(bool(v5), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        } else {
            require(bool((address(v1)).code.size));
            v6 = address(v1).exchange(int128(v1), int128(v1), v1, v1).gas(msg.gas);
            require(bool(v6), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        }
    } else {
        require(this.balance >= varg2, Error('Insufficient ETH balance'));
        require(!varg0, Error("Stable pools don't support native ETH. Use WETH instead."));
        require(bool((address(varg5)).code.size));
        v7 = address(varg5).setMetaGold(v2, v3, varg2, varg1).value(varg2).gas(msg.gas);
        require(bool(v7), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
    v8 = 0xebb(this, varg3);
    return v8;
}

function 0x2baa(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4) private { 
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
            v20 = 0x4416(MEM[v16 + 32]);
            v21 = v22 = uint128(v20);
        } else {
            v23 = 0x4416(MEM[v16]);
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

function 0x2f98(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4) private { 
    if (address(varg3) >= address(varg2)) {
    }
    if (address(varg3) + 0xffffffffffffffffffffffff1111111111111111111111111111111111111112) {
        0x927(varg1, varg4, varg3);
        v0 = address(varg3) == address(varg3);
        v1, /* uint256 */ v2 = address(varg4).swapIn(v0, varg1, varg0, this).gas(msg.gas);
        require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    } else {
        v3 = 0xebb(this, varg3);
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

function 0x373f(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    require(!(!varg2 | (!varg1 | !varg0)));
    return varg2 * varg0 * 997 / (1000 * varg1 + 997 * varg2);
}

function 0x376c(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4) private { 
    MEM[4] = 0;
    v0 = varg3.transfer(varg4, varg2).gas(msg.gas);
    v1 = varg4.swap(varg1, varg0, this, 128, 0).gas(msg.gas);
    require(v1, Error('Failed to swap token'));
    return ;
}

function 0x39c4(uint256 varg0, address varg1, address varg2, uint256 varg3) private { 
    0x927(uint256.max, 0x22d473030f116ddee9f6b43ac78ba3, varg3);
    v0 = 0x446d(block.timestamp, varg0);
    require(bool(0x22d473030f116ddee9f6b43ac78ba3.code.size));
    v1 = 0x22d473030f116ddee9f6b43ac78ba3.approve(address(varg3), varg2, varg1, uint48(v0)).gas(msg.gas);
    require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    return ;
}

function 0x3ac0(int24 varg0, uint24 varg1, address varg2, address varg3) private { 
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

function 0x3c0c(uint256 varg0, uint256 varg1) private { 
    varg0 = v0 = 0;
    while (1) {
        if (varg0 < 8) {
            v1 = v2, /* uint256 */ varg0 = address(varg0).coins(varg0).gas(msg.gas);
            if (v2) {
                require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                require(varg0 == address(varg0));
                v1 = v3 = 1;
            }
            if (v1) {
                v4 = v5 = 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == address(varg0);
                if (v5) {
                    v4 = v6 = 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == address(varg0);
                    if (0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee != address(varg0)) {
                        v4 = v7 = !address(varg0);
                    }
                }
                if (!v4) {
                    if (address(varg0) - address(varg0)) {
                        varg0 += 1;
                    } else {
                        break;
                    }
                } else {
                    break;
                }
                return varg0;
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

function 0x4133(uint256 varg0) private { 
    require(varg0 - uint256.max, Panic(17)); // arithmetic overflow or underflow
    return 1 + varg0;
}

function 0x4416(int128 varg0) private { 
    require(varg0 - int128.min, Panic(17)); // arithmetic overflow or underflow
    return 0 - varg0;
}

function 0x446d(uint48 varg0, uint48 varg1) private { 
    require(varg1 + varg0 <= uint48.max, Panic(17)); // arithmetic overflow or underflow
    return varg1 + varg0;
}

function 0x8b8() private { 
    v0 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.deposit().value(msg.value).gas(msg.gas);
    require(v0, Error('Faild to deposit ETH'));
    return ;
}

function 0x927(uint256 varg0, uint256 varg1, uint256 varg2) private { 
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

function 0xe39(bytes varg0, uint256 varg1, address varg2) private { 
    v0 = varg0;
    require(bool(0xbbbbbbbbbb9cc5e90e3b3af64bdaf62c37eeffcb.code.size));
    v3 = 0xbbbbbbbbbb9cc5e90e3b3af64bdaf62c37eeffcb.flashLoan(varg2, varg1, v0).gas(msg.gas);
    require(bool(v3), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    return ;
}

function 0xebb(uint256 varg0, uint256 varg1) private { 
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

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7) public payable { 
    if (msg.data.length) {
        if (tx.origin - msg.sender) {
            CALLDATACOPY(0, 132, 96);
            if (msg.sender + 0xffffffffffffffffffffffff4444444444633a16f1c4c509b42509d3c8110035) {
                if (msg.sender + 0xffffffffffffffffffffffff3fd555c64ddc0172f5f1a3b0d81526f7c38a933e) {
                    if (msg.data.length > 228) {
                        require(228 < msg.data.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                        if (0 - uint8(varg6 >> 248)) {
                            if (1 - uint8(varg6 >> 248)) {
                                if (3 - uint8(varg6 >> 248)) {
                                    if (4 - uint8(varg6 >> 248)) {
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
                            if (0 - bytes1(varg7 >> 248 << 248)) {
                                if (uint248.max + 1 - bytes1(varg7 >> 248 << 248)) {
                                    if (0x200000000000000000000000000000000000000000000000000000000000000 - bytes1(varg7 >> 248 << 248)) {
                                        require(!(0x300000000000000000000000000000000000000000000000000000000000000 - bytes1(varg7 >> 248 << 248)), Error('Unknown selector.'));
                                        v6 = v7 = 433;
                                        MEM[4] = 0;
                                        v8 = (varg4 >> 96).transfer(msg.sender, varg1).gas(msg.gas);
                                        MEM[64] = MEM[64];
                                    } else {
                                        v6 = v9 = 433;
                                        MEM[4] = 0;
                                        v10 = (varg5 >> 96).transfer(msg.sender, varg2).gas(msg.gas);
                                        MEM[64] = MEM[64];
                                    }
                                } else {
                                    v6 = v11 = 433;
                                    v12 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.transferFrom(this, msg.sender, varg1).gas(msg.gas);
                                    MEM[64] = MEM[64];
                                }
                            } else {
                                v6 = v13 = 433;
                                v14 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.transferFrom(this, msg.sender, varg2).gas(msg.gas);
                                MEM[64] = MEM[64];
                            }
                            // Unknown jump to Block 0x38. Refer to 3-address code (TAC);
                        }
                    }
                    v15 = v16 = 56;
                    v17 = v18 = 0;
                    v19 = v20 = 0;
                    require(v20 < msg.data.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                } else {
                    exit;
                }
            } else if (100 - msg.data.length) {
                v21 = _SafeAdd(100, 20);
                v22 = v23;
                v26 = 'console.log'.staticcall(0xca47c4eb00000000000000000000000000000000000000000000000000000000 | uint224(96), v22, msg.data[v21 + 1] >> (byte(msg.data[v21], 0x0)), 1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3)), v27, 'flashMultiSwapCallback: ').gas(msg.gas);
                v28 = v29 = 1;
                v30 = _SafeAdd(40, 1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3)));
                if (v30 < msg.data.length) {
                    v31 = 0x4133(1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3)));
                    v28 = v32 = 0x3f & (byte(msg.data[1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3))], 0x0)) >> 2;
                    v28 = v33 = (byte(msg.data[1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3))], 0x0)) & 0x2;
                    v34 = v35 = (byte(msg.data[1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3))], 0x0)) & 0x1;
                    v36 = v37;
                    v40 = 'console.log'.staticcall(0xa7a8785300000000000000000000000000000000000000000000000000000000 | uint224(128), v36, v31, v29, v32, v27, 'SingleSwapInput Start: ').gas(msg.gas);
                    v41 = v42 = !uint8(v32);
                    if (uint8(v32)) {
                        v41 = 1 == uint8(v32);
                    }
                    if (!v41) {
                        v43 = v44 = 3 == uint8(v32);
                        if (3 != uint8(v32)) {
                            v43 = 4 == uint8(v32);
                        }
                        if (!v43) {
                            if (5 - uint8(v32)) {
                                if (6 - uint8(v32)) {
                                    if (15 - uint8(v32)) {
                                        if (16 - uint8(v32)) {
                                            if (18 - uint8(v32)) {
                                                if (19 - uint8(v32)) {
                                                    if (20 - uint8(v32)) {
                                                        if (21 - uint8(v32)) {
                                                            MEM[32 + v36.data] = 0x8c379a000000000000000000000000000000000000000000000000000000000;
                                                            MEM[32 + v36.data + 4] = 32;
                                                            revert(Error('Invalid Dex'));
                                                        } else {
                                                            v45 = _SafeAdd(v31, 20);
                                                            v46 = _SafeAdd(v45, 20);
                                                            v47 = _SafeAdd(1 + (v46 + (uint8.max + 1 - (byte(msg.data[v46], 0x0)) >> 3)), 3);
                                                            CALLDATACOPY(32 + v36.data + 32, v47, uint24(msg.data[1 + (v46 + (uint8.max + 1 - (byte(msg.data[v46], 0x0)) >> 3))] >> 232));
                                                            v48 = _SafeAdd(v47, uint24(msg.data[1 + (v46 + (uint8.max + 1 - (byte(msg.data[v46], 0x0)) >> 3))] >> 232));
                                                            0x927(msg.data[v46 + 1] >> (byte(msg.data[v46], 0x0)), 0x111111125421ca6dc452d289314280a0f8842a65, msg.data[v31] >> 96);
                                                            v49 = v50 = 0;
                                                            while (v49 < uint24(msg.data[1 + (v46 + (uint8.max + 1 - (byte(msg.data[v46], 0x0)) >> 3))] >> 232)) {
                                                                MEM[v49 + (32 + (32 + v36.data + uint24(msg.data[1 + (v46 + (uint8.max + 1 - (byte(msg.data[v46], 0x0)) >> 3))] >> 232)))] = MEM[v49 + (32 + v36.data + 32)];
                                                                v49 += 32;
                                                            }
                                                            MEM[uint24(msg.data[1 + (v46 + (uint8.max + 1 - (byte(msg.data[v46], 0x0)) >> 3))] >> 232) + (32 + (32 + v36.data + uint24(msg.data[1 + (v46 + (uint8.max + 1 - (byte(msg.data[v46], 0x0)) >> 3))] >> 232)))] = 0;
                                                            v51, /* uint256 */ v52, /* uint256 */ v53 = address(0x111111125421ca6dc452d289314280a0f8842a65).call(MEM[32 + 32 + v4178V0x153aV0x35cV0x7c.data + uint24(msg.data[1 + v1f12_0x0V0x35cV0x7c + uint8.max + 1 - 0x0 byte msg.data[v1f12_0x0V0x35cV0x7c] >> 3] >> 232):32 + 32 + v4178V0x153aV0x35cV0x7c.data + uint24(msg.data[1 + v1f12_0x0V0x35cV0x7c + uint8.max + 1 - 0x0 byte msg.data[v1f12_0x0V0x35cV0x7c] >> 3] >> 232) + uint24(msg.data[1 + v1f12_0x0V0x35cV0x7c + uint8.max + 1 - 0x0 byte msg.data[v1f12_0x0V0x35cV0x7c] >> 3] >> 232) + 32 + 32 + v4178V0x153aV0x35cV0x7c.data + uint24(msg.data[1 + v1f12_0x0V0x35cV0x7c + uint8.max + 1 - 0x0 byte msg.data[v1f12_0x0V0x35cV0x7c] >> 3] >> 232) - 32 + 32 + v4178V0x153aV0x35cV0x7c.data + uint24(msg.data[1 + v1f12_0x0V0x35cV0x7c + uint8.max + 1 - 0x0 byte msg.data[v1f12_0x0V0x35cV0x7c] >> 3] >> 232)], MEM[32 + 32 + v4178V0x153aV0x35cV0x7c.data + uint24(msg.data[1 + v1f12_0x0V0x35cV0x7c + uint8.max + 1 - 0x0 byte msg.data[v1f12_0x0V0x35cV0x7c] >> 3] >> 232):32 + 32 + v4178V0x153aV0x35cV0x7c.data + uint24(msg.data[1 + v1f12_0x0V0x35cV0x7c + uint8.max + 1 - 0x0 byte msg.data[v1f12_0x0V0x35cV0x7c] >> 3] >> 232)]).gas(msg.gas);
                                                            if (RETURNDATASIZE() == 0) {
                                                                v54 = v55 = 96;
                                                            } else {
                                                                v54 = v56 = new bytes[](RETURNDATASIZE());
                                                                RETURNDATACOPY(v56.data, 0, RETURNDATASIZE());
                                                            }
                                                            if (v51) {
                                                                v57 = 0xebb(this, msg.data[v45] >> 96);
                                                                v58 = 0xebb(this, msg.data[v31] >> 96);
                                                                if (v58) {
                                                                    MEM[4] = 0;
                                                                    v59 = (msg.data[v31] >> 96).transfer(0xa487e3c1d7880675f5578e24110ba138c2558c1e, v58).gas(msg.gas);
                                                                    require(v59, Error('Failed to transfer remained token'));
                                                                }
                                                            } else {
                                                                require(!MEM[v54], v53, MEM[v54]);
                                                                revert(Error('Failed to swap'));
                                                            }
                                                        }
                                                    } else {
                                                        v60 = v61 = 5560;
                                                        v62 = _SafeAdd(v31, 1);
                                                        v63 = _SafeAdd(v62, 20);
                                                        v64 = _SafeAdd(v63, 20);
                                                        v65 = v66 = msg.data[v64 + 1] >> (byte(msg.data[v64], 0x0));
                                                        v67 = _SafeAdd(1 + (v64 + (uint8.max + 1 - (byte(msg.data[v64], 0x0)) >> 3)), 3);
                                                        CALLDATACOPY(32 + v36.data + 32, v67, uint24(msg.data[1 + (v64 + (uint8.max + 1 - (byte(msg.data[v64], 0x0)) >> 3))] >> 232));
                                                        v68 = 32 + (32 + v36.data + uint24(msg.data[1 + (v64 + (uint8.max + 1 - (byte(msg.data[v64], 0x0)) >> 3))] >> 232));
                                                        v69 = _SafeAdd(v67, uint24(msg.data[1 + (v64 + (uint8.max + 1 - (byte(msg.data[v64], 0x0)) >> 3))] >> 232));
                                                        v65 = v70 = 0;
                                                        if (byte(msg.data[v31], 0x0)) {
                                                            v71 = v72 = 0x6000da47483062a0d734ba3dc7576ce6a0b645c4;
                                                        } else {
                                                            v71 = v73 = 0x11f84b9aa48e5f8aa8b9897600006289be;
                                                        }
                                                        if (!address(msg.data[v62] >> 96)) {
                                                            v74 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(v66).gas(msg.gas);
                                                            require(v74, Error('Failed to withdraw WETH'));
                                                        } else {
                                                            0x927(v66, v71, msg.data[v62] >> 96);
                                                        }
                                                        v75 = v76 = 0;
                                                        while (v75 < uint24(msg.data[1 + (v64 + (uint8.max + 1 - (byte(msg.data[v64], 0x0)) >> 3))] >> 232)) {
                                                            MEM[v75 + v68] = MEM[v75 + (32 + v36.data + 32)];
                                                            v75 += 32;
                                                        }
                                                        MEM[uint24(msg.data[1 + (v64 + (uint8.max + 1 - (byte(msg.data[v64], 0x0)) >> 3))] >> 232) + v68] = 0;
                                                        v77, /* uint256 */ v78, /* uint256 */ v79 = address(v71).call(MEM[v3317V0x1eb9V0x35cV0x7c:v3317V0x1eb9V0x35cV0x7c + uint24(msg.data[1 + v1e8a_0x0V0x35cV0x7c + uint8.max + 1 - 0x0 byte msg.data[v1e8a_0x0V0x35cV0x7c] >> 3] >> 232) + v3317V0x1eb9V0x35cV0x7c - v3317V0x1eb9V0x35cV0x7c], MEM[v3317V0x1eb9V0x35cV0x7c:v3317V0x1eb9V0x35cV0x7c]).value(v65).gas(msg.gas);
                                                        if (RETURNDATASIZE() == 0) {
                                                            v80 = v81 = 96;
                                                        } else {
                                                            v80 = v82 = new bytes[](RETURNDATASIZE());
                                                            RETURNDATACOPY(v82.data, 0, RETURNDATASIZE());
                                                        }
                                                        if (v77) {
                                                            v83 = 0xebb(this, msg.data[v63] >> 96);
                                                            v84 = 0xebb(this, msg.data[v62] >> 96);
                                                            if (v84) {
                                                                if (address(msg.data[v62] >> 96)) {
                                                                    MEM[4] = 0;
                                                                    v85 = (msg.data[v62] >> 96).transfer(0xa487e3c1d7880675f5578e24110ba138c2558c1e, v84).gas(msg.gas);
                                                                    require(v85, Error('Failed to transfer remained token'));
                                                                } else {
                                                                    v86 = 0xa487e3c1d7880675f5578e24110ba138c2558c1e.call().value(v84).gas(msg.gas);
                                                                    require(v86, Error('Failed to transfer reamined ETH'));
                                                                }
                                                            }
                                                        } else {
                                                            require(!MEM[v80], v79, MEM[v80]);
                                                            revert(Error('Failed to swap'));
                                                        }
                                                    }
                                                } else {
                                                    v34 = v87 = 5560;
                                                    v88 = _SafeAdd(v31, 20);
                                                    v89 = _SafeAdd(v88, 20);
                                                    v90 = _SafeAdd(v89, 20);
                                                    v91 = _SafeAdd(v90, 20);
                                                    v92 = _SafeAdd(1 + (v91 + (uint8.max + 1 - (byte(msg.data[v91], 0x0)) >> 3)), 3);
                                                    CALLDATACOPY(32 + v36.data + 32, v92, uint24(msg.data[1 + (v91 + (uint8.max + 1 - (byte(msg.data[v91], 0x0)) >> 3))] >> 232));
                                                    v93 = _SafeAdd(v92, uint24(msg.data[1 + (v91 + (uint8.max + 1 - (byte(msg.data[v91], 0x0)) >> 3))] >> 232));
                                                    0x927(msg.data[v91 + 1] >> (byte(msg.data[v91], 0x0)), msg.data[v31] >> 96, msg.data[v89] >> 96);
                                                    v94 = v95 = 0;
                                                    while (v94 < uint24(msg.data[1 + (v91 + (uint8.max + 1 - (byte(msg.data[v91], 0x0)) >> 3))] >> 232)) {
                                                        MEM[v94 + (32 + (32 + v36.data + uint24(msg.data[1 + (v91 + (uint8.max + 1 - (byte(msg.data[v91], 0x0)) >> 3))] >> 232)))] = MEM[v94 + (32 + v36.data + 32)];
                                                        v94 += 32;
                                                    }
                                                    MEM[uint24(msg.data[1 + (v91 + (uint8.max + 1 - (byte(msg.data[v91], 0x0)) >> 3))] >> 232) + (32 + (32 + v36.data + uint24(msg.data[1 + (v91 + (uint8.max + 1 - (byte(msg.data[v91], 0x0)) >> 3))] >> 232)))] = 0;
                                                    v96, /* uint256 */ v97, /* uint256 */ v98 = address(msg.data[v88] >> 96).call(MEM[32 + 32 + v4178V0x153aV0x35cV0x7c.data + uint24(msg.data[1 + v1df0_0x0V0x35cV0x7c + uint8.max + 1 - 0x0 byte msg.data[v1df0_0x0V0x35cV0x7c] >> 3] >> 232):32 + 32 + v4178V0x153aV0x35cV0x7c.data + uint24(msg.data[1 + v1df0_0x0V0x35cV0x7c + uint8.max + 1 - 0x0 byte msg.data[v1df0_0x0V0x35cV0x7c] >> 3] >> 232) + uint24(msg.data[1 + v1df0_0x0V0x35cV0x7c + uint8.max + 1 - 0x0 byte msg.data[v1df0_0x0V0x35cV0x7c] >> 3] >> 232) + 32 + 32 + v4178V0x153aV0x35cV0x7c.data + uint24(msg.data[1 + v1df0_0x0V0x35cV0x7c + uint8.max + 1 - 0x0 byte msg.data[v1df0_0x0V0x35cV0x7c] >> 3] >> 232) - 32 + 32 + v4178V0x153aV0x35cV0x7c.data + uint24(msg.data[1 + v1df0_0x0V0x35cV0x7c + uint8.max + 1 - 0x0 byte msg.data[v1df0_0x0V0x35cV0x7c] >> 3] >> 232)], MEM[32 + 32 + v4178V0x153aV0x35cV0x7c.data + uint24(msg.data[1 + v1df0_0x0V0x35cV0x7c + uint8.max + 1 - 0x0 byte msg.data[v1df0_0x0V0x35cV0x7c] >> 3] >> 232):32 + 32 + v4178V0x153aV0x35cV0x7c.data + uint24(msg.data[1 + v1df0_0x0V0x35cV0x7c + uint8.max + 1 - 0x0 byte msg.data[v1df0_0x0V0x35cV0x7c] >> 3] >> 232)]).gas(msg.gas);
                                                    if (RETURNDATASIZE() == 0) {
                                                        v99 = v100 = 96;
                                                    } else {
                                                        v99 = v101 = new bytes[](RETURNDATASIZE());
                                                        RETURNDATACOPY(v101.data, 0, RETURNDATASIZE());
                                                    }
                                                    if (v96) {
                                                        v102 = 0xebb(this, msg.data[v90] >> 96);
                                                    } else {
                                                        require(!MEM[v99], v98, MEM[v99]);
                                                        revert(Error('Failed to swap'));
                                                    }
                                                }
                                            } else if (v29 > msg.data[v31 + 1] >> (byte(msg.data[v31], 0x0))) {
                                                v103 = _SafeSub(v29, msg.data[v31 + 1] >> (byte(msg.data[v31], 0x0)));
                                            } else {
                                                MEM[32 + v36.data] = 0x8c379a000000000000000000000000000000000000000000000000000000000;
                                                MEM[32 + v36.data + 4] = 32;
                                                revert(Error('Failed to keep token'));
                                            }
                                        } else {
                                            v60 = v104 = 5560;
                                            v105 = _SafeAdd(v31, 20);
                                            v106 = _SafeAdd(v105, 20);
                                            v107 = _SafeAdd(v106, 20);
                                            if (bool(!((byte(msg.data[1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3))], 0x0)) & 0x2))) {
                                                if (!bool(!((byte(msg.data[1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3))], 0x0)) & 0x1))) {
                                                    v28 = v108 = 0xebb(this, msg.data[v105] >> 96);
                                                }
                                            } else {
                                                v28 = v109 = msg.data[v107 + 1] >> (byte(msg.data[v107], 0x0));
                                            }
                                            v110 = 0x2f98(0, v28, msg.data[v106] >> 96, msg.data[v105] >> 96, msg.data[v31] >> 96);
                                            v111 = v112;
                                            v115 = 'console.log'.staticcall(0xca47c4eb00000000000000000000000000000000000000000000000000000000 | uint224(96), v111, v28, v110, v27, 'Exec Fluid Swap: ').gas(msg.gas);
                                        }
                                        // Unknown jump to Block 0x367B0x7c. Refer to 3-address code (TAC);
                                    } else {
                                        v34 = v116 = 5560;
                                        v117 = v118 = msg.data[v31] >> 96;
                                        v119 = _SafeAdd(v31, 20);
                                        v117 = v120 = msg.data[v119] >> 96;
                                        v121 = _SafeAdd(v119, 20);
                                        v117 = v122 = msg.data[v121];
                                        v123 = _SafeAdd(v121, 32);
                                        v117 = v124 = byte(msg.data[v123], 0x0);
                                        v125 = _SafeAdd(v123, 1);
                                        if (bool(!((byte(msg.data[1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3))], 0x0)) & 0x2))) {
                                            if (!bool(!((byte(msg.data[1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3))], 0x0)) & 0x1))) {
                                                v126 = v127 = 6995;
                                                if (!v124) {
                                                }
                                            }
                                        } else {
                                            v28 = v128 = msg.data[v125];
                                            v129 = _SafeAdd(v125, 32);
                                        }
                                    }
                                } else {
                                    v130 = _SafeAdd(v31, 20);
                                    v131 = _SafeAdd(v130, 20);
                                    v132 = _SafeAdd(v131, 20);
                                    v133 = v134 = _SafeAdd(v132, 1);
                                    if (bool(!((byte(msg.data[1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3))], 0x0)) & 0x2))) {
                                        if (!bool(!((byte(msg.data[1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3))], 0x0)) & 0x1))) {
                                            v28 = v135 = 0xebb(this, msg.data[v130] >> 96);
                                        }
                                    } else {
                                        v28 = msg.data[v134 + 1] >> (byte(msg.data[v134], 0x0));
                                    }
                                    v136 = 0x27cd(byte(msg.data[v132], 0x0), 0, v28, msg.data[v131] >> 96, msg.data[v130] >> 96, msg.data[v31] >> 96);
                                }
                                while (1) {
                                    // Unknown jump to Block 0x15b8B0x35cB0x7c. Refer to 3-address code (TAC);
                                }
                            } else {
                                v137 = _SafeAdd(v31, 20);
                                v138 = _SafeAdd(v137, 20);
                                v139 = _SafeAdd(v138, 3);
                                v140 = _SafeAdd(v139, 3);
                                if (bool(!((byte(msg.data[1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3))], 0x0)) & 0x2))) {
                                    if (!bool(!((byte(msg.data[1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3))], 0x0)) & 0x1))) {
                                        v28 = v141 = 0xebb(this, msg.data[v31] >> 96);
                                    }
                                } else {
                                    v28 = v142 = msg.data[v140 + 1] >> (byte(msg.data[v140], 0x0));
                                }
                                if (!bool(address(msg.data[v31] >> 96))) {
                                    v143 = 0xebb(this, msg.data[v31] >> 96);
                                    if (v143 < uint128(v28)) {
                                        v144 = _SafeSub(uint128(v28), v143);
                                        v145 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(v144).gas(msg.gas);
                                    }
                                }
                                v146 = 0xebb(this, msg.data[v31] >> 96);
                                if (v146 >= uint128(v28)) {
                                    if (address(msg.data[v31] >> 96)) {
                                        0x39c4(300, uint128(v28), 0x66a9893cc07d91d95644aedd05d03f95e1dba8af, msg.data[v31] >> 96);
                                    }
                                    v147, v148 = 0x3ac0(msg.data[v139] >> 232, msg.data[v138] >> 232, msg.data[v137] >> 96, msg.data[v31] >> 96);
                                    v149 = v150 = 1;
                                    v151 = v152 = 97 + v36.data;
                                    while (v149) {
                                        MEM[v151] = 96;
                                        v151 += 32;
                                        v149 = v149 - 1;
                                    }
                                    MEM[32 + v36.data + 97 + 32] = 0x600000000000000000000000000000000000000000000000000000000000000;
                                    MEM[32 + v36.data + 97 + 33] = 0xc00000000000000000000000000000000000000000000000000000000000000;
                                    MEM[32 + v36.data + 97 + 34] = 0xf00000000000000000000000000000000000000000000000000000000000000;
                                    v153 = 3;
                                    v154 = 67 + (32 + v36.data + 97);
                                    while (v153) {
                                        MEM[v154] = 96;
                                        v154 += 32;
                                        v153 = v153 - 1;
                                    }
                                    v155 = new struct(5);
                                    v155.word0 = v148;
                                    v155.word1 = bool(v147);
                                    v155.word2 = uint128(v28);
                                    v155.word3 = uint128(0);
                                    v156 = new struct(1);
                                    v156.word0 = 0;
                                    v155.word4 = v156;
                                    MEM[64 + v156] = 32;
                                    MEM[64 + v156 + 32] = address(MEM[v155.word0]);
                                    MEM[64 + v156 + 64] = address(MEM[v155.word0 + 32]);
                                    MEM[64 + v156 + 96] = uint24(MEM[v155.word0 + 64]);
                                    MEM[64 + v156 + 128] = int24(MEM[v155.word0 + 96]);
                                    MEM[64 + v156 + 160] = address(MEM[v155.word0 + 128]);
                                    MEM[64 + v156 + 192] = bool(v155.word1);
                                    MEM[64 + v156 + 224] = uint128(v155.word2);
                                    MEM[64 + v156 + (uint8.max + 1)] = uint128(v155.word3);
                                    MEM[64 + v156 + 288] = 288;
                                    MEM[64 + v156 + 320] = MEM[v155.word4];
                                    v157 = v158 = 0;
                                    while (v157 < MEM[v155.word4]) {
                                        MEM[v157 + (64 + v156 + 320 + 32)] = MEM[v157 + (v155.word4 + 32)];
                                        v157 += 32;
                                    }
                                    MEM[MEM[v155.word4] + (64 + v156 + 320 + 32)] = 0;
                                    MEM[32 + v156] = 32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320)) - (32 + v156) - 32;
                                    require(0 < 3, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                                    MEM[32 + (32 + v36.data + 97 + 35)] = 32 + v156;
                                    MEM[64 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320))] = address(msg.data[v31] >> 96);
                                    MEM[64 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320)) + 32] = uint128(v28);
                                    MEM[32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320))] = 64;
                                    require(1 < 3, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                                    MEM[64 + (32 + v36.data + 97 + 35)] = 32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320));
                                    MEM[160 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320))] = address(msg.data[v137] >> 96);
                                    MEM[160 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320)) + 32] = uint128(0);
                                    MEM[128 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320))] = 64;
                                    require(2 < 3, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                                    MEM[96 + (32 + v36.data + 97 + 35)] = 128 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320));
                                    MEM[256 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320))] = 64;
                                    MEM[256 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320)) + 64] = v159;
                                    v160 = v161 = 0;
                                    while (v160 < v159) {
                                        MEM[v160 + (256 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320)) + 64 + 32)] = MEM[v160 + (32 + v36.data + 97 + 32)];
                                        v160 += 32;
                                    }
                                    MEM[v159 + (256 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320)) + 64 + 32)] = 0;
                                    v162 = 64 + (256 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320)) + 64);
                                    MEM[256 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320)) + 32] = 128;
                                    MEM[v162] = 3;
                                    v163 = v164 = v162 + 32;
                                    v165 = v166 = v162 + 96 + 32;
                                    v167 = v168 = 32 + v36.data + 97 + 35 + 32;
                                    v169 = v170 = 0;
                                    while (v169 < 3) {
                                        MEM[v163] = v165 - v162 - 32;
                                        MEM[v165] = MEM[MEM[v167]];
                                        v171 = v172 = 0;
                                        while (v171 < MEM[MEM[v167]]) {
                                            MEM[v171 + (v165 + 32)] = MEM[v171 + (MEM[v167] + 32)];
                                            v171 += 32;
                                        }
                                        MEM[MEM[MEM[v167]] + (v165 + 32)] = 0;
                                        v165 = 32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[MEM[v167]]) + v165);
                                        v163 += 32;
                                        v167 += 32;
                                        v169 += 1;
                                    }
                                    MEM[224 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320))] = v165 - (224 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320))) - 32;
                                    require(0 < 1, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                                    MEM[32 + (32 + v36.data + 33)] = 224 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v155.word4]) + (64 + v156 + 320));
                                    v173 = 0xebb(this, msg.data[v137] >> 96);
                                    if (bool(address(msg.data[v31] >> 96))) {
                                        v174 = new uint256[](1);
                                        v175 = v176 = 0;
                                        while (v175 < 1) {
                                            MEM[v175 + v174.data] = MEM[v175 + (32 + v36.data + 32)];
                                            v175 += 32;
                                        }
                                        MEM[1 + v174.data] = 0;
                                        v177 = v174.data;
                                        v178 = new uint256[](1);
                                        v179 = v180 = v178.data;
                                        v181 = v182 = v178.data + 32;
                                        v183 = v184 = 32 + v36.data + 33 + 32;
                                        v185 = v186 = 0;
                                        while (v185 < 1) {
                                            MEM[v179] = v181 - v178 - 32;
                                            MEM[v181] = MEM[MEM[v183]];
                                            v187 = v188 = 0;
                                            while (v187 < MEM[MEM[v183]]) {
                                                MEM[v187 + (v181 + 32)] = MEM[v187 + (MEM[v183] + 32)];
                                                v187 += 32;
                                            }
                                            MEM[MEM[MEM[v183]] + (v181 + 32)] = 0;
                                            v181 = 32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[MEM[v183]]) + v181);
                                            v179 += 32;
                                            v183 += 32;
                                            v185 += 1;
                                        }
                                        require(bool(0x66a9893cc07d91d95644aedd05d03f95e1dba8af.code.size));
                                        v189 = 0x66a9893cc07d91d95644aedd05d03f95e1dba8af.execute(v174, v178, v27, 0x1000000000000000000000000000000000000000000000000000000000000000).gas(msg.gas);
                                        require(bool(v189), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
                                    } else {
                                        v190 = new uint256[](1);
                                        v191 = v192 = 0;
                                        while (v191 < 1) {
                                            MEM[v191 + v190.data] = MEM[v191 + (32 + v36.data + 32)];
                                            v191 += 32;
                                        }
                                        MEM[1 + v190.data] = 0;
                                        v193 = v190.data;
                                        v194 = new uint256[](1);
                                        v195 = v196 = v194.data;
                                        v197 = v198 = v194.data + 32;
                                        v199 = v200 = 32 + v36.data + 33 + 32;
                                        v201 = v202 = 0;
                                        while (v201 < 1) {
                                            MEM[v195] = v197 - v194 - 32;
                                            MEM[v197] = MEM[MEM[v199]];
                                            v203 = v204 = 0;
                                            while (v203 < MEM[MEM[v199]]) {
                                                MEM[v203 + (v197 + 32)] = MEM[v203 + (MEM[v199] + 32)];
                                                v203 += 32;
                                            }
                                            MEM[MEM[MEM[v199]] + (v197 + 32)] = 0;
                                            v197 = 32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[MEM[v199]]) + v197);
                                            v195 += 32;
                                            v199 += 32;
                                            v201 += 1;
                                        }
                                        require(bool((address(0x66a9893cc07d91d95644aedd05d03f95e1dba8af)).code.size));
                                        v205 = address(0x66a9893cc07d91d95644aedd05d03f95e1dba8af).execute(v190, v194, v27, 0x1000000000000000000000000000000000000000000000000000000000000000).value(uint128(v28)).gas(msg.gas);
                                        require(bool(v205), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
                                    }
                                    v206 = 0xebb(this, msg.data[v137] >> 96);
                                    v207 = _SafeSub(v206, v173);
                                    require(v207 >= uint128(0), Error('Insufficient output amount'));
                                    if (!address(msg.data[v137] >> 96)) {
                                        v208 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.deposit().value(v206).gas(msg.gas);
                                        require(v208, Error('Failed to deposith ETH'));
                                    }
                                    // Unknown jump to Block 0x367B0x7c. Refer to 3-address code (TAC);
                                } else {
                                    MEM[32 + v36.data] = 0x8c379a000000000000000000000000000000000000000000000000000000000;
                                    MEM[32 + v36.data + 4] = 32;
                                    revert(Error('Insufficient balance'));
                                }
                            }
                        } else {
                            v34 = v209 = 5560;
                            v117 = v210 = 0;
                            v211 = v212 = 6370;
                            v213 = v214 = 0x4133(v31);
                        }
                    } else {
                        v34 = v215 = 5560;
                        v117 = v216 = 0;
                        v211 = v217 = 6196;
                        v213 = v218 = 0x4133(v31);
                    }
                    // Unknown jump to Block ['0x1834B0x35cB0x7c', '0x18e2B0x35cB0x7c']. Refer to 3-address code (TAC);
                    v117 = v219 = 1 == uint8(byte(msg.data[v31], 0x0));
                    v117 = v220 = msg.data[v213] >> 96;
                    v221 = _SafeAdd(v213, 20);
                    v117 = v222 = msg.data[v221] >> 96;
                    v223 = _SafeAdd(v221, 20);
                    if (bool(!((byte(msg.data[1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3))], 0x0)) & 0x2))) {
                        if (!bool(!((byte(msg.data[1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3))], 0x0)) & 0x1))) {
                            v126 = v224 = 6320;
                            if (1 != uint8(byte(msg.data[v31], 0x0))) {
                            }
                        }
                    } else {
                        v28 = v225 = msg.data[v223 + 1] >> (byte(msg.data[v223], 0x0));
                    }
                    v226 = 0x1f81(v117, v28, v117, v117, v28);
                    // Unknown jump to Block 0x367B0x7c. Refer to 3-address code (TAC);
                    v227 = v228 = this;
                    v28 = v229 = 0;
                    v230 = v231 = !address(v117);
                    if (address(v117)) {
                        v230 = 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == address(v117);
                    }
                    if (!v230) {
                        v232 = v117.balanceOf(v227).gas(msg.gas);
                        if (v232) {
                            v28 = v233 = MEM[0];
                            // Unknown jump to Block ['0x18b0B0x35cB0x7c', '0x196fB0x35cB0x7c', '0x1b53B0x35cB0x7c']. Refer to 3-address code (TAC);
                        }
                    } else {
                        v28 = v234 = (address(v227)).balance;
                    }
                    // Unknown jump to Block ['0x18b0B0x35cB0x7c', '0x196fB0x35cB0x7c', '0x1b53B0x35cB0x7c']. Refer to 3-address code (TAC);
                    v117 = v235 = 1 == uint8(byte(msg.data[v31], 0x0));
                    v117 = v236 = msg.data[v213] >> 96;
                    v237 = _SafeAdd(v213, 20);
                    v117 = v238 = msg.data[v237] >> 96;
                    v239 = _SafeAdd(v237, 20);
                    v117 = v240 = msg.data[v239] >> 240;
                    v34 = v241 = _SafeAdd(v239, 2);
                    if (bool(!((byte(msg.data[1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3))], 0x0)) & 0x2))) {
                        if (!bool(!((byte(msg.data[1 + (v21 + (uint8.max + 1 - (byte(msg.data[v21], 0x0)) >> 3))], 0x0)) & 0x1))) {
                            v126 = v242 = 6511;
                            if (1 != uint8(byte(msg.data[v31], 0x0))) {
                            }
                        }
                    } else {
                        v28 = v243 = msg.data[v241 + 1] >> (byte(msg.data[v241], 0x0));
                    }
                    v244 = 0x2016(0, v117, v28, v117, v117, v117, v28);
                    // Unknown jump to Block 0x367B0x7c. Refer to 3-address code (TAC);
                    v227 = v245 = this;
                    // Unknown jump to Block 0xebb0x9eeB0x35cB0x7c. Refer to 3-address code (TAC);
                    v246 = v247;
                    v250 = 'console.log'.staticcall(0xfcec75e000000000000000000000000000000000000000000000000000000000 | uint224(96), v246, address(v117), address(v117), v27, 'Before-Exec Ekubo Swap-1: ').gas(msg.gas);
                    v251 = v252;
                    v255 = 'console.log'.staticcall(0xca47c4eb00000000000000000000000000000000000000000000000000000000 | uint224(96), v251, v28, v28, v27, 'Before-Exec Ekubo Swap-2: ').gas(msg.gas);
                    v256 = 0x2baa(v28, v117, v117, v117, v117);
                    v257 = v258;
                    v261 = 'console.log'.staticcall(0xca47c4eb00000000000000000000000000000000000000000000000000000000 | uint224(96), v257, v28, v256, v27, 'Exec Ekubo Swap: ').gas(msg.gas);
                    // Unknown jump to Block 0x1c27B0x35cB0x7c. Refer to 3-address code (TAC);
                    // Unknown jump to Block 0x367B0x7c. Refer to 3-address code (TAC);
                }
                0x927(msg.data[v21 + 1] >> (byte(msg.data[v21], 0x0)), msg.sender, varg3 >> 96);
            } else {
                0x927(10 ** 20, msg.sender, 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
            }
        } else {
            v15 = v262 = 56;
            v17 = v263 = 0;
            v19 = v264 = 0;
            require(v264 < msg.data.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        }
        0x13a(function_selector >> 248 << 248);
        exit;
    } else {
        exit;
    }
}
