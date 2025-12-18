// Decompiled by library.dedaub.com
// 2025.12.17 04:59 UTC
// Compiled using the solidity compiler version 0.8.30


// Data structures and variables inferred from the use of storage instructions
mapping (uint256 => bool) mapping_0; // STORAGE[0x0] 


// Events
SwapExecuted(address, address, uint256, uint256);
FeeCollected(address, address, uint256);

function 0x11b0(uint256 varg0, uint256 varg1) private { 
    require(4 > varg0, Panic(33)); // failed convertion to enum type
    if (varg0) {
        require(4 > varg0, Panic(33)); // failed convertion to enum type
        require(varg0 - 1, ECDSAInvalidSignature());
        require(4 > varg0, Panic(33)); // failed convertion to enum type
        require(varg0 - 2, ECDSAInvalidSignatureLength(varg1));
        require(4 > varg0, Panic(33)); // failed convertion to enum type
        require(varg0 != 3, ECDSAInvalidSignatureS(varg1));
        return ; 
    } else {
        return ; 
    }
}

function 0x12d4(address varg0, uint256 varg1) private { 
    v0, v1 = address(0xbb968d878f3d30b3aa957874f7b8a5b11069332b).getFeeCollector().gas(msg.gas);
    if (v0) {
        v1 = v2 = 0;
        if (v0) {
            if (32 > RETURNDATASIZE()) {
                require(!((MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                v3 = MEM[64] + RETURNDATASIZE();
            } else {
                require(!((MEM[64] + 32 > uint64.max) | (MEM[64] + 32 < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                MEM[64] = MEM[64] + 32;
                v3 = v4 = MEM[64] + 32;
            }
            require(v3 - MEM[64] >= 32);
            require(!0xed021b4900000000000000000000000000000000000000000000000000000000);
        }
        if (varg0) {
            v5, v6 = varg0.transfer(address(v1), varg1).gas(msg.gas);
            if (v5) {
                MEM[0] = MEM[0];
                v6 = v7 = 0;
                if (v5) {
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
                    require(!0x56fa634500000000000000000000000000000000000000000000000000000001);
                }
                require(v6, Error('Fee transfer failed'));
                emit FeeCollected(address(v1), varg0, varg1);
                return ; 
            }
        } else {
            MEM[0] = MEM[0];
            v10, /* uint256 */ v11 = v1.call().value(varg1).gas(msg.gas);
            if (RETURNDATASIZE()) {
                require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                v12 = v13 = new bytes[](RETURNDATASIZE());
                require(!((v13 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v13 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v13)), Panic(65)); // failed memory allocation (too much memory)
                v11 = v13.data;
                RETURNDATACOPY(v11, 0, RETURNDATASIZE());
            }
            require(v10, Error('Fee transfer failed'));
            emit FeeCollected(address(v1), varg0, varg1);
            return ; 
        }
    }
    revert(MEM[64], RETURNDATASIZE());
}

function receive() public payable { 
}

function 0xe94af684(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, bytes varg5, uint256 varg6) public payable { 
    require(msg.data.length - 4 >= 224);
    require(!(address(varg0) - varg0));
    require(!(address(varg1) - varg1));
    require(!(address(varg4) - varg4));
    require(varg5 <= uint64.max);
    require(4 + varg5 + 31 < msg.data.length);
    require(varg5.length <= uint64.max);
    v0 = v1 = varg5.data;
    require(4 + varg5 + varg5.length + 32 <= msg.data.length);
    require(!(bool(varg6) - varg6));
    require(msg.sender == this, Error('Only self-call allowed'));
    require(address(varg4), Error('Invalid router'));
    require(!bool(!varg2), Error('Invalid amount'));
    require(varg2 > varg3, Error('Fee exceeds amount'));
    if (!varg6) {
        v2 = _SafeSub(varg2, varg3);
        if (varg3) {
            0x12d4(varg0, varg3);
        }
        if (address(varg0)) {
            v3, v4 = address(0xbb968d878f3d30b3aa957874f7b8a5b11069332b).staticcall(0xaa212975).gas(msg.gas);
            if (v3) {
                v4 = v5 = 0;
                if (v3) {
                    if (32 > RETURNDATASIZE()) {
                        require(!((MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                        v6 = v7 = MEM[64] + RETURNDATASIZE();
                    } else {
                        require(!((MEM[64] + 32 > uint64.max) | (MEM[64] + 32 < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                        MEM[64] = MEM[64] + 32;
                        v6 = v8 = MEM[64] + 32;
                    }
                    require(v6 - MEM[64] >= 32);
                    require(!0x55ded68b00000000000000000000000000000000000000000000000000000000);
                }
                v9, v10 = address(varg0).approve(address(v4), uint256.max).value(v5).gas(msg.gas);
                if (v9) {
                    if (v9) {
                        if (32 > RETURNDATASIZE()) {
                            require(!((MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                            v11 = v12 = MEM[64] + RETURNDATASIZE();
                        } else {
                            require(!((MEM[64] + 32 > uint64.max) | (MEM[64] + 32 < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                            MEM[64] = MEM[64] + 32;
                            v11 = v13 = MEM[64] + 32;
                        }
                        require(v11 - MEM[64] >= 32);
                        require(!0xf6a1584d00000000000000000000000000000000000000000000000000000001);
                    }
                    CALLDATACOPY(v14.data, v1, varg5.length);
                    MEM[v14.data + varg5.length] = 0;
                    v15, /* uint256 */ v16 = varg4.call(v14.data).gas(msg.gas);
                    if (!RETURNDATASIZE()) {
                        v17 = v18 = 96;
                    } else {
                        require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                        v17 = new bytes[](RETURNDATASIZE());
                        require(!((v17 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v17 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v17)), Panic(65)); // failed memory allocation (too much memory)
                        v16 = v17.data;
                        RETURNDATACOPY(v16, 0, RETURNDATASIZE());
                    }
                    if (!v15) {
                        require(!MEM[v17], v17 + 32, MEM[v17]);
                        revert(Error('Swap failed'));
                    }
                }
            }
            revert(MEM[64], RETURNDATASIZE());
        } else {
            CALLDATACOPY(v19.data, v1, varg5.length);
            MEM[v19.data + varg5.length] = 0;
            v20, /* uint256 */ v21 = varg4.call(v19.data).value(v2).gas(msg.gas);
            if (!RETURNDATASIZE()) {
                v22 = v23 = 96;
            } else {
                require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                v22 = new bytes[](RETURNDATASIZE());
                require(!((v22 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v22 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v22)), Panic(65)); // failed memory allocation (too much memory)
                v21 = v22.data;
                RETURNDATACOPY(v21, 0, RETURNDATASIZE());
            }
            if (!v20) {
                require(!MEM[v22], v22 + 32, MEM[v22]);
                revert(Error('Swap failed'));
            }
        }
    } else {
        v0 = v24 = 2150;
        v25 = v26 = address(varg0);
        if (v26) {
            v27 = v28 = MEM[64];
            v29 = address(0xbb968d878f3d30b3aa957874f7b8a5b11069332b).staticcall(0xaa212975).gas(msg.gas);
            if (v29) {
                v30 = v31 = 32;
                v32 = v33 = 4410;
                if (v29) {
                    v34 = v35 = 3992;
                    if (v31 <= RETURNDATASIZE()) {
                        require(!((v28 + 32 > uint64.max) | (v28 + 32 < v28)), Panic(65)); // failed memory allocation (too much memory)
                        MEM[64] = v28 + 32;
                        v36 = v37 = v28 + v31;
                    }
                } else {
                    v38 = v39 = MEM[64];
                    MEM[v39] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
                    MEM[v39 + 4] = address(0x0);
                    MEM[v39 + 36] = uint256.max;
                    v40 = v41 = v39 + 68;
                }
            }
        } else {
            CALLDATACOPY(v42.data, v1, varg5.length);
            MEM[v42.data + varg5.length] = 0;
            v43, /* uint256 */ v44 = varg4.call(v42.data).value(varg2).gas(msg.gas);
            if (!RETURNDATASIZE()) {
                v45 = v46 = 96;
            } else {
                require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                v45 = new bytes[](RETURNDATASIZE());
                require(!((v45 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v45 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v45)), Panic(65)); // failed memory allocation (too much memory)
                v44 = v45.data;
                RETURNDATACOPY(v44, 0, RETURNDATASIZE());
            }
            if (!v43) {
                require(!MEM[v45], v45 + 32, MEM[v45]);
                revert(Error('Swap failed'));
            }
        }
        if (address(varg1)) {
            v47, v48 = address(varg1).balanceOf(this).gas(msg.gas);
            if (v47) {
                v48 = v49 = 0;
                if (v47) {
                    if (32 > RETURNDATASIZE()) {
                        require(!((MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                        v50 = v51 = MEM[64] + RETURNDATASIZE();
                    } else {
                        require(!((MEM[64] + 32 > uint64.max) | (MEM[64] + 32 < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                        MEM[64] = MEM[64] + 32;
                        v50 = v52 = MEM[64] + 32;
                    }
                    require(v50 - MEM[64] >= 32);
                }
                require(v48 > varg3, Error('Insufficient output'));
                if (varg3) {
                    0x12d4(varg1, varg3);
                }
            }
        } else {
            v53 = this.balance;
            require(v53 > varg3, Error('Insufficient output'));
            if (varg3) {
                v54 = v55 = 24713;
                v27 = v56 = MEM[64];
                v57 = address(0xbb968d878f3d30b3aa957874f7b8a5b11069332b).getFeeCollector().gas(msg.gas);
                if (v57) {
                    v30 = v58 = 0;
                    MEM[0] = MEM[0];
                    v25 = v59 = 0xf228de527fc1b9843baac03b9a04565473a263375950e63435d4138464386f46;
                    if (v57) {
                        v34 = v60 = 4814;
                        if (32 <= RETURNDATASIZE()) {
                            require(!((v56 + 32 > uint64.max) | (v56 + 32 < v56)), Panic(65)); // failed memory allocation (too much memory)
                            MEM[64] = v56 + 32;
                            v36 = v61 = v56 + 32;
                        }
                    }
                }
            }
        }
        v62 = v30.call(MEM[v128b_0x4V0x85a:v128b_0x4V0x85a + v128b_0x4V0x85a], MEM[v128b_0x4V0x85a:v128b_0x4V0x85a + v128b_0x4V0x85a]).value(v32).gas(msg.gas);
        if (RETURNDATASIZE()) {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v63 = new bytes[](RETURNDATASIZE());
            require(!((v63 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v63 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v63)), Panic(65)); // failed memory allocation (too much memory)
            RETURNDATACOPY(v63.data, 0, RETURNDATASIZE());
        }
        require(v62, Error('Fee transfer failed'));
        emit v25(address(v30), v30, v32);
        // Unknown jump to Block 0x866. Refer to 3-address code (TAC);
        revert(MEM[64], RETURNDATASIZE());
        require(!((v27 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v27 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v27)), Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = v27 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
        v36 = v64 = v27 + RETURNDATASIZE();
        require(v36 - v27 >= 32);
        v30 = v65 = MEM[v27];
        require(!(address(v65) - v65));
        // Unknown jump to Block ['0x12ceB0x85a', '0xf980xff0B0x85a']. Refer to 3-address code (TAC);
        v38 = MEM[64];
        MEM[v38] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
        MEM[v38 + 4] = address(v65);
        MEM[v38 + 36] = uint256.max;
        v40 = v38 + 68;
        // Unknown jump to Block 0x113aB0x85a. Refer to 3-address code (TAC);
        // Unknown jump to Block 0x128bB0x85a. Refer to 3-address code (TAC);
        v66 = v25.call(MEM[vff00xf1aV0x85a:vff00xf1aV0x85a + vff00xf47V0x85a - vff00xf1aV0x85a], MEM[vff00xf1aV0x85a:vff00xf1aV0x85a + v128b_0x4V0x85a]).gas(msg.gas);
        if (v66) {
            if (v66) {
                if (32 > RETURNDATASIZE()) {
                    require(!((v38 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v38 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v38)), Panic(65)); // failed memory allocation (too much memory)
                    MEM[64] = v38 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                    v67 = v68 = v38 + RETURNDATASIZE();
                } else {
                    require(!((v38 + 32 > uint64.max) | (v38 + 32 < v38)), Panic(65)); // failed memory allocation (too much memory)
                    MEM[64] = v38 + 32;
                    v67 = v69 = v38 + 32;
                }
                require(v67 - v38 >= 32);
                require(!(bool(MEM[v38]) - MEM[v38]));
            }
            CALLDATACOPY(MEM[64], v0, varg5.length);
            MEM[MEM[64] + varg5.length] = 0;
            v70 = v54.call(MEM[MEM[64]:MEM[64] + MEM[64] + varg5.length - MEM[64]], MEM[0:0]).gas(msg.gas);
            if (!RETURNDATASIZE()) {
                v71 = v72 = 96;
            } else {
                require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                v71 = new bytes[](RETURNDATASIZE());
                require(!((v71 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v71 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v71)), Panic(65)); // failed memory allocation (too much memory)
                RETURNDATACOPY(v71.data, 0, RETURNDATASIZE());
            }
            if (!v70) {
                require(!MEM[v71], v71 + 32, MEM[v71]);
                revert(Error('Swap failed'));
            }
        }
    }
    emit SwapExecuted(address(varg0), address(varg1), varg2, varg3);
}

function WRAPPED_NATIVE() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return address(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
}

function 0x87469b3d(bytes varg0, bytes varg1, bytes varg2) public payable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 <= uint64.max);
    require(4 + varg0 + 31 < msg.data.length);
    require(varg0.length <= uint64.max);
    require(4 + varg0 + varg0.length + 32 <= msg.data.length);
    require(varg1 <= uint64.max);
    require(4 + varg1 + 31 < msg.data.length);
    require(varg1.length <= uint64.max);
    require(4 + varg1 + varg1.length + 32 <= msg.data.length);
    require(varg2 <= uint64.max);
    require(4 + varg2 + 31 < msg.data.length);
    require(varg2.length <= uint64.max);
    require(4 + varg2 + varg2.length + 32 <= msg.data.length);
    v0, v1 = address(0xbb968d878f3d30b3aa957874f7b8a5b11069332b).staticcall(0x847b6bcd, msg.sender).gas(msg.gas);
    require(v0, MEM[64], RETURNDATASIZE());
    v1 = v2 = 0;
    if (v0) {
        if (32 > RETURNDATASIZE()) {
            require(!((MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
            v3 = MEM[64] + RETURNDATASIZE();
        } else {
            require(!((MEM[64] + 32 > uint64.max) | (MEM[64] + 32 < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
            MEM[64] = MEM[64] + 32;
            v3 = v4 = MEM[64] + 32;
        }
        require(v3 - MEM[64] >= 32);
        require(!0x7b84943300000000000000000000000000000000000000000000000000000001);
    }
    require(v1, Error('Unauthorized paymaster'));
    CALLDATACOPY(v5.data, varg2.data, varg2.length);
    MEM[v5.data + varg2.length] = 0;
    require(!mapping_0[4 + varg2], Error('OrderIndex already used'));
    require(varg0.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v6 = new bytes[](varg0.length);
    require(!((v6 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + varg0.length) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v6 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + varg0.length) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v6)), Panic(65)); // failed memory allocation (too much memory)
    require(varg0.data + varg0.length <= msg.data.length);
    CALLDATACOPY(v6.data, varg0.data, varg0.length);
    v6[varg0.length] = 0;
    v7 = v6.length;
    v8 = v6.data;
    v9 = new uint256[](v9.data + varg2.length + 84 - v9 - 32);
    CALLDATACOPY(v9.data, varg2.data, varg2.length);
    MEM[v9.data + varg2.length] = keccak256(v6);
    MEM[v9.data + varg2.length + 32] = bytes20(this << 96);
    MEM[v9.data + varg2.length + 52] = CHAINID();
    require(!((v9 + (v9.data + varg2.length + 84 - v9 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v9 + (v9.data + varg2.length + 84 - v9 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v9)), Panic(65)); // failed memory allocation (too much memory)
    v10 = v9.length;
    require(varg1.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v11 = new bytes[](varg1.length);
    require(!((v11 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + varg1.length) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v11 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + varg1.length) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v11)), Panic(65)); // failed memory allocation (too much memory)
    require(varg1.data + varg1.length <= msg.data.length);
    CALLDATACOPY(v11.data, varg1.data, varg1.length);
    v11[varg1.length] = 0;
    v12 = v13 = v11.length;
    if (v13 - 65) {
        v14 = v15 = 0;
        v16 = v17 = 2;
    } else {
        v12 = v18 = MEM[v11 + 64];
        if (v18 > 0x7fffffffffffffffffffffffffffffff5d576e7357a4501ddfe92f46681b20a0) {
            v14 = v19 = 0;
            v16 = v20 = 3;
        } else {
            MEM[0] = 0;
            v21 = ecrecover(keccak256('\x19Ethereum Signed Message:\n32', keccak256(v9)), uint8(byte(MEM[v11 + 96], 0x0)), MEM[v11.data], v18);
            require(v21, MEM[64], RETURNDATASIZE());
            v14 = v22 = MEM[0];
            if (!address(v22)) {
                v14 = v23 = 0;
                v16 = v24 = 1;
                v12 = v25 = 0;
            } else {
                v16 = v26 = 0;
                v12 = v27 = 0;
            }
        }
    }
    0x11b0(v16, v12);
    require(address(v14) == this, Error('Invalid signature'));
    CALLDATACOPY(v28.data, varg2.data, varg2.length);
    MEM[v28.data + varg2.length] = 0;
    mapping_0[4 + varg2] = 1;
    CALLDATACOPY(v29.data, varg0.data, varg0.length);
    MEM[v29.data + varg0.length] = 0;
    v30, /* uint256 */ v31 = this.call(v29.data).value(msg.value).gas(msg.gas);
    if (!RETURNDATASIZE()) {
        v32 = v33 = 96;
    } else {
        require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v32 = v34 = new bytes[](RETURNDATASIZE());
        require(!((v34 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v34 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v34)), Panic(65)); // failed memory allocation (too much memory)
        v31 = v34.data;
        RETURNDATACOPY(v31, 0, RETURNDATASIZE());
    }
    if (!v30) {
        require(!MEM[v32], v32 + 32, MEM[v32]);
        revert(Error('Execution failed'));
    } else {
        v35 = new bytes[](varg0.length);
        CALLDATACOPY(v35.data, varg0.data, varg0.length);
        v35[varg0.length] = 0;
        v36 = new bytes[](varg2.length);
        v35[0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + varg0.length] = varg2.length;
        CALLDATACOPY(v36.data, varg2.data, varg2.length);
        v36[varg2.length] = 0;
        emit 0x6ee8564a9825ceb1ebda58c8defebd44088890fb39c12d4b8bb8f26a955b2e5d(v35, v36);
        receive();
    }
}

function 0x5463b936() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return address(0xbb968d878f3d30b3aa957874f7b8a5b11069332b);
}

function getContractBalance(address token) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    if (token) {
        v0, /* uint256 */ v1 = token.balanceOf(this).gas(msg.gas);
        require(v0, MEM[64], RETURNDATASIZE());
        v1 = v2 = 0;
        if (v0) {
            if (32 > RETURNDATASIZE()) {
                require(!((MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                v3 = MEM[64] + RETURNDATASIZE();
            } else {
                require(!((MEM[64] + 32 > uint64.max) | (MEM[64] + 32 < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                MEM[64] = MEM[64] + 32;
                v3 = v4 = MEM[64] + 32;
            }
            require(v3 - MEM[64] >= 32);
        }
        return v1;
    } else {
        return this.balance;
    }
}

function 0x1b8f9759(bytes varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 <= uint64.max);
    require(varg0 + 35 < msg.data.length);
    require(varg0.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v0 = new bytes[](varg0.length);
    require(!((v0 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + varg0.length) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v0 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + varg0.length) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v0)), Panic(65)); // failed memory allocation (too much memory)
    require(varg0.data + varg0.length <= msg.data.length);
    CALLDATACOPY(v0.data, varg0.data, varg0.length);
    v0[varg0.length] = 0;
    MCOPY(v1.data, v0.data, v0.length);
    MEM[v1.data + v0.length] = 0;
    return bool(STORAGE[keccak256(v1.data)]);
}

function 0x17a4012a(bytes varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 <= uint64.max);
    require(4 + varg0 + 31 < msg.data.length);
    require(varg0.length <= uint64.max);
    require(4 + varg0 + varg0.length + 32 <= msg.data.length);
    CALLDATACOPY(v0.data, varg0.data, varg0.length);
    MEM[v0.data + varg0.length] = 0;
    return mapping_0[4 + varg0];
}

function 0x12704dcb(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4) public payable { 
    require(msg.data.length - 4 >= 160);
    require(!(address(varg0) - varg0));
    require(!(address(varg1) - varg1));
    require(!(address(varg2) - varg2));
    require(msg.sender == this, Error('Only self-call allowed'));
    require(this == address(varg1), Error('Invalid from address'));
    require(!bool(!address(varg2)), Error('Invalid recipient'));
    require(!bool(!varg3), Error('Invalid amount'));
    require(varg3 > varg4, Error('Fee exceeds amount'));
    v0 = _SafeSub(varg3, varg4);
    v1, v2 = address(0xbb968d878f3d30b3aa957874f7b8a5b11069332b).getFeeCollector().gas(msg.gas);
    if (v1) {
        v2 = v3 = 0;
        if (v1) {
            v4 = v5 = 32;
            if (32 > RETURNDATASIZE()) {
                v4 = RETURNDATASIZE();
            }
            require(!((MEM[64] + (v4 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (v4 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
            MEM[64] = MEM[64] + (v4 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
            require(MEM[64] + v4 - MEM[64] >= 32);
            require(!0xed021b4900000000000000000000000000000000000000000000000000000000);
        }
        v2 = v6 = address(varg0);
        if (v6) {
            v7, /* uint256 */ v8 = v6.balanceOf(this).gas(msg.gas);
            if (v7) {
                v9 = v10 = 32;
                v8 = v11 = 0;
                if (v7) {
                    if (v10 > RETURNDATASIZE()) {
                        v9 = RETURNDATASIZE();
                    }
                    require(!((MEM[64] + (v9 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (v9 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                    MEM[64] = MEM[64] + (v9 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                    require(MEM[64] + v9 - MEM[64] >= 32);
                }
                require(v8 >= varg3, Error('Insufficient token balance'));
                v12 = v13 = MEM[64];
                v14 = v6.transfer(address(varg2), v0).gas(msg.gas);
                if (v14) {
                    v15 = v16 = 652;
                    v2 = v17 = 0;
                    if (v14) {
                        v18 = v19 = 849;
                        if (32 <= RETURNDATASIZE()) {
                            require(!((v13 + 32 > uint64.max) | (v13 + 32 < v13)), Panic(65)); // failed memory allocation (too much memory)
                            MEM[64] = v13 + 32;
                            v20 = v21 = v13 + 32;
                        }
                    }
                }
            }
        } else {
            v15 = v22 = 427;
            require(this.balance >= varg3, Error('Insufficient native token'));
            v2 = v23, /* uint256 */ v24 = address(varg2).call().value(v0).gas(msg.gas);
            if (RETURNDATASIZE()) {
                require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                v25 = v26 = new bytes[](RETURNDATASIZE());
                require(!((v26 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v26 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v26)), Panic(65)); // failed memory allocation (too much memory)
                v24 = v26.data;
                RETURNDATACOPY(v24, 0, RETURNDATASIZE());
            }
        }
        0xac7(v2);
        if (v15) {
            MEM[0] = MEM[0];
            v27, /* uint256 */ v28 = address(v2).call().value(v15).gas(msg.gas);
            if (RETURNDATASIZE()) {
                require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                v29 = v30 = new bytes[](RETURNDATASIZE());
                require(!((v30 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v30 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v30)), Panic(65)); // failed memory allocation (too much memory)
                v28 = v30.data;
                RETURNDATACOPY(v28, 0, RETURNDATASIZE());
            }
            require(v27, Error('Fee transfer failed'));
            emit FeeCollected(address(v2), v2, v15);
            exit;
        } else {
            exit;
        }
        require(v2, Error('Transfer failed'));
        if (v15) {
            v12 = v31 = MEM[64];
            v32 = v2.transfer(address(v2), v15).gas(msg.gas);
            if (v32) {
                v15 = v33 = 23999;
                v15 = v34 = 24056;
                MEM[0] = MEM[0];
                v2 = v35 = 0;
                if (v32) {
                    v18 = v36 = 806;
                    v37 = v38 = 32;
                    if (32 > RETURNDATASIZE()) {
                        // Unknown jump to Block 0x32c0x99. Refer to 3-address code (TAC);
                    }
                }
                v2 = v39 = 0xf228de527fc1b9843baac03b9a04565473a263375950e63435d4138464386f46;
            }
        } else {
            exit;
        }
        require(v2, Error('Fee transfer failed'));
        emit v2(address(v2), v2, v15);
        exit;
        v37 = RETURNDATASIZE();
        require(!((v12 + (v37 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v12 + (v37 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v12)), Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = v12 + (v37 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
        v20 = v12 + v37;
        require(v20 - v12 >= 32);
        v2 = v40 = MEM[v12];
        require(!(bool(v40) - v40));
        // Unknown jump to Block ['0x326', '0x351']. Refer to 3-address code (TAC);
        // Unknown jump to Block 0x1a5. Refer to 3-address code (TAC);
    }
    revert(MEM[64], RETURNDATASIZE());
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function 0xac7(uint256 varg0) private { 
    require(varg0, Error('Transfer failed'));
    return ; 
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        if (0x12704dcb == function_selector >> 224) {
            0x12704dcb();
        } else if (0x17a4012a == function_selector >> 224) {
            0x17a4012a();
        } else if (0x1b8f9759 == function_selector >> 224) {
            0x1b8f9759();
        } else if (0x43ab265f == function_selector >> 224) {
            getContractBalance(address);
        } else if (0x5463b936 == function_selector >> 224) {
            0x5463b936();
        } else if (0x87469b3d == function_selector >> 224) {
            0x87469b3d();
        } else if (0xd999984d == function_selector >> 224) {
            WRAPPED_NATIVE();
        } else if (!(0xe94af684 - (function_selector >> 224))) {
            0xe94af684();
        }
    }
    require(!msg.data.length);
    receive();
}
