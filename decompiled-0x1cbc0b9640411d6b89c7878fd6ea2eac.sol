// Decompiled by library.dedaub.com
// 2025.12.12 14:26 UTC
// Compiled using the vyper compiler version 0.3.9





function version() public payable {  find similar
    MEM[64] = 6;
    v0 = new uint256[](MEM[64]);
    MEM[v0.data] = 'v2.0.0';
    CALLDATACOPY(v0.data + v0.length, msg.data.length, 0 - v0.length & 0x1f);
    return v0;
}

function get_y(uint256 varg0, uint256 varg1, uint256[3] varg2, uint256 varg3) public payable {  find similar
    require(msg.data.length >= 228);
    if (varg0 >= 2700) {
        v0 = v1 = varg0 <= 0x1017df80;
    } else {
        v0 = v2 = 0;
    }
    require(v0);
    if (varg1 >= 10 ** 10) {
        v3 = v4 = varg1 <= 0xb1a2bc2ec50000;
    } else {
        v3 = v5 = 0;
    }
    require(v3);
    if (varg2 >= 10 ** 17) {
        v6 = v7 = varg2 <= 10 ** 33;
    } else {
        v6 = v8 = 0;
    }
    require(v6);
    MEM[1248] = 0;
    v9 = v10 = 0;
    while (1) {
        if (v9 != varg3) {
            require(v9 <= 2);
            require(!(msg.data[68 + (v9 << 5)] * 10 ** 18 / 10 ** 18 ^ msg.data[68 + (v9 << 5)]));
            require(varg2);
            v11 = msg.data[68 + (v9 << 5)] * 10 ** 18 / varg2;
            if (v11 >= 10 ** 16) {
                v12 = v13 = v11 <= 10 ** 20;
            } else {
                v12 = v14 = 0;
            }
            if (!v12) {
                CALLDATACOPY(1362, msg.data.length, 14);
                revert(Error(32, 18, 'Unsafe values x[i]'));
            }
        }
        v9 += 1;
        if (!(v9 ^ 0x3)) {
            CALLDATACOPY(1280, msg.data.length, 64);
            if (varg3) {
                if (varg3 ^ 0x1) {
                    if (!(varg3 ^ 0x2)) {
                    }
                }
            }
            require(!(varg0 >> uint8.max));
            require(!(varg1 >> uint8.max));
            require(!(varg2 >> uint8.max));
            require(MEM[1280] <= 2);
            require(!(msg.data[68 + (MEM[1280] << 5)] >> uint8.max));
            require(MEM[1312] <= 2);
            require(!(msg.data[68 + (MEM[1312] << 5)] >> uint8.max));
            v15 = varg2 * varg2 / msg.data[68 + (MEM[1280] << 5)] * (varg1 * varg1);
            require(((v15 * varg0 / varg0 == v15) | !varg0) & ((v15 != int256.min) | bool(~varg0)));
            v16 = 0x1566336316561edb086701c71c71c7 + 0x1bc16d674ec80000 * varg1 / 27 - v15 * varg0 / 729 / 10000 / msg.data[68 + (MEM[1312] << 5)];
            require(!((v15 * varg0 / 729 / 10000 / msg.data[68 + (MEM[1312] << 5)] < 0) ^ (v16 > 0x1566336316561edb086701c71c71c7 + 0x1bc16d674ec80000 * varg1 / 27)));
            v17 = msg.data[68 + (MEM[1280] << 5)] + msg.data[68 + (MEM[1312] << 5)] - varg2;
            require(((varg1 * varg1 * v17 / v17 == varg1 * varg1) | !v17) & ((varg1 * varg1 != int256.min) | bool(~v17)));
            v18 = 0x1566336316561edb086701c71c71c7 + varg1 * (varg1 + 0x3782dace9d900000) / 27 + varg1 * varg1 * v17 / varg2 * varg0 / 27 / 10000;
            require(!((varg1 * varg1 * v17 / varg2 * varg0 / 27 / 10000 < 0) ^ (v18 < 0x1566336316561edb086701c71c71c7 + varg1 * (varg1 + 0x3782dace9d900000) / 27)));
            require((10 ** 18 + varg1 > 0xffffffffffffffffffffffffffffffff4afb0ccc06219b7ba682764c8ab54160) & (10 ** 18 + varg1 < 0xb504f333f9de6484597d89b3754abea0));
            require(((0x1566336316561edb086701c71c71c7 * v18 / v18 == 0x1566336316561edb086701c71c71c7) | !v18) & ((0x1566336316561edb086701c71c71c7 != int256.min) | bool(~v18)));
            require(v16);
            require((v16 != uint256.max) | (0x1566336316561edb086701c71c71c7 * v18 != int256.min));
            v19 = v20 = 0x1566336316561edb086701c71c71c7 * v18 / v16 - v16;
            require(!((v16 < 0) ^ (v20 > 0x1566336316561edb086701c71c71c7 * v18 / v16)));
            if (v20 <= uint256.max) {
                require(v20 != 0 - v20);
                v19 = v21 = 0 - v20;
            }
            MEM[1696] = 0;
            if (v19 < 0xaf298d050e4395d69670b12b7f41000000000001) {
                if (v19 < 0x47bf19673df52e37f2410011d100000000001) {
                    if (v19 < 0x1d6329f1c35ca4bfabb9f5610000000001) {
                        if (v19 < 0xc097ce7bc90715b34b9f1000000001) {
                            if (v19 < 0x4ee2d6d415b85acef8100000001) {
                                if (v19 < 0x204fce5e3e25026110000001) {
                                    if (v19 < 0xd3c21bcecceda1000001) {
                                        if (v19 < 0x56bc75e2d63100001) {
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            MEM[1728] = 0;
            if (v22 <= uint256.max) {
                require(v22 != 0 - v22);
                v23 = v24 = 0 - v22;
            }
            if (v25 <= uint256.max) {
                require(v25 != 0 - v25);
                v26 = v27 = 0 - v25;
            }
            if (v26 > v23) {
                v28 = v29 = 0x722112107720a4902cd0097b425ed / v16;
                if (v29 <= uint256.max) {
                    require(v29 != 0 - v29);
                    v28 = v30 = 0 - v29;
                }
                require(((v16 * v28 / v28 == v16) | !v28) & ((v16 != int256.min) | bool(~v28)));
                require(((v18 * v28 / v28 == v18) | !v28) & ((v18 != int256.min) | bool(~v28)));
                require((((10 ** 18 + varg1) ** 2 / 27 * v28 / v28 == (10 ** 18 + varg1) ** 2 / 27) | !v28) & (((10 ** 18 + varg1) ** 2 / 27 != int256.min) | bool(~v28)));
                v31 = (10 ** 18 + varg1) ** 2 / 27 * v28 / MEM[1696];
            } else {
                v32 = v33 = v16 / 0x722112107720a4902cd0097b425ed;
                if (v33 <= uint256.max) {
                    require(v33 != 0 - v33);
                    v32 = v34 = 0 - v33;
                }
                require(v32);
                require((v32 != uint256.max) | (0x722112107720a4902cd0097b425ed != int256.min));
                v35 = (10 ** 18 + varg1) ** 2 / 27 / v32 / MEM[1696];
            }
            require(((3 * MEM[1536] * MEM[1600] / MEM[1600] == 3 * MEM[1536]) | !MEM[1600]) & ((3 * MEM[1536] != int256.min) | bool(~MEM[1600])));
            v36 = 3 * MEM[1536] * MEM[1600] / MEM[1568] - MEM[1568];
            require(!((MEM[1568] < 0) ^ (v36 > 3 * MEM[1536] * MEM[1600] / MEM[1568])));
            require(!(3 * MEM[1536] * MEM[1600] * 3 / 3 ^ 3 * MEM[1536] * MEM[1600]));
            require(!((MEM[1568] << 1 < 0) ^ (3 * MEM[1536] * MEM[1600] * 3 / MEM[1568] - (MEM[1568] << 1) > 3 * MEM[1536] * MEM[1600] * 3 / MEM[1568])));
            require((MEM[1536] > 0xffffffffffffffffffffffffffffffff4afb0ccc06219b7ba682764c8ab54160) & (MEM[1536] < 0xb504f333f9de6484597d89b3754abea0));
            require(!(MEM[1536] ** 2 * 27 / 27 ^ MEM[1536] ** 2));
            require(((MEM[1536] ** 2 * 27 / MEM[1568] * MEM[1632] / MEM[1632] == MEM[1536] ** 2 * 27 / MEM[1568]) | !MEM[1632]) & ((MEM[1536] ** 2 * 27 / MEM[1568] != int256.min) | bool(~MEM[1632])));
            v37 = 3 * MEM[1536] * MEM[1600] * 3 / MEM[1568] - (MEM[1568] << 1) - MEM[1536] ** 2 * 27 / MEM[1568] * MEM[1632] / MEM[1568];
            require(!((MEM[1536] ** 2 * 27 / MEM[1568] * MEM[1632] / MEM[1568] < 0) ^ (v37 > 3 * MEM[1536] * MEM[1600] * 3 / MEM[1568] - (MEM[1568] << 1))));
            require((v37 > 0xffffffffffffffffffffffffffffffff4afb0ccc06219b7ba682764c8ab54160) & (v37 < 0xb504f333f9de6484597d89b3754abea0));
            require((v36 > 0xffffffffffffffffffffffffffffffff4afb0ccc06219b7ba682764c8ab54160) & (v36 < 0xb504f333f9de6484597d89b3754abea0));
            require(!((v36 ** 2 << 2) / 4 ^ v36 ** 2));
            require((((v36 ** 2 << 2) / MEM[1568] * v36 / v36 == (v36 ** 2 << 2) / MEM[1568]) | !v36) & (((v36 ** 2 << 2) / MEM[1568] != int256.min) | bool(~v36)));
            v38 = v37 ** 2 + (v36 ** 2 << 2) / MEM[1568] * v36;
            require(!(((v36 ** 2 << 2) / MEM[1568] * v36 < 0) ^ (v38 < v37 ** 2)));
            if (v38 >= 1) {
                require(v39 >= 0);
                v40 = v41 = 181;
                if (v39 >= uint136.max + 1) {
                    v42 = v43 = v39 >> 128;
                    v40 = v44 = 0xb50000000000000000;
                }
                if (v42 >= uint72.max + 1) {
                    v42 = v45 = v42 >> 64;
                    v40 = v46 = v40 << 32;
                }
                if (v42 >= uint40.max + 1) {
                    v42 = v47 = v42 >> 32;
                    v40 = v48 = v40 << 16;
                }
                if (v42 >= uint24.max + 1) {
                    v42 = v49 = v42 >> 16;
                    v40 = v50 = v40 << 8;
                }
                v51 = v39 / (v40 * (v42 + (uint16.max + 1)) >> 18) + (v40 * (v42 + (uint16.max + 1)) >> 18) >> 1;
                v52 = v39 / (v39 / (v39 / v51 + v51 >> 1) + (v39 / v51 + v51 >> 1) >> 1) + (v39 / (v39 / v51 + v51 >> 1) + (v39 / v51 + v51 >> 1) >> 1) >> 1;
                v53 = v39 / (v39 / (v39 / v52 + v52 >> 1) + (v39 / v52 + v52 >> 1) >> 1) + (v39 / (v39 / v52 + v52 >> 1) + (v39 / v52 + v52 >> 1) >> 1) >> 1;
                v54 = (v53 < v39 / v53) * (v39 / v53 ^ v53) ^ v39 / v53;
                require(!(v54 >> uint8.max));
                MEM[1920] = 0;
                if (MEM[1568] >= 0) {
                    require(MEM[1568] >= 0);
                    MEM[224] = 0;
                    if (MEM[1568] >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                        MEM[224] = MEM[1568];
                    } else if (MEM[1568] >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                        MEM[224] = MEM[1568] * 10 ** 18;
                    } else {
                        MEM[224] = MEM[1568] * 10 ** 36;
                    }
                    MEM[128] = MEM[64];
                    MEM[160] = 0;
                    if (MEM[64] >> 128) {
                        MEM[128] = MEM[64] >> 128;
                        MEM[160] = 128;
                    }
                    if (MEM[128] >> 64) {
                        MEM[128] = MEM[128] >> 64;
                        MEM[160] = MEM[160] + 64;
                    }
                    if (MEM[128] >> 32) {
                        MEM[128] = MEM[128] >> 32;
                        MEM[160] = MEM[160] + 32;
                    }
                    if (MEM[128] >> 16) {
                        MEM[128] = MEM[128] >> 16;
                        MEM[160] = MEM[160] + 16;
                    }
                    if (MEM[128] >> 8) {
                        MEM[128] = MEM[128] >> 8;
                        MEM[160] = MEM[160] + 8;
                    }
                    if (MEM[128] >> 4) {
                        MEM[128] = MEM[128] >> 4;
                        MEM[160] = MEM[160] + 4;
                    }
                    if (MEM[128] >> 2) {
                        MEM[128] = MEM[128] >> 2;
                        MEM[160] = MEM[160] + 2;
                    }
                    if (MEM[128] >> 1) {
                        MEM[160] = MEM[160] + 1;
                    }
                    if (0) {
                        v55 = v56 = 1 << MEM[160] < MEM[64];
                    } else {
                        v55 = v57 = 0;
                    }
                    if (v55) {
                        MEM[160] = MEM[160] + 1;
                    }
                    require(!(MEM[160] >> uint8.max));
                    require(MEM[160] >= 0);
                    require(MEM[160] >= 0);
                    v58 = 2 ** (MEM[160] / 3) * 1260 ** (MEM[160] % 3) / 1000 ** (MEM[160] % 3);
                    v59 = ((v58 << 1) + MEM[224] / (v58 * v58)) / 3;
                    v60 = ((v59 << 1) + MEM[224] / (v59 * v59)) / 3;
                    v61 = ((v60 << 1) + MEM[224] / (v60 * v60)) / 3;
                    v62 = ((v61 << 1) + MEM[224] / (v61 * v61)) / 3;
                    v63 = ((v62 << 1) + MEM[224] / (v62 * v62)) / 3;
                    v64 = ((v63 << 1) + MEM[224] / (v63 * v63)) / 3;
                    if (MEM[1568] >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                        MEM[320] = ((v64 << 1) + MEM[224] / (v64 * v64)) / 3 * 10 ** 12;
                    } else if (MEM[1568] >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                        MEM[320] = ((v64 << 1) + MEM[224] / (v64 * v64)) / 3 * 10 ** 6;
                    }
                    require(!(MEM[320] >> uint8.max));
                    MEM[1920] = MEM[320];
                } else {
                    require(MEM[1568] != int256.min);
                    require(0 - MEM[1568] >= 0);
                    MEM[224] = 0;
                    if (0 - MEM[1568] >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                        MEM[224] = 0 - MEM[1568];
                    } else if (0 - MEM[1568] >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                        MEM[224] = (0 - MEM[1568]) * 10 ** 18;
                    } else {
                        MEM[224] = (0 - MEM[1568]) * 10 ** 36;
                    }
                    MEM[128] = MEM[64];
                    MEM[160] = 0;
                    if (MEM[64] >> 128) {
                        MEM[128] = MEM[64] >> 128;
                        MEM[160] = 128;
                    }
                    if (MEM[128] >> 64) {
                        MEM[128] = MEM[128] >> 64;
                        MEM[160] = MEM[160] + 64;
                    }
                    if (MEM[128] >> 32) {
                        MEM[128] = MEM[128] >> 32;
                        MEM[160] = MEM[160] + 32;
                    }
                    if (MEM[128] >> 16) {
                        MEM[128] = MEM[128] >> 16;
                        MEM[160] = MEM[160] + 16;
                    }
                    if (MEM[128] >> 8) {
                        MEM[128] = MEM[128] >> 8;
                        MEM[160] = MEM[160] + 8;
                    }
                    if (MEM[128] >> 4) {
                        MEM[128] = MEM[128] >> 4;
                        MEM[160] = MEM[160] + 4;
                    }
                    if (MEM[128] >> 2) {
                        MEM[128] = MEM[128] >> 2;
                        MEM[160] = MEM[160] + 2;
                    }
                    if (MEM[128] >> 1) {
                        MEM[160] = MEM[160] + 1;
                    }
                    if (0) {
                        v65 = v66 = 1 << MEM[160] < MEM[64];
                    } else {
                        v65 = v67 = 0;
                    }
                    if (v65) {
                        MEM[160] = MEM[160] + 1;
                    }
                    require(!(MEM[160] >> uint8.max));
                    require(MEM[160] >= 0);
                    require(MEM[160] >= 0);
                    v68 = 2 ** (MEM[160] / 3) * 1260 ** (MEM[160] % 3) / 1000 ** (MEM[160] % 3);
                    v69 = ((v68 << 1) + MEM[224] / (v68 * v68)) / 3;
                    v70 = ((v69 << 1) + MEM[224] / (v69 * v69)) / 3;
                    v71 = ((v70 << 1) + MEM[224] / (v70 * v70)) / 3;
                    v72 = ((v71 << 1) + MEM[224] / (v71 * v71)) / 3;
                    v73 = ((v72 << 1) + MEM[224] / (v72 * v72)) / 3;
                    v74 = ((v73 << 1) + MEM[224] / (v73 * v73)) / 3;
                    if (0 - MEM[1568] >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                        MEM[320] = ((v74 << 1) + MEM[224] / (v74 * v74)) / 3 * 10 ** 12;
                    } else if (0 - MEM[1568] >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                        MEM[320] = ((v74 << 1) + MEM[224] / (v74 * v74)) / 3 * 10 ** 6;
                    }
                    require(!(MEM[320] >> uint8.max));
                    require(MEM[320] != int256.min);
                    MEM[1920] = 0 - MEM[320];
                }
                MEM[1952] = 0;
                if (v37 >= 1) {
                    require(!((v54 < 0) ^ (v37 + v54 < v37)));
                    require(v37 + v54 >= 0);
                    v75 = v37 + v54 >> 1;
                    MEM[224] = 0;
                    if (v75 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                        MEM[224] = v75;
                    } else if (v75 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                        MEM[224] = v75 * 10 ** 18;
                    } else {
                        MEM[224] = v75 * 10 ** 36;
                    }
                    MEM[128] = MEM[64];
                    MEM[160] = 0;
                    if (MEM[64] >> 128) {
                        MEM[128] = MEM[64] >> 128;
                        MEM[160] = 128;
                    }
                    if (MEM[128] >> 64) {
                        MEM[128] = MEM[128] >> 64;
                        MEM[160] = MEM[160] + 64;
                    }
                    if (MEM[128] >> 32) {
                        MEM[128] = MEM[128] >> 32;
                        MEM[160] = MEM[160] + 32;
                    }
                    if (MEM[128] >> 16) {
                        MEM[128] = MEM[128] >> 16;
                        MEM[160] = MEM[160] + 16;
                    }
                    if (MEM[128] >> 8) {
                        MEM[128] = MEM[128] >> 8;
                        MEM[160] = MEM[160] + 8;
                    }
                    if (MEM[128] >> 4) {
                        MEM[128] = MEM[128] >> 4;
                        MEM[160] = MEM[160] + 4;
                    }
                    if (MEM[128] >> 2) {
                        MEM[128] = MEM[128] >> 2;
                        MEM[160] = MEM[160] + 2;
                    }
                    if (MEM[128] >> 1) {
                        MEM[160] = MEM[160] + 1;
                    }
                    if (0) {
                        v76 = v77 = 1 << MEM[160] < MEM[64];
                    } else {
                        v76 = v78 = 0;
                    }
                    if (v76) {
                        MEM[160] = MEM[160] + 1;
                    }
                    require(!(MEM[160] >> uint8.max));
                    require(MEM[160] >= 0);
                    require(MEM[160] >= 0);
                    v79 = 2 ** (MEM[160] / 3) * 1260 ** (MEM[160] % 3) / 1000 ** (MEM[160] % 3);
                    v80 = ((v79 << 1) + MEM[224] / (v79 * v79)) / 3;
                    v81 = ((v80 << 1) + MEM[224] / (v80 * v80)) / 3;
                    v82 = ((v81 << 1) + MEM[224] / (v81 * v81)) / 3;
                    v83 = ((v82 << 1) + MEM[224] / (v82 * v82)) / 3;
                    v84 = ((v83 << 1) + MEM[224] / (v83 * v83)) / 3;
                    v85 = ((v84 << 1) + MEM[224] / (v84 * v84)) / 3;
                    if (v75 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                        MEM[320] = ((v85 << 1) + MEM[224] / (v85 * v85)) / 3 * 10 ** 12;
                    } else if (v75 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                        MEM[320] = ((v85 << 1) + MEM[224] / (v85 * v85)) / 3 * 10 ** 6;
                    }
                    require(!(MEM[320] >> uint8.max));
                    MEM[1952] = MEM[320];
                } else {
                    require(!((v54 < 0) ^ (v37 - v54 > v37)));
                    require(v37 - v54 != int256.min);
                    require(0 - (v37 - v54) >= 0);
                    v86 = 0 - (v37 - v54) >> 1;
                    MEM[224] = 0;
                    if (v86 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                        MEM[224] = v86;
                    } else if (v86 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                        MEM[224] = v86 * 10 ** 18;
                    } else {
                        MEM[224] = v86 * 10 ** 36;
                    }
                    MEM[128] = MEM[64];
                    MEM[160] = 0;
                    if (MEM[64] >> 128) {
                        MEM[128] = MEM[64] >> 128;
                        MEM[160] = 128;
                    }
                    if (MEM[128] >> 64) {
                        MEM[128] = MEM[128] >> 64;
                        MEM[160] = MEM[160] + 64;
                    }
                    if (MEM[128] >> 32) {
                        MEM[128] = MEM[128] >> 32;
                        MEM[160] = MEM[160] + 32;
                    }
                    if (MEM[128] >> 16) {
                        MEM[128] = MEM[128] >> 16;
                        MEM[160] = MEM[160] + 16;
                    }
                    if (MEM[128] >> 8) {
                        MEM[128] = MEM[128] >> 8;
                        MEM[160] = MEM[160] + 8;
                    }
                    if (MEM[128] >> 4) {
                        MEM[128] = MEM[128] >> 4;
                        MEM[160] = MEM[160] + 4;
                    }
                    if (MEM[128] >> 2) {
                        MEM[128] = MEM[128] >> 2;
                        MEM[160] = MEM[160] + 2;
                    }
                    if (MEM[128] >> 1) {
                        MEM[160] = MEM[160] + 1;
                    }
                    if (0) {
                        v87 = v88 = 1 << MEM[160] < MEM[64];
                    } else {
                        v87 = v89 = 0;
                    }
                    if (v87) {
                        MEM[160] = MEM[160] + 1;
                    }
                    require(!(MEM[160] >> uint8.max));
                    require(MEM[160] >= 0);
                    require(MEM[160] >= 0);
                    v90 = 2 ** (MEM[160] / 3) * 1260 ** (MEM[160] % 3) / 1000 ** (MEM[160] % 3);
                    v91 = ((v90 << 1) + MEM[224] / (v90 * v90)) / 3;
                    v92 = ((v91 << 1) + MEM[224] / (v91 * v91)) / 3;
                    v93 = ((v92 << 1) + MEM[224] / (v92 * v92)) / 3;
                    v94 = ((v93 << 1) + MEM[224] / (v93 * v93)) / 3;
                    v95 = ((v94 << 1) + MEM[224] / (v94 * v94)) / 3;
                    v96 = ((v95 << 1) + MEM[224] / (v95 * v95)) / 3;
                    if (v86 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                        MEM[320] = ((v96 << 1) + MEM[224] / (v96 * v96)) / 3 * 10 ** 12;
                    } else if (v86 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                        MEM[320] = ((v96 << 1) + MEM[224] / (v96 * v96)) / 3 * 10 ** 6;
                    }
                    require(!(MEM[320] >> uint8.max));
                    require(MEM[320] != int256.min);
                    MEM[1952] = 0 - MEM[320];
                }
                require(((MEM[1920] * MEM[1920] / MEM[1920] == MEM[1920]) | !MEM[1920]) & ((MEM[1920] != int256.min) | bool(~MEM[1920])));
                require(((MEM[1920] * MEM[1920] / 10 ** 18 * MEM[1952] / MEM[1952] == MEM[1920] * MEM[1920] / 10 ** 18) | !MEM[1952]) & ((MEM[1920] * MEM[1920] / 10 ** 18 != int256.min) | bool(~MEM[1952])));
                require(((MEM[1568] * v36 / v36 == MEM[1568]) | !v36) & ((MEM[1568] != int256.min) | bool(~v36)));
                require(MEM[1920] * MEM[1920] / 10 ** 18 * MEM[1952] / 10 ** 18);
                require((MEM[1920] * MEM[1920] / 10 ** 18 * MEM[1952] / 10 ** 18 != uint256.max) | (MEM[1568] * v36 != int256.min));
                v97 = MEM[1568] + MEM[1568] * v36 / (MEM[1920] * MEM[1920] / 10 ** 18 * MEM[1952] / 10 ** 18);
                require(!((MEM[1568] * v36 / (MEM[1920] * MEM[1920] / 10 ** 18 * MEM[1952] / 10 ** 18) < 0) ^ (v97 < MEM[1568])));
                require(!((MEM[1920] * MEM[1920] / 10 ** 18 * MEM[1952] / 10 ** 18 < 0) ^ (v97 - MEM[1920] * MEM[1920] / 10 ** 18 * MEM[1952] / 10 ** 18 > v97)));
                require(((varg2 * varg2 / varg2 == varg2) | !varg2) & ((varg2 != int256.min) | bool(~varg2)));
                require(((varg2 * varg2 / 27 / msg.data[68 + (MEM[1312] << 5)] * varg2 / varg2 == varg2 * varg2 / 27 / msg.data[68 + (MEM[1312] << 5)]) | !varg2) & ((varg2 * varg2 / 27 / msg.data[68 + (MEM[1312] << 5)] != int256.min) | bool(~varg2)));
                v98 = varg2 * varg2 / 27 / msg.data[68 + (MEM[1312] << 5)] * varg2 / msg.data[68 + (MEM[1280] << 5)];
                require(((v98 * v99 / v99 == v98) | !v99) & ((v98 != int256.min) | bool(~v99)));
                require(v98 * v99 / MEM[1536] >= 0);
                require(!((v97 - MEM[1920] * MEM[1920] / 10 ** 18 * MEM[1952] / 10 ** 18) / 3 * 10 ** 18 / 10 ** 18 ^ (v97 - MEM[1920] * MEM[1920] / 10 ** 18 * MEM[1952] / 10 ** 18) / 3));
                require((v97 - MEM[1920] * MEM[1920] / 10 ** 18 * MEM[1952] / 10 ** 18) / 3 * 10 ** 18 / MEM[1536] >= 0);
                MEM[2112] = (v97 - MEM[1920] * MEM[1920] / 10 ** 18 * MEM[1952] / 10 ** 18) / 3 * 10 ** 18 / MEM[1536];
                require(!(v98 * v99 / MEM[1536] * 10 ** 18 / 10 ** 18 ^ v98 * v99 / MEM[1536]));
                if (v98 * v99 / MEM[1536] * 10 ** 18 / varg2 >= 0x2386f26fc0ffff) {
                    v100 = v101 = v98 * v99 / MEM[1536] * 10 ** 18 / varg2 <= 10 ** 20;
                } else {
                    v100 = v102 = 0;
                }
                if (v100) {
                    v103 = v104 = 64;
                    v105 = v106 = 2080;
                } else {
                    CALLDATACOPY(2194, msg.data.length, 14);
                    revert(Error(32, 18, 'Unsafe value for y'));
                }
            } else {
                CALLDATACOPY(288, 4, 64);
                CALLDATACOPY(352, 68, 96);
                CALLDATACOPY(448, 164, 64);
                MEM[512] = 0;
                v107 = v108 = 0;
                while (1) {
                    if (v107 != MEM[480]) {
                        require(v107 <= 2);
                        require(!(MEM[352 + (v107 << 5)] * 10 ** 18 / 10 ** 18 ^ MEM[352 + (v107 << 5)]));
                        require(MEM[448]);
                        if (MEM[352 + (v107 << 5)] * 10 ** 18 / MEM[448] >= 10 ** 16) {
                            v109 = v110 = MEM[352 + (v107 << 5)] * 10 ** 18 / MEM[448] <= 10 ** 20;
                        } else {
                            v109 = v111 = 0;
                        }
                        if (!v109) {
                            CALLDATACOPY(626, msg.data.length, 14);
                            revert(Error(32, 18, 'Unsafe values x[i]', v112, v112, v112, v112, v112, v112, v112, v112, v112, v112, v112, v112, v112, v112, v112, v112, v112, v112, v112, v11, 1, 0, 0, 2, 2, 1, varg0, varg1, varg2, msg.data[68 + (MEM[1280] << 5)], msg.data[68 + (MEM[1312] << 5)], varg1 * varg1, 0x722112107720a4902cd0097b425ed / v32 / MEM[1696], 0x722112107720a4902cd0097b425ed * v28 / MEM[1696], v16 / v32 / MEM[1696], v16 * v28 / MEM[1696], v18 / v32 / MEM[1696], v18 * v28 / MEM[1696], v35, v31, v19, 1, 100, 10 ** 6, 10 ** 10, 10 ** 14, 10 ** 18, 10 ** 22, 10 ** 26, 10 ** 30, v32, v28, 3 * MEM[1536] * MEM[1600], v36, v37, v38, 0));
                        }
                    }
                    v107 += 1;
                    if (!(v107 ^ 0x3)) {
                        require(MEM[480] <= 2);
                        MEM[640 + (MEM[480] << 5)] = 0;
                        if (MEM[64] < MEM[384]) {
                            MEM[160] = MEM[384];
                            MEM[192] = MEM[64];
                        }
                        if (MEM[160] < MEM[416]) {
                            MEM[160] = MEM[416];
                            MEM[224] = MEM[160];
                        }
                        if (MEM[192] < MEM[224]) {
                            MEM[192] = MEM[224];
                            MEM[224] = MEM[192];
                        }
                        MEM[672] = MEM[192];
                        MEM[704] = MEM[224];
                        v113 = ((MEM[160] / 10 ** 14 > MEM[448] / 10 ** 14) * (MEM[448] / 10 ** 14 ^ MEM[160] / 10 ** 14) ^ MEM[448] / 10 ** 14 > 100) * (0x64 ^ ((MEM[160] / 10 ** 14 > MEM[448] / 10 ** 14) * (MEM[448] / 10 ** 14 ^ MEM[160] / 10 ** 14) ^ MEM[448] / 10 ** 14)) ^ 0x64;
                        v114 = v115 = 2;
                        while (1) {
                            require(3 - v114 <= 3);
                            require(3 - v114 <= 2);
                            require((MEM[448] / 3 * MEM[448] / MEM[448] == MEM[448] / 3) | !MEM[448]);
                            require(!(MEM[640 + (3 - v114 << 5)] * 3 / 3 ^ MEM[640 + (3 - v114 << 5)]));
                            require(MEM[640 + (3 - v114 << 5)] * 3);
                            v116 = MEM[448] / 3 * MEM[448] / (MEM[640 + (3 - v114 << 5)] * 3);
                            require(MEM[640 + (3 - v114 << 5)] >= 0);
                            v114 += 1;
                            if (!(v114 ^ 0x4)) {
                                v117 = v118 = 0;
                                while (1) {
                                    require(v117 <= 2);
                                    require((10 ** 18 * MEM[640 + (v117 << 5)] / MEM[640 + (v117 << 5)] == 10 ** 18) | !MEM[640 + (v117 << 5)]);
                                    require(!(10 ** 18 * MEM[640 + (v117 << 5)] * 3 / 3 ^ 10 ** 18 * MEM[640 + (v117 << 5)]));
                                    require(MEM[448]);
                                    v117 += 1;
                                    if (!(v117 ^ 0x2)) {
                                        CALLDATACOPY(768, msg.data.length, 384);
                                        v119 = 0;
                                        while (1) {
                                            MEM[1152] = v119;
                                            require((10 ** 18 * MEM[640 + (v117 << 5)] * 3 / MEM[448] * v116 / v116 == 10 ** 18 * MEM[640 + (v117 << 5)] * 3 / MEM[448]) | !v116);
                                            require(!(10 ** 18 * MEM[640 + (v117 << 5)] * 3 / MEM[448] * v116 * 3 / 3 ^ 10 ** 18 * MEM[640 + (v117 << 5)] * 3 / MEM[448] * v116));
                                            require(MEM[448]);
                                            v120 = 10 ** 18 * MEM[640 + (v117 << 5)] * 3 / MEM[448] * v116 * 3 / MEM[448];
                                            v121 = MEM[640 + (3 - v114 << 5)] + v116;
                                            require(v121 >= MEM[640 + (3 - v114 << 5)]);
                                            require(MEM[320] + 10 ** 18 >= MEM[320]);
                                            if (MEM[320] + 10 ** 18 > v120) {
                                                require(MEM[896] - v120 <= MEM[896]);
                                                require(MEM[896] - v120 + 1 >= MEM[896] - v120);
                                                MEM[896] = MEM[896] - v120 + 1;
                                            } else {
                                                require(v120 - MEM[896] <= v120);
                                                require(v120 - MEM[896] + 1 >= v120 - MEM[896]);
                                                MEM[896] = v120 - MEM[896] + 1;
                                            }
                                            require(!(MEM[448] * 10 ** 18 / 10 ** 18 ^ MEM[448]));
                                            require(MEM[320]);
                                            require((MEM[448] * 10 ** 18 / MEM[320] * MEM[896] / MEM[896] == MEM[448] * 10 ** 18 / MEM[320]) | !MEM[896]);
                                            require(MEM[320]);
                                            require((MEM[448] * 10 ** 18 / MEM[320] * MEM[896] / MEM[320] * MEM[896] / MEM[896] == MEM[448] * 10 ** 18 / MEM[320] * MEM[896] / MEM[320]) | !MEM[896]);
                                            require(!(MEM[448] * 10 ** 18 / MEM[320] * MEM[896] / MEM[320] * MEM[896] * 10000 / 10000 ^ MEM[448] * 10 ** 18 / MEM[320] * MEM[896] / MEM[320] * MEM[896]));
                                            require(MEM[288]);
                                            require(!(v120 * 0x1bc16d674ec80000 / 0x1bc16d674ec80000 ^ v120));
                                            require(MEM[896]);
                                            require(10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896] >= 10 ** 18);
                                            require(!(v116 * 10 ** 18 / 10 ** 18 ^ v116));
                                            require((v121 * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896]) / (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896]) == v121) | !(10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896]));
                                            require(v116 * 10 ** 18 + v121 * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896]) >= v116 * 10 ** 18);
                                            v122 = v116 * 10 ** 18 + v121 * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896]) + MEM[448] * 10 ** 18 / MEM[320] * MEM[896] / MEM[320] * MEM[896] * 10000 / MEM[288];
                                            require(v122 >= v116 * 10 ** 18 + v121 * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896]));
                                            require((MEM[448] * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896]) / (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896]) == MEM[448]) | !(10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896]));
                                            if (v122 < MEM[448] * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896])) {
                                                MEM[544] = v116 >> 1;
                                            } else {
                                                require(v122 - MEM[448] * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896]) <= v122);
                                                require(MEM[544]);
                                                require((v122 - MEM[448] * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896])) / MEM[544]);
                                                v123 = MEM[448] * 10 ** 18 / MEM[320] * MEM[896] / MEM[320] * MEM[896] * 10000 / MEM[288] / ((v122 - MEM[448] * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896])) / MEM[544]);
                                                require(!(MEM[448] * 10 ** 18 / 10 ** 18 ^ MEM[448]));
                                                require(v122 - MEM[448] * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896]) + MEM[448] * 10 ** 18 >= v122 - MEM[448] * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896]));
                                                require((v122 - MEM[448] * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896])) / MEM[544]);
                                                require(!(v123 * 10 ** 18 / 10 ** 18 ^ v123));
                                                require(v120);
                                                v124 = (v122 - MEM[448] * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896]) + MEM[448] * 10 ** 18) / ((v122 - MEM[448] * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896])) / MEM[544]) + v123 * 10 ** 18 / v120;
                                                require(v124 >= (v122 - MEM[448] * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896]) + MEM[448] * 10 ** 18) / ((v122 - MEM[448] * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896])) / MEM[544]));
                                                require(!(v121 * 10 ** 18 / 10 ** 18 ^ v121));
                                                require((v122 - MEM[448] * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896])) / MEM[544]);
                                                v125 = v123 + v121 * 10 ** 18 / ((v122 - MEM[448] * (10 ** 18 + v120 * 0x1bc16d674ec80000 / MEM[896])) / MEM[544]);
                                                require(v125 >= v123);
                                                if (v124 < v125) {
                                                    MEM[544] = v116 >> 1;
                                                } else {
                                                    require(v124 - v125 <= v124);
                                                    MEM[544] = v124 - v125;
                                                }
                                                if (MEM[544] > v116) {
                                                    require(MEM[544] - v116 <= MEM[544]);
                                                    MEM[768] = MEM[544] - v116;
                                                } else {
                                                    require(v116 - MEM[544] <= v116);
                                                    MEM[768] = v116 - MEM[544];
                                                }
                                                if (MEM[768] < (v113 > MEM[544] / 10 ** 14) * (MEM[544] / 10 ** 14 ^ v113) ^ MEM[544] / 10 ** 14) {
                                                    require(!(MEM[544] * 10 ** 18 / 10 ** 18 ^ MEM[544]));
                                                    require(MEM[448]);
                                                    if (MEM[544] * 10 ** 18 / MEM[448] >= 10 ** 16) {
                                                        v126 = v127 = MEM[544] * 10 ** 18 / MEM[448] <= 10 ** 20;
                                                    } else {
                                                        v126 = v128 = 0;
                                                    }
                                                    if (v126) {
                                                        MEM[1952] = MEM[544];
                                                        MEM[1984] = 0;
                                                        v103 = v129 = 64;
                                                        v105 = v130 = 1952;
                                                    } else {
                                                        CALLDATACOPY(1234, msg.data.length, 14);
                                                        revert(Error(32, 18, 'Unsafe value for y', v11, 1, 0, 0, 2, 2, 1, varg0, varg1, varg2, msg.data[68 + (MEM[1280] << 5)], msg.data[68 + (MEM[1312] << 5)], varg1 * varg1, 0x722112107720a4902cd0097b425ed / v32 / MEM[1696], 0x722112107720a4902cd0097b425ed * v28 / MEM[1696], v16 / v32 / MEM[1696], v16 * v28 / MEM[1696], v18 / v32 / MEM[1696], v18 * v28 / MEM[1696], v35, v31, v19, 1, 100, 10 ** 6, 10 ** 10, 10 ** 14, 10 ** 18, 10 ** 22, 10 ** 26, 10 ** 30, v32, v28, 3 * MEM[1536] * MEM[1600], v36, v37, v38, 0));
                                                    }
                                                }
                                            }
                                            v119 += 1;
                                            if (!(v119 ^ 0xff)) {
                                                CALLDATACOPY(1200, msg.data.length, 16);
                                                revert(Error(32, 16, 'Did not converge', v112, v11, 1, 0, 0, 2, 2, 1, varg0, varg1, varg2, msg.data[68 + (MEM[1280] << 5)], msg.data[68 + (MEM[1312] << 5)], varg1 * varg1, 0x722112107720a4902cd0097b425ed / v32 / MEM[1696], 0x722112107720a4902cd0097b425ed * v28 / MEM[1696], v16 / v32 / MEM[1696], v16 * v28 / MEM[1696], v18 / v32 / MEM[1696], v18 * v28 / MEM[1696], v35, v31, v19, 1, 100, 10 ** 6, 10 ** 10, 10 ** 14, 10 ** 18, 10 ** 22, 10 ** 26, 10 ** 30, v32, v28, 3 * MEM[1536] * MEM[1600], v36, v37, v38, 0));
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return MEM[vff5_0x0:vff5_0x0 + vff5_0x1];
        }
    }
}

function newton_D(uint256 varg0, uint256 varg1) public payable {  find similar
    require(msg.data.length >= 164);
    CALLDATACOPY(64, 68, 96);
    if (MEM[64] < MEM[96]) {
        MEM[160] = MEM[96];
        MEM[192] = MEM[64];
    }
    if (MEM[160] < MEM[128]) {
        MEM[160] = MEM[128];
        MEM[224] = MEM[160];
    }
    if (MEM[192] < MEM[224]) {
        MEM[192] = MEM[224];
        MEM[224] = MEM[192];
    }
    require(MEM[160] <= 0x1f20fe5212d2319f8671d495c8ba43b5b4b98d506d374fd487a);
    require(MEM[160]);
    v0 = MEM[160] + MEM[192] + MEM[224];
    MEM[672] = 0;
    if (0) {
        if (v0 >= 0xc097ce7bc90715b34b9f1000000001) {
            require((MEM[160] * MEM[192] / MEM[192] == MEM[160]) | !MEM[192]);
            require((MEM[160] * MEM[192] / 10 ** 36 * MEM[224] / MEM[224] == MEM[160] * MEM[192] / 10 ** 36) | !MEM[224]);
            v1 = MEM[160] * MEM[192] / 10 ** 36 * MEM[224] / 0 * 27;
            require(!(v1 / 27 ^ MEM[160] * MEM[192] / 10 ** 36 * MEM[224] / 0));
            require(!(v1 * 10 ** 12 / 10 ** 12 ^ v1));
            MEM[224] = 0;
            if (v1 * 10 ** 12 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                MEM[224] = v1 * 10 ** 12;
            } else if (v1 * 10 ** 12 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                MEM[224] = v1 * 10 ** 12 * 10 ** 18;
            } else {
                MEM[224] = v1 * 10 ** 12 * 10 ** 36;
            }
            MEM[128] = MEM[64];
            MEM[160] = 0;
            if (MEM[64] >> 128) {
                MEM[128] = MEM[64] >> 128;
                MEM[160] = 128;
            }
            if (MEM[128] >> 64) {
                MEM[128] = MEM[128] >> 64;
                MEM[160] = MEM[160] + 64;
            }
            if (MEM[128] >> 32) {
                MEM[128] = MEM[128] >> 32;
                MEM[160] = MEM[160] + 32;
            }
            if (MEM[128] >> 16) {
                MEM[128] = MEM[128] >> 16;
                MEM[160] = MEM[160] + 16;
            }
            if (MEM[128] >> 8) {
                MEM[128] = MEM[128] >> 8;
                MEM[160] = MEM[160] + 8;
            }
            if (MEM[128] >> 4) {
                MEM[128] = MEM[128] >> 4;
                MEM[160] = MEM[160] + 4;
            }
            if (MEM[128] >> 2) {
                MEM[128] = MEM[128] >> 2;
                MEM[160] = MEM[160] + 2;
            }
            if (MEM[128] >> 1) {
                MEM[160] = MEM[160] + 1;
            }
            if (0) {
                v2 = v3 = 1 << MEM[160] < MEM[64];
            } else {
                v2 = v4 = 0;
            }
            if (v2) {
                MEM[160] = MEM[160] + 1;
            }
            require(!(MEM[160] >> uint8.max));
            require(MEM[160] >= 0);
            require(MEM[160] >= 0);
            v5 = 2 ** (MEM[160] / 3) * 1260 ** (MEM[160] % 3) / 1000 ** (MEM[160] % 3);
            v6 = ((v5 << 1) + MEM[224] / (v5 * v5)) / 3;
            v7 = ((v6 << 1) + MEM[224] / (v6 * v6)) / 3;
            v8 = ((v7 << 1) + MEM[224] / (v7 * v7)) / 3;
            v9 = ((v8 << 1) + MEM[224] / (v8 * v8)) / 3;
            v10 = ((v9 << 1) + MEM[224] / (v9 * v9)) / 3;
            v11 = ((v10 << 1) + MEM[224] / (v10 * v10)) / 3;
            if (v1 * 10 ** 12 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                MEM[320] = ((v11 << 1) + MEM[224] / (v11 * v11)) / 3 * 10 ** 12;
            } else if (v1 * 10 ** 12 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                MEM[320] = ((v11 << 1) + MEM[224] / (v11 * v11)) / 3 * 10 ** 6;
            }
            MEM[672] = MEM[320];
        } else if (v0 >= 0xd3c21bcecceda1000001) {
            require((MEM[160] * MEM[192] / MEM[192] == MEM[160]) | !MEM[192]);
            require((MEM[160] * MEM[192] / 10 ** 24 * MEM[224] / MEM[224] == MEM[160] * MEM[192] / 10 ** 24) | !MEM[224]);
            v12 = MEM[160] * MEM[192] / 10 ** 24 * MEM[224] / 0 * 27;
            require(!(v12 / 27 ^ MEM[160] * MEM[192] / 10 ** 24 * MEM[224] / 0));
            require(!(v12 * 10 ** 6 / 10 ** 6 ^ v12));
            MEM[224] = 0;
            if (v12 * 10 ** 6 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                MEM[224] = v12 * 10 ** 6;
            } else if (v12 * 10 ** 6 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                MEM[224] = v12 * 10 ** 6 * 10 ** 18;
            } else {
                MEM[224] = v12 * 10 ** 6 * 10 ** 36;
            }
            MEM[128] = MEM[64];
            MEM[160] = 0;
            if (MEM[64] >> 128) {
                MEM[128] = MEM[64] >> 128;
                MEM[160] = 128;
            }
            if (MEM[128] >> 64) {
                MEM[128] = MEM[128] >> 64;
                MEM[160] = MEM[160] + 64;
            }
            if (MEM[128] >> 32) {
                MEM[128] = MEM[128] >> 32;
                MEM[160] = MEM[160] + 32;
            }
            if (MEM[128] >> 16) {
                MEM[128] = MEM[128] >> 16;
                MEM[160] = MEM[160] + 16;
            }
            if (MEM[128] >> 8) {
                MEM[128] = MEM[128] >> 8;
                MEM[160] = MEM[160] + 8;
            }
            if (MEM[128] >> 4) {
                MEM[128] = MEM[128] >> 4;
                MEM[160] = MEM[160] + 4;
            }
            if (MEM[128] >> 2) {
                MEM[128] = MEM[128] >> 2;
                MEM[160] = MEM[160] + 2;
            }
            if (MEM[128] >> 1) {
                MEM[160] = MEM[160] + 1;
            }
            if (0) {
                v13 = v14 = 1 << MEM[160] < MEM[64];
            } else {
                v13 = v15 = 0;
            }
            if (v13) {
                MEM[160] = MEM[160] + 1;
            }
            require(!(MEM[160] >> uint8.max));
            require(MEM[160] >= 0);
            require(MEM[160] >= 0);
            v16 = 2 ** (MEM[160] / 3) * 1260 ** (MEM[160] % 3) / 1000 ** (MEM[160] % 3);
            v17 = ((v16 << 1) + MEM[224] / (v16 * v16)) / 3;
            v18 = ((v17 << 1) + MEM[224] / (v17 * v17)) / 3;
            v19 = ((v18 << 1) + MEM[224] / (v18 * v18)) / 3;
            v20 = ((v19 << 1) + MEM[224] / (v19 * v19)) / 3;
            v21 = ((v20 << 1) + MEM[224] / (v20 * v20)) / 3;
            v22 = ((v21 << 1) + MEM[224] / (v21 * v21)) / 3;
            if (v12 * 10 ** 6 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                MEM[320] = ((v22 << 1) + MEM[224] / (v22 * v22)) / 3 * 10 ** 12;
            } else if (v12 * 10 ** 6 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                MEM[320] = ((v22 << 1) + MEM[224] / (v22 * v22)) / 3 * 10 ** 6;
            }
            MEM[672] = MEM[320];
        } else {
            require((MEM[160] * MEM[192] / MEM[192] == MEM[160]) | !MEM[192]);
            require((MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / MEM[224] == MEM[160] * MEM[192] / 10 ** 18) | !MEM[224]);
            v23 = MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 0 * 27;
            require(!(v23 / 27 ^ MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 0));
            MEM[224] = 0;
            if (v23 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                MEM[224] = v23;
            } else if (v23 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                MEM[224] = v23 * 10 ** 18;
            } else {
                MEM[224] = v23 * 10 ** 36;
            }
            MEM[128] = MEM[64];
            MEM[160] = 0;
            if (MEM[64] >> 128) {
                MEM[128] = MEM[64] >> 128;
                MEM[160] = 128;
            }
            if (MEM[128] >> 64) {
                MEM[128] = MEM[128] >> 64;
                MEM[160] = MEM[160] + 64;
            }
            if (MEM[128] >> 32) {
                MEM[128] = MEM[128] >> 32;
                MEM[160] = MEM[160] + 32;
            }
            if (MEM[128] >> 16) {
                MEM[128] = MEM[128] >> 16;
                MEM[160] = MEM[160] + 16;
            }
            if (MEM[128] >> 8) {
                MEM[128] = MEM[128] >> 8;
                MEM[160] = MEM[160] + 8;
            }
            if (MEM[128] >> 4) {
                MEM[128] = MEM[128] >> 4;
                MEM[160] = MEM[160] + 4;
            }
            if (MEM[128] >> 2) {
                MEM[128] = MEM[128] >> 2;
                MEM[160] = MEM[160] + 2;
            }
            if (MEM[128] >> 1) {
                MEM[160] = MEM[160] + 1;
            }
            if (0) {
                v24 = v25 = 1 << MEM[160] < MEM[64];
            } else {
                v24 = v26 = 0;
            }
            if (v24) {
                MEM[160] = MEM[160] + 1;
            }
            require(!(MEM[160] >> uint8.max));
            require(MEM[160] >= 0);
            require(MEM[160] >= 0);
            v27 = 2 ** (MEM[160] / 3) * 1260 ** (MEM[160] % 3) / 1000 ** (MEM[160] % 3);
            v28 = ((v27 << 1) + MEM[224] / (v27 * v27)) / 3;
            v29 = ((v28 << 1) + MEM[224] / (v28 * v28)) / 3;
            v30 = ((v29 << 1) + MEM[224] / (v29 * v29)) / 3;
            v31 = ((v30 << 1) + MEM[224] / (v30 * v30)) / 3;
            v32 = ((v31 << 1) + MEM[224] / (v31 * v31)) / 3;
            v33 = ((v32 << 1) + MEM[224] / (v32 * v32)) / 3;
            if (v23 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                MEM[320] = ((v33 << 1) + MEM[224] / (v33 * v33)) / 3 * 10 ** 12;
            } else if (v23 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                MEM[320] = ((v33 << 1) + MEM[224] / (v33 * v33)) / 3 * 10 ** 6;
            }
            MEM[672] = MEM[320];
        }
    } else {
        require((MEM[160] * MEM[192] / MEM[192] == MEM[160]) | !MEM[192]);
        require((MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / MEM[224] == MEM[160] * MEM[192] / 10 ** 18) | !MEM[224]);
        if (MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 10 ** 18) {
            MEM[224] = 0;
            if (MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 10 ** 18 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                MEM[224] = MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 10 ** 18;
            } else if (MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 10 ** 18 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                MEM[224] = MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 10 ** 18 * 10 ** 18;
            } else {
                MEM[224] = MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 10 ** 18 * 10 ** 36;
            }
            MEM[128] = MEM[64];
            MEM[160] = 0;
            if (MEM[64] >> 128) {
                MEM[128] = MEM[64] >> 128;
                MEM[160] = 128;
            }
            if (MEM[128] >> 64) {
                MEM[128] = MEM[128] >> 64;
                MEM[160] = MEM[160] + 64;
            }
            if (MEM[128] >> 32) {
                MEM[128] = MEM[128] >> 32;
                MEM[160] = MEM[160] + 32;
            }
            if (MEM[128] >> 16) {
                MEM[128] = MEM[128] >> 16;
                MEM[160] = MEM[160] + 16;
            }
            if (MEM[128] >> 8) {
                MEM[128] = MEM[128] >> 8;
                MEM[160] = MEM[160] + 8;
            }
            if (MEM[128] >> 4) {
                MEM[128] = MEM[128] >> 4;
                MEM[160] = MEM[160] + 4;
            }
            if (MEM[128] >> 2) {
                MEM[128] = MEM[128] >> 2;
                MEM[160] = MEM[160] + 2;
            }
            if (MEM[128] >> 1) {
                MEM[160] = MEM[160] + 1;
            }
            if (0) {
                v34 = v35 = 1 << MEM[160] < MEM[64];
            } else {
                v34 = v36 = 0;
            }
            if (v34) {
                MEM[160] = MEM[160] + 1;
            }
            require(!(MEM[160] >> uint8.max));
            require(MEM[160] >= 0);
            require(MEM[160] >= 0);
            v37 = 2 ** (MEM[160] / 3) * 1260 ** (MEM[160] % 3) / 1000 ** (MEM[160] % 3);
            v38 = ((v37 << 1) + MEM[224] / (v37 * v37)) / 3;
            v39 = ((v38 << 1) + MEM[224] / (v38 * v38)) / 3;
            v40 = ((v39 << 1) + MEM[224] / (v39 * v39)) / 3;
            v41 = ((v40 << 1) + MEM[224] / (v40 * v40)) / 3;
            v42 = ((v41 << 1) + MEM[224] / (v41 * v41)) / 3;
            v43 = ((v42 << 1) + MEM[224] / (v42 * v42)) / 3;
            if (MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 10 ** 18 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                MEM[320] = ((v43 << 1) + MEM[224] / (v43 * v43)) / 3 * 10 ** 12;
            } else if (MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 10 ** 18 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                MEM[320] = ((v43 << 1) + MEM[224] / (v43 * v43)) / 3 * 10 ** 6;
            }
            MEM[704] = MEM[320];
        } else {
            MEM[704] = 0;
        }
        MEM[672] = 3 * MEM[704];
    }
    CALLDATACOPY(704, msg.data.length, 320);
    v44 = 0;
    while (1) {
        MEM[1024] = v44;
        v45 = 10 ** 18 * MEM[160] * 3 / MEM[672] * MEM[192] * 3 / MEM[672] * MEM[224] * 3 / MEM[672];
        if (varg1 + 10 ** 18 > v45) {
            MEM[736] = MEM[736] - v45 + 1;
        } else {
            MEM[736] = v45 - MEM[736] + 1;
        }
        v46 = 10 ** 18 * MEM[672] / varg1 * MEM[736] / varg1 * MEM[736] * 10000 / varg0;
        v47 = v0 + v0 * (0x53444835ec580000 * v45 / MEM[736]) / 10 ** 18 + v46 * 3 / v45 - 0x53444835ec580000 * v45 / MEM[736] * MEM[672] / 10 ** 18;
        require((MEM[672] * (v47 + v0) / (v47 + v0) == MEM[672]) | !(v47 + v0));
        require((MEM[672] * MEM[672] / MEM[672] == MEM[672]) | !MEM[672]);
        MEM[896] = MEM[672] * MEM[672] / v47;
        if (v45 <= 0xde0b6b3a763ffff) {
            require((MEM[672] * (v46 / v47) / (v46 / v47) == MEM[672]) | !(v46 / v47));
            require(MEM[896] + MEM[672] * (v46 / v47) / 10 ** 18 * (10 ** 18 - v45) / v45 >= MEM[896]);
            MEM[896] = MEM[896] + MEM[672] * (v46 / v47) / 10 ** 18 * (10 ** 18 - v45) / v45;
        } else {
            require((MEM[672] * (v46 / v47) / (v46 / v47) == MEM[672]) | !(v46 / v47));
            require(MEM[896] - MEM[672] * (v46 / v47) / 10 ** 18 * (v45 - 10 ** 18) / v45 <= MEM[896]);
            MEM[896] = MEM[896] - MEM[672] * (v46 / v47) / 10 ** 18 * (v45 - 10 ** 18) / v45;
        }
        if (MEM[672] * (v47 + v0) / v47 > MEM[896]) {
            MEM[672] = MEM[672] * (v47 + v0) / v47 - MEM[896];
        } else {
            MEM[672] = MEM[896] - MEM[672] * (v47 + v0) / v47 >> 1;
        }
        if (MEM[672] > MEM[672]) {
            MEM[960] = MEM[672] - MEM[672];
        } else {
            MEM[960] = MEM[672] - MEM[672];
        }
        if (MEM[960] * 10 ** 14 >= (10 ** 16 > MEM[672]) * (MEM[672] ^ 0x2386f26fc10000) ^ MEM[672]) {
            v44 += 1;
            if (!(v44 ^ 0xff)) {
                CALLDATACOPY(1072, msg.data.length, 16);
                revert(Error(32, 16, 'Did not converge'));
            }
        } else {
            v48 = 0;
            while (1) {
                if (MEM[544 + (v48 << 5)] * 10 ** 18 / MEM[672] >= 0x2386f26fc0ffff) {
                    v49 = v50 = MEM[544 + (v48 << 5)] * 10 ** 18 / MEM[672] <= 10 ** 20;
                } else {
                    v49 = 0;
                }
                if (v49) {
                    v48 += 1;
                    if (!(v48 ^ 0x3)) {
                        return MEM[672:704];
                    }
                } else {
                    CALLDATACOPY(1138, msg.data.length, 14);
                    revert(Error(32, 18, 'Unsafe values x[i]'));
                }
            }
        }
    }
}

function newton_D(uint256 varg0, uint256 varg1, uint256[3] varg2) public payable {  find similar
    require(msg.data.length >= 196);
    CALLDATACOPY(64, 68, 96);
    if (MEM[64] < MEM[96]) {
        MEM[160] = MEM[96];
        MEM[192] = MEM[64];
    }
    if (MEM[160] < MEM[128]) {
        MEM[160] = MEM[128];
        MEM[224] = MEM[160];
    }
    if (MEM[192] < MEM[224]) {
        MEM[192] = MEM[224];
        MEM[224] = MEM[192];
    }
    require(MEM[160] <= 0x1f20fe5212d2319f8671d495c8ba43b5b4b98d506d374fd487a);
    require(MEM[160]);
    v0 = MEM[160] + MEM[192] + MEM[224];
    MEM[672] = 0;
    if (varg2) {
        if (v0 >= 0xc097ce7bc90715b34b9f1000000001) {
            require((MEM[160] * MEM[192] / MEM[192] == MEM[160]) | !MEM[192]);
            require((MEM[160] * MEM[192] / 10 ** 36 * MEM[224] / MEM[224] == MEM[160] * MEM[192] / 10 ** 36) | !MEM[224]);
            v1 = MEM[160] * MEM[192] / 10 ** 36 * MEM[224] / varg2 * 27;
            require(!(v1 / 27 ^ MEM[160] * MEM[192] / 10 ** 36 * MEM[224] / varg2));
            require(!(v1 * 10 ** 12 / 10 ** 12 ^ v1));
            MEM[224] = 0;
            if (v1 * 10 ** 12 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                MEM[224] = v1 * 10 ** 12;
            } else if (v1 * 10 ** 12 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                MEM[224] = v1 * 10 ** 12 * 10 ** 18;
            } else {
                MEM[224] = v1 * 10 ** 12 * 10 ** 36;
            }
            MEM[128] = MEM[64];
            MEM[160] = 0;
            if (MEM[64] >> 128) {
                MEM[128] = MEM[64] >> 128;
                MEM[160] = 128;
            }
            if (MEM[128] >> 64) {
                MEM[128] = MEM[128] >> 64;
                MEM[160] = MEM[160] + 64;
            }
            if (MEM[128] >> 32) {
                MEM[128] = MEM[128] >> 32;
                MEM[160] = MEM[160] + 32;
            }
            if (MEM[128] >> 16) {
                MEM[128] = MEM[128] >> 16;
                MEM[160] = MEM[160] + 16;
            }
            if (MEM[128] >> 8) {
                MEM[128] = MEM[128] >> 8;
                MEM[160] = MEM[160] + 8;
            }
            if (MEM[128] >> 4) {
                MEM[128] = MEM[128] >> 4;
                MEM[160] = MEM[160] + 4;
            }
            if (MEM[128] >> 2) {
                MEM[128] = MEM[128] >> 2;
                MEM[160] = MEM[160] + 2;
            }
            if (MEM[128] >> 1) {
                MEM[160] = MEM[160] + 1;
            }
            if (0) {
                v2 = v3 = 1 << MEM[160] < MEM[64];
            } else {
                v2 = v4 = 0;
            }
            if (v2) {
                MEM[160] = MEM[160] + 1;
            }
            require(!(MEM[160] >> uint8.max));
            require(MEM[160] >= 0);
            require(MEM[160] >= 0);
            v5 = 2 ** (MEM[160] / 3) * 1260 ** (MEM[160] % 3) / 1000 ** (MEM[160] % 3);
            v6 = ((v5 << 1) + MEM[224] / (v5 * v5)) / 3;
            v7 = ((v6 << 1) + MEM[224] / (v6 * v6)) / 3;
            v8 = ((v7 << 1) + MEM[224] / (v7 * v7)) / 3;
            v9 = ((v8 << 1) + MEM[224] / (v8 * v8)) / 3;
            v10 = ((v9 << 1) + MEM[224] / (v9 * v9)) / 3;
            v11 = ((v10 << 1) + MEM[224] / (v10 * v10)) / 3;
            if (v1 * 10 ** 12 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                MEM[320] = ((v11 << 1) + MEM[224] / (v11 * v11)) / 3 * 10 ** 12;
            } else if (v1 * 10 ** 12 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                MEM[320] = ((v11 << 1) + MEM[224] / (v11 * v11)) / 3 * 10 ** 6;
            }
            MEM[672] = MEM[320];
        } else if (v0 >= 0xd3c21bcecceda1000001) {
            require((MEM[160] * MEM[192] / MEM[192] == MEM[160]) | !MEM[192]);
            require((MEM[160] * MEM[192] / 10 ** 24 * MEM[224] / MEM[224] == MEM[160] * MEM[192] / 10 ** 24) | !MEM[224]);
            v12 = MEM[160] * MEM[192] / 10 ** 24 * MEM[224] / varg2 * 27;
            require(!(v12 / 27 ^ MEM[160] * MEM[192] / 10 ** 24 * MEM[224] / varg2));
            require(!(v12 * 10 ** 6 / 10 ** 6 ^ v12));
            MEM[224] = 0;
            if (v12 * 10 ** 6 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                MEM[224] = v12 * 10 ** 6;
            } else if (v12 * 10 ** 6 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                MEM[224] = v12 * 10 ** 6 * 10 ** 18;
            } else {
                MEM[224] = v12 * 10 ** 6 * 10 ** 36;
            }
            MEM[128] = MEM[64];
            MEM[160] = 0;
            if (MEM[64] >> 128) {
                MEM[128] = MEM[64] >> 128;
                MEM[160] = 128;
            }
            if (MEM[128] >> 64) {
                MEM[128] = MEM[128] >> 64;
                MEM[160] = MEM[160] + 64;
            }
            if (MEM[128] >> 32) {
                MEM[128] = MEM[128] >> 32;
                MEM[160] = MEM[160] + 32;
            }
            if (MEM[128] >> 16) {
                MEM[128] = MEM[128] >> 16;
                MEM[160] = MEM[160] + 16;
            }
            if (MEM[128] >> 8) {
                MEM[128] = MEM[128] >> 8;
                MEM[160] = MEM[160] + 8;
            }
            if (MEM[128] >> 4) {
                MEM[128] = MEM[128] >> 4;
                MEM[160] = MEM[160] + 4;
            }
            if (MEM[128] >> 2) {
                MEM[128] = MEM[128] >> 2;
                MEM[160] = MEM[160] + 2;
            }
            if (MEM[128] >> 1) {
                MEM[160] = MEM[160] + 1;
            }
            if (0) {
                v13 = v14 = 1 << MEM[160] < MEM[64];
            } else {
                v13 = v15 = 0;
            }
            if (v13) {
                MEM[160] = MEM[160] + 1;
            }
            require(!(MEM[160] >> uint8.max));
            require(MEM[160] >= 0);
            require(MEM[160] >= 0);
            v16 = 2 ** (MEM[160] / 3) * 1260 ** (MEM[160] % 3) / 1000 ** (MEM[160] % 3);
            v17 = ((v16 << 1) + MEM[224] / (v16 * v16)) / 3;
            v18 = ((v17 << 1) + MEM[224] / (v17 * v17)) / 3;
            v19 = ((v18 << 1) + MEM[224] / (v18 * v18)) / 3;
            v20 = ((v19 << 1) + MEM[224] / (v19 * v19)) / 3;
            v21 = ((v20 << 1) + MEM[224] / (v20 * v20)) / 3;
            v22 = ((v21 << 1) + MEM[224] / (v21 * v21)) / 3;
            if (v12 * 10 ** 6 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                MEM[320] = ((v22 << 1) + MEM[224] / (v22 * v22)) / 3 * 10 ** 12;
            } else if (v12 * 10 ** 6 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                MEM[320] = ((v22 << 1) + MEM[224] / (v22 * v22)) / 3 * 10 ** 6;
            }
            MEM[672] = MEM[320];
        } else {
            require((MEM[160] * MEM[192] / MEM[192] == MEM[160]) | !MEM[192]);
            require((MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / MEM[224] == MEM[160] * MEM[192] / 10 ** 18) | !MEM[224]);
            v23 = MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / varg2 * 27;
            require(!(v23 / 27 ^ MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / varg2));
            MEM[224] = 0;
            if (v23 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                MEM[224] = v23;
            } else if (v23 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                MEM[224] = v23 * 10 ** 18;
            } else {
                MEM[224] = v23 * 10 ** 36;
            }
            MEM[128] = MEM[64];
            MEM[160] = 0;
            if (MEM[64] >> 128) {
                MEM[128] = MEM[64] >> 128;
                MEM[160] = 128;
            }
            if (MEM[128] >> 64) {
                MEM[128] = MEM[128] >> 64;
                MEM[160] = MEM[160] + 64;
            }
            if (MEM[128] >> 32) {
                MEM[128] = MEM[128] >> 32;
                MEM[160] = MEM[160] + 32;
            }
            if (MEM[128] >> 16) {
                MEM[128] = MEM[128] >> 16;
                MEM[160] = MEM[160] + 16;
            }
            if (MEM[128] >> 8) {
                MEM[128] = MEM[128] >> 8;
                MEM[160] = MEM[160] + 8;
            }
            if (MEM[128] >> 4) {
                MEM[128] = MEM[128] >> 4;
                MEM[160] = MEM[160] + 4;
            }
            if (MEM[128] >> 2) {
                MEM[128] = MEM[128] >> 2;
                MEM[160] = MEM[160] + 2;
            }
            if (MEM[128] >> 1) {
                MEM[160] = MEM[160] + 1;
            }
            if (0) {
                v24 = v25 = 1 << MEM[160] < MEM[64];
            } else {
                v24 = v26 = 0;
            }
            if (v24) {
                MEM[160] = MEM[160] + 1;
            }
            require(!(MEM[160] >> uint8.max));
            require(MEM[160] >= 0);
            require(MEM[160] >= 0);
            v27 = 2 ** (MEM[160] / 3) * 1260 ** (MEM[160] % 3) / 1000 ** (MEM[160] % 3);
            v28 = ((v27 << 1) + MEM[224] / (v27 * v27)) / 3;
            v29 = ((v28 << 1) + MEM[224] / (v28 * v28)) / 3;
            v30 = ((v29 << 1) + MEM[224] / (v29 * v29)) / 3;
            v31 = ((v30 << 1) + MEM[224] / (v30 * v30)) / 3;
            v32 = ((v31 << 1) + MEM[224] / (v31 * v31)) / 3;
            v33 = ((v32 << 1) + MEM[224] / (v32 * v32)) / 3;
            if (v23 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                MEM[320] = ((v33 << 1) + MEM[224] / (v33 * v33)) / 3 * 10 ** 12;
            } else if (v23 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                MEM[320] = ((v33 << 1) + MEM[224] / (v33 * v33)) / 3 * 10 ** 6;
            }
            MEM[672] = MEM[320];
        }
    } else {
        require((MEM[160] * MEM[192] / MEM[192] == MEM[160]) | !MEM[192]);
        require((MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / MEM[224] == MEM[160] * MEM[192] / 10 ** 18) | !MEM[224]);
        if (MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 10 ** 18) {
            MEM[224] = 0;
            if (MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 10 ** 18 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                MEM[224] = MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 10 ** 18;
            } else if (MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 10 ** 18 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                MEM[224] = MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 10 ** 18 * 10 ** 18;
            } else {
                MEM[224] = MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 10 ** 18 * 10 ** 36;
            }
            MEM[128] = MEM[64];
            MEM[160] = 0;
            if (MEM[64] >> 128) {
                MEM[128] = MEM[64] >> 128;
                MEM[160] = 128;
            }
            if (MEM[128] >> 64) {
                MEM[128] = MEM[128] >> 64;
                MEM[160] = MEM[160] + 64;
            }
            if (MEM[128] >> 32) {
                MEM[128] = MEM[128] >> 32;
                MEM[160] = MEM[160] + 32;
            }
            if (MEM[128] >> 16) {
                MEM[128] = MEM[128] >> 16;
                MEM[160] = MEM[160] + 16;
            }
            if (MEM[128] >> 8) {
                MEM[128] = MEM[128] >> 8;
                MEM[160] = MEM[160] + 8;
            }
            if (MEM[128] >> 4) {
                MEM[128] = MEM[128] >> 4;
                MEM[160] = MEM[160] + 4;
            }
            if (MEM[128] >> 2) {
                MEM[128] = MEM[128] >> 2;
                MEM[160] = MEM[160] + 2;
            }
            if (MEM[128] >> 1) {
                MEM[160] = MEM[160] + 1;
            }
            if (0) {
                v34 = v35 = 1 << MEM[160] < MEM[64];
            } else {
                v34 = v36 = 0;
            }
            if (v34) {
                MEM[160] = MEM[160] + 1;
            }
            require(!(MEM[160] >> uint8.max));
            require(MEM[160] >= 0);
            require(MEM[160] >= 0);
            v37 = 2 ** (MEM[160] / 3) * 1260 ** (MEM[160] % 3) / 1000 ** (MEM[160] % 3);
            v38 = ((v37 << 1) + MEM[224] / (v37 * v37)) / 3;
            v39 = ((v38 << 1) + MEM[224] / (v38 * v38)) / 3;
            v40 = ((v39 << 1) + MEM[224] / (v39 * v39)) / 3;
            v41 = ((v40 << 1) + MEM[224] / (v40 * v40)) / 3;
            v42 = ((v41 << 1) + MEM[224] / (v41 * v41)) / 3;
            v43 = ((v42 << 1) + MEM[224] / (v42 * v42)) / 3;
            if (MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 10 ** 18 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
                MEM[320] = ((v43 << 1) + MEM[224] / (v43 * v43)) / 3 * 10 ** 12;
            } else if (MEM[160] * MEM[192] / 10 ** 18 * MEM[224] / 10 ** 18 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
                MEM[320] = ((v43 << 1) + MEM[224] / (v43 * v43)) / 3 * 10 ** 6;
            }
            MEM[704] = MEM[320];
        } else {
            MEM[704] = 0;
        }
        MEM[672] = 3 * MEM[704];
    }
    CALLDATACOPY(704, msg.data.length, 320);
    v44 = 0;
    while (1) {
        MEM[1024] = v44;
        v45 = 10 ** 18 * MEM[160] * 3 / MEM[672] * MEM[192] * 3 / MEM[672] * MEM[224] * 3 / MEM[672];
        if (varg1 + 10 ** 18 > v45) {
            MEM[736] = MEM[736] - v45 + 1;
        } else {
            MEM[736] = v45 - MEM[736] + 1;
        }
        v46 = 10 ** 18 * MEM[672] / varg1 * MEM[736] / varg1 * MEM[736] * 10000 / varg0;
        v47 = v0 + v0 * (0x53444835ec580000 * v45 / MEM[736]) / 10 ** 18 + v46 * 3 / v45 - 0x53444835ec580000 * v45 / MEM[736] * MEM[672] / 10 ** 18;
        require((MEM[672] * (v47 + v0) / (v47 + v0) == MEM[672]) | !(v47 + v0));
        require((MEM[672] * MEM[672] / MEM[672] == MEM[672]) | !MEM[672]);
        MEM[896] = MEM[672] * MEM[672] / v47;
        if (v45 <= 0xde0b6b3a763ffff) {
            require((MEM[672] * (v46 / v47) / (v46 / v47) == MEM[672]) | !(v46 / v47));
            require(MEM[896] + MEM[672] * (v46 / v47) / 10 ** 18 * (10 ** 18 - v45) / v45 >= MEM[896]);
            MEM[896] = MEM[896] + MEM[672] * (v46 / v47) / 10 ** 18 * (10 ** 18 - v45) / v45;
        } else {
            require((MEM[672] * (v46 / v47) / (v46 / v47) == MEM[672]) | !(v46 / v47));
            require(MEM[896] - MEM[672] * (v46 / v47) / 10 ** 18 * (v45 - 10 ** 18) / v45 <= MEM[896]);
            MEM[896] = MEM[896] - MEM[672] * (v46 / v47) / 10 ** 18 * (v45 - 10 ** 18) / v45;
        }
        if (MEM[672] * (v47 + v0) / v47 > MEM[896]) {
            MEM[672] = MEM[672] * (v47 + v0) / v47 - MEM[896];
        } else {
            MEM[672] = MEM[896] - MEM[672] * (v47 + v0) / v47 >> 1;
        }
        if (MEM[672] > MEM[672]) {
            MEM[960] = MEM[672] - MEM[672];
        } else {
            MEM[960] = MEM[672] - MEM[672];
        }
        if (MEM[960] * 10 ** 14 >= (10 ** 16 > MEM[672]) * (MEM[672] ^ 0x2386f26fc10000) ^ MEM[672]) {
            v44 += 1;
            if (!(v44 ^ 0xff)) {
                CALLDATACOPY(1072, msg.data.length, 16);
                revert(Error(32, 16, 'Did not converge'));
            }
        } else {
            v48 = 0;
            while (1) {
                if (MEM[544 + (v48 << 5)] * 10 ** 18 / MEM[672] >= 0x2386f26fc0ffff) {
                    v49 = v50 = MEM[544 + (v48 << 5)] * 10 ** 18 / MEM[672] <= 10 ** 20;
                } else {
                    v49 = 0;
                }
                if (v49) {
                    v48 += 1;
                    if (!(v48 ^ 0x3)) {
                        return MEM[672:704];
                    }
                } else {
                    CALLDATACOPY(1138, msg.data.length, 14);
                    revert(Error(32, 18, 'Unsafe values x[i]'));
                }
            }
        }
    }
}

function get_p(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5) public payable {  find similar
    require(msg.data.length >= 196);
    if (varg3 >= 10 ** 17) {
        v0 = v1 = varg3 <= 10 ** 33;
    } else {
        v0 = v2 = 0;
    }
    require(v0);
    require(!(varg0 * 27 / 27 ^ varg0));
    require((varg0 * 27 * varg1 / varg1 == varg0 * 27) | !varg1);
    require((varg0 * 27 * varg1 / varg3 * varg2 / varg2 == varg0 * 27 * varg1 / varg3) | !varg2);
    require(!(varg0 * 27 * varg1 / varg3 * varg2 / varg3 * 10 ** 36 / 10 ** 36 ^ varg0 * 27 * varg1 / varg3 * varg2 / varg3));
    MEM[64] = varg0 * 27 * varg1 / varg3 * varg2 / varg3 * 10 ** 36 / varg3;
    require(!(MEM[64] << 1 >> 1 ^ MEM[64]));
    require(((MEM[64] << 1) * MEM[64] / MEM[64] == MEM[64] << 1) | !MEM[64]);
    require(((MEM[64] << 1) * MEM[64] / 10 ** 36 * MEM[64] / MEM[64] == (MEM[64] << 1) * MEM[64] / 10 ** 36) | !MEM[64]);
    require((MEM[64] << 1) * MEM[64] / 10 ** 36 * MEM[64] / 10 ** 36 + (varg5 + 10 ** 18) ** 2 >= (MEM[64] << 1) * MEM[64] / 10 ** 36 * MEM[64] / 10 ** 36);
    require((MEM[64] ** 2 / 10 ** 36 * ((varg5 << 1) + 0x29a2241af62c0000) / ((varg5 << 1) + 0x29a2241af62c0000) == MEM[64] ** 2 / 10 ** 36) | !((varg5 << 1) + 0x29a2241af62c0000));
    v3 = (MEM[64] << 1) * MEM[64] / 10 ** 36 * MEM[64] / 10 ** 36 + (varg5 + 10 ** 18) ** 2 - MEM[64] ** 2 / 10 ** 36 * ((varg5 << 1) + 0x29a2241af62c0000) / 10 ** 18;
    require(v3 <= (MEM[64] << 1) * MEM[64] / 10 ** 36 * MEM[64] / 10 ** 36 + (varg5 + 10 ** 18) ** 2);
    require((varg4 * varg5 ** 2 / 10000 * varg0 / varg0 == varg4 * varg5 ** 2 / 10000) | !varg0);
    require((varg4 * varg5 ** 2 / 10000 * varg0 / varg3 * MEM[64] / MEM[64] == varg4 * varg5 ** 2 / 10000 * varg0 / varg3) | !MEM[64]);
    v4 = v3 + varg4 * varg5 ** 2 / 10000 * varg0 / varg3 * MEM[64] / 10 ** 36;
    require(v4 >= v3);
    require((varg4 * varg5 ** 2 / 10000 * varg1 / varg1 == varg4 * varg5 ** 2 / 10000) | !varg1);
    require((varg4 * varg5 ** 2 / 10000 * varg1 / varg3 * MEM[64] / MEM[64] == varg4 * varg5 ** 2 / 10000 * varg1 / varg3) | !MEM[64]);
    v5 = v3 + varg4 * varg5 ** 2 / 10000 * varg1 / varg3 * MEM[64] / 10 ** 36;
    require(v5 >= v3);
    require((varg0 * v5 / v5 == varg0) | !v5);
    require(varg1);
    require(!(varg0 * v5 / varg1 * 10 ** 18 / 10 ** 18 ^ varg0 * v5 / varg1));
    require((varg4 * varg5 ** 2 / 10000 * varg2 / varg2 == varg4 * varg5 ** 2 / 10000) | !varg2);
    require((varg4 * varg5 ** 2 / 10000 * varg2 / varg3 * MEM[64] / MEM[64] == varg4 * varg5 ** 2 / 10000 * varg2 / varg3) | !MEM[64]);
    v6 = v3 + varg4 * varg5 ** 2 / 10000 * varg2 / varg3 * MEM[64] / 10 ** 36;
    require(v6 >= v3);
    require((varg0 * v6 / v6 == varg0) | !v6);
    require(varg2);
    require(!(varg0 * v6 / varg2 * 10 ** 18 / 10 ** 18 ^ varg0 * v6 / varg2));
    return varg0 * v5 / varg1 * 10 ** 18 / v4, varg0 * v6 / varg2 * 10 ** 18 / v4;
}

function cbrt(uint256 x) public payable {  find similar
    require(msg.data.length >= 36);
    MEM[224] = 0;
    if (x >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
        MEM[224] = x;
    } else if (x >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
        MEM[224] = x * 10 ** 18;
    } else {
        MEM[224] = x * 10 ** 36;
    }
    MEM[128] = MEM[64];
    MEM[160] = 0;
    if (MEM[64] >> 128) {
        MEM[128] = MEM[64] >> 128;
        MEM[160] = 128;
    }
    if (MEM[128] >> 64) {
        MEM[128] = MEM[128] >> 64;
        MEM[160] = MEM[160] + 64;
    }
    if (MEM[128] >> 32) {
        MEM[128] = MEM[128] >> 32;
        MEM[160] = MEM[160] + 32;
    }
    if (MEM[128] >> 16) {
        MEM[128] = MEM[128] >> 16;
        MEM[160] = MEM[160] + 16;
    }
    if (MEM[128] >> 8) {
        MEM[128] = MEM[128] >> 8;
        MEM[160] = MEM[160] + 8;
    }
    if (MEM[128] >> 4) {
        MEM[128] = MEM[128] >> 4;
        MEM[160] = MEM[160] + 4;
    }
    if (MEM[128] >> 2) {
        MEM[128] = MEM[128] >> 2;
        MEM[160] = MEM[160] + 2;
    }
    if (MEM[128] >> 1) {
        MEM[160] = MEM[160] + 1;
    }
    if (0) {
        v0 = v1 = 1 << MEM[160] < MEM[64];
    } else {
        v0 = v2 = 0;
    }
    if (v0) {
        MEM[160] = MEM[160] + 1;
    }
    require(!(MEM[160] >> uint8.max));
    require(MEM[160] >= 0);
    require(MEM[160] >= 0);
    v3 = 2 ** (MEM[160] / 3) * 1260 ** (MEM[160] % 3) / 1000 ** (MEM[160] % 3);
    v4 = ((v3 << 1) + MEM[224] / (v3 * v3)) / 3;
    v5 = ((v4 << 1) + MEM[224] / (v4 * v4)) / 3;
    v6 = ((v5 << 1) + MEM[224] / (v5 * v5)) / 3;
    v7 = ((v6 << 1) + MEM[224] / (v6 * v6)) / 3;
    v8 = ((v7 << 1) + MEM[224] / (v7 * v7)) / 3;
    v9 = ((v8 << 1) + MEM[224] / (v8 * v8)) / 3;
    if (x >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
        MEM[320] = ((v9 << 1) + MEM[224] / (v9 * v9)) / 3 * 10 ** 12;
    } else if (x >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
        MEM[320] = ((v9 << 1) + MEM[224] / (v9 * v9)) / 3 * 10 ** 6;
    }
    return MEM[320];
}

function geometric_mean() public payable {  find similar
    require(msg.data.length >= 100);
    CALLDATACOPY(352, 4, 96);
    require((MEM[352] * MEM[384] / MEM[384] == MEM[352]) | !MEM[384]);
    require((MEM[352] * MEM[384] / 10 ** 18 * MEM[416] / MEM[416] == MEM[352] * MEM[384] / 10 ** 18) | !MEM[416]);
    if (MEM[352] * MEM[384] / 10 ** 18 * MEM[416] / 10 ** 18) {
        MEM[224] = 0;
        if (MEM[352] * MEM[384] / 10 ** 18 * MEM[416] / 10 ** 18 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
            MEM[224] = MEM[352] * MEM[384] / 10 ** 18 * MEM[416] / 10 ** 18;
        } else if (MEM[352] * MEM[384] / 10 ** 18 * MEM[416] / 10 ** 18 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
            MEM[224] = MEM[352] * MEM[384] / 10 ** 18 * MEM[416] / 10 ** 18 * 10 ** 18;
        } else {
            MEM[224] = MEM[352] * MEM[384] / 10 ** 18 * MEM[416] / 10 ** 18 * 10 ** 36;
        }
        MEM[128] = MEM[64];
        MEM[160] = 0;
        if (MEM[64] >> 128) {
            MEM[128] = MEM[64] >> 128;
            MEM[160] = 128;
        }
        if (MEM[128] >> 64) {
            MEM[128] = MEM[128] >> 64;
            MEM[160] = MEM[160] + 64;
        }
        if (MEM[128] >> 32) {
            MEM[128] = MEM[128] >> 32;
            MEM[160] = MEM[160] + 32;
        }
        if (MEM[128] >> 16) {
            MEM[128] = MEM[128] >> 16;
            MEM[160] = MEM[160] + 16;
        }
        if (MEM[128] >> 8) {
            MEM[128] = MEM[128] >> 8;
            MEM[160] = MEM[160] + 8;
        }
        if (MEM[128] >> 4) {
            MEM[128] = MEM[128] >> 4;
            MEM[160] = MEM[160] + 4;
        }
        if (MEM[128] >> 2) {
            MEM[128] = MEM[128] >> 2;
            MEM[160] = MEM[160] + 2;
        }
        if (MEM[128] >> 1) {
            MEM[160] = MEM[160] + 1;
        }
        if (0) {
            v0 = v1 = 1 << MEM[160] < MEM[64];
        } else {
            v0 = v2 = 0;
        }
        if (v0) {
            MEM[160] = MEM[160] + 1;
        }
        require(!(MEM[160] >> uint8.max));
        require(MEM[160] >= 0);
        require(MEM[160] >= 0);
        v3 = 2 ** (MEM[160] / 3) * 1260 ** (MEM[160] % 3) / 1000 ** (MEM[160] % 3);
        v4 = ((v3 << 1) + MEM[224] / (v3 * v3)) / 3;
        v5 = ((v4 << 1) + MEM[224] / (v4 * v4)) / 3;
        v6 = ((v5 << 1) + MEM[224] / (v5 * v5)) / 3;
        v7 = ((v6 << 1) + MEM[224] / (v6 * v6)) / 3;
        v8 = ((v7 << 1) + MEM[224] / (v7 * v7)) / 3;
        v9 = ((v8 << 1) + MEM[224] / (v8 * v8)) / 3;
        if (MEM[352] * MEM[384] / 10 ** 18 * MEM[416] / 10 ** 18 >= 0x12725dd1d243aba0e75fe645cc4873f9e64d542c5db2340000) {
            MEM[320] = ((v9 << 1) + MEM[224] / (v9 * v9)) / 3 * 10 ** 12;
        } else if (MEM[352] * MEM[384] / 10 ** 18 * MEM[416] / 10 ** 18 >= 0x154484932d2e725a5bbca17a3aba173d3d5) {
            MEM[320] = ((v9 << 1) + MEM[224] / (v9 * v9)) / 3 * 10 ** 6;
        }
    }
    return 0, MEM[320];
}

function reduction_coefficient(uint256[3] varg0) public payable {  find similar
    require(msg.data.length >= 132);
    CALLDATACOPY(64, 4, 96);
    require(MEM[64] + MEM[96] >= MEM[64]);
    require(MEM[64] + MEM[96] + MEM[128] >= MEM[64] + MEM[96]);
    require(!(MEM[64] * 0x29a2241af62c0000 / 0x29a2241af62c0000 ^ MEM[64]));
    require(MEM[64] + MEM[96] + MEM[128]);
    require(!(MEM[64] * 0x29a2241af62c0000 / (MEM[64] + MEM[96] + MEM[128]) * 3 / 3 ^ MEM[64] * 0x29a2241af62c0000 / (MEM[64] + MEM[96] + MEM[128])));
    require((MEM[64] * 0x29a2241af62c0000 / (MEM[64] + MEM[96] + MEM[128]) * 3 * MEM[96] / MEM[96] == MEM[64] * 0x29a2241af62c0000 / (MEM[64] + MEM[96] + MEM[128]) * 3) | !MEM[96]);
    v0 = MEM[64] * 0x29a2241af62c0000 / (MEM[64] + MEM[96] + MEM[128]) * 3 * MEM[96] / (MEM[64] + MEM[96] + MEM[128]);
    require(!(v0 * 3 / 3 ^ v0));
    require((v0 * 3 * MEM[128] / MEM[128] == v0 * 3) | !MEM[128]);
    if (varg0) {
        require(!(varg0 * 10 ** 18 / 10 ** 18 ^ varg0));
        require(varg0 + 10 ** 18 >= varg0);
        v1 = varg0 + 10 ** 18 - v0 * 3 * MEM[128] / (MEM[64] + MEM[96] + MEM[128]);
        require(v1 <= varg0 + 10 ** 18);
        require(v1);
        MEM[224] = varg0 * 10 ** 18 / v1;
    }
    return MEM[224];
}

function wad_exp(int256 _power) public payable {  find similar
    require(msg.data.length >= 36);
    MEM[96] = MEM[64];
    if (MEM[64] > 0xfffffffffffffffffffffffffffffffffffffffffffffffdb731c958f34d94c1) {
        if (MEM[64] <= 0x755bf798b4a1bf1e4) {
            v0 = (MEM[64] << 78) / 0x3782dace9d9 - (((MEM[64] << 78) / 0x3782dace9d9 << 96) / 0xb17217f7d1cf79abc9e3b398 + 0x800000000000000000000000 >> 96) * 0xb17217f7d1cf79abc9e3b398;
            v1 = (((((v0 + 0x10fe68e7fd37d0007b713f7650) * v0 >> 96) + 0x2d16720577bd19bf614176fe9ea + v0 - 0x4a4fd9f2a8b96949216d2255a6c) * (((v0 + 0x10fe68e7fd37d0007b713f7650) * v0 >> 96) + 0x2d16720577bd19bf614176fe9ea) >> 96) + 0x587f503bb6ea29d25fcb740196450) * v0 + 0xd835ebba824c98fb31b83b2ca45c000000000000000000000000;
            v2 = ((((((((v0 - 0x240c330e9fb2d9cbaf0fd5aafc) * v0 >> 96) + 0x277594991cfc85f6e2461837cd9) * v0 >> 96) - 0x1a521255e34f6a5061b25ef1c9c4) * v0 >> 96) + 0xb1bbb201f443cf962f1a1d3db4a5) * v0 >> 96) - 0x2c72388d9f74f51a9331fed693f15;
            require(195 - (((MEM[64] << 78) / 0x3782dace9d9 << 96) / 0xb17217f7d1cf79abc9e3b398 + 0x800000000000000000000000 >> 96) >= 0);
        } else {
            CALLDATACOPY(176, msg.data.length, 16);
            revert(Error(32, 16, 'wad_exp overflow'));
        }
    }
    return 0, v1 / ((v2 * v0 >> 96) + 0x5180bb14799ab47a8a8cb2a527d57) * 0x29d9dc38563c32e5c2f6dc192ee70ef65f9978af3 >> 195 - (((MEM[64] << 78) / 0x3782dace9d9 << 96) / 0xb17217f7d1cf79abc9e3b398 + 0x800000000000000000000000 >> 96);
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    if (msg.data.length > 3) {
        require(!msg.value);
        if (function_selector >> 224 ^ 0x54fd4d50) {
            if (function_selector >> 224 ^ 0x4a2ab3be) {
                if (function_selector >> 224 ^ 0xc7fab708) {
                    if (function_selector >> 224 ^ 0x7b12e009) {
                        if (function_selector >> 224 ^ 0x754b76b3) {
                            if (function_selector >> 224 ^ 0xf42c56c2) {
                                if (function_selector >> 224 ^ 0xbad1dc26) {
                                    if (function_selector >> 224 ^ 0xfa18042d) {
                                        if (!(function_selector >> 224 ^ 0x81d18d87)) {
                                            wad_exp(int256);
                                        }
                                    } else {
                                        reduction_coefficient(uint256[3],uint256);
                                    }
                                } else {
                                    geometric_mean(uint256[3]);
                                }
                            } else {
                                cbrt(uint256);
                            }
                        } else {
                            get_p(uint256[3],uint256,uint256[2]);
                        }
                    } else {
                        newton_D(uint256,uint256,uint256[3],uint256);
                    }
                } else {
                    newton_D(uint256,uint256,uint256[3]);
                }
            } else {
                get_y(uint256,uint256,uint256[3],uint256,uint256);
            }
        } else {
            version();
        }
    }
    revert();
}
