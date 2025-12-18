// Decompiled by library.dedaub.com
// 2025.12.17 04:55 UTC
// Compiled using the solidity compiler version 0.8.30


// Data structures and variables inferred from the use of storage instructions
address _owner; // STORAGE[0x0] bytes 0 to 19


// Events
OwnershipTransferred(address, address);
FeeCollected(address, address, uint256);

function receive() public payable { 
}

function transferOwnership(address newOwner) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(!(msg.sender - _owner), OwnableUnauthorizedAccount(msg.sender));
    require(newOwner, OwnableInvalidOwner(0));
    _owner = newOwner;
    emit OwnershipTransferred(_owner, newOwner);
}

function 0x5d0(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6) private { 
    if (!varg0) {
        v0 = v1 = 1551;
        v2 = v3 = _SafeSub(varg2, varg3);
        if (varg3) {
            0xdf2(v4, varg3);
        }
        varg2 = v5 = address(v4);
        if (v5) {
            v6, /* uint256 */ varg2 = address(0xbb968d878f3d30b3aa957874f7b8a5b11069332b).staticcall(0xaa212975).gas(msg.gas);
            if (v6) {
                varg2 = v7 = 0;
                if (v6) {
                    v8 = v9 = 32;
                    if (32 > RETURNDATASIZE()) {
                        v8 = v10 = RETURNDATASIZE();
                    }
                    require(!((MEM[64] + (v8 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (v8 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
                    MEM[64] = MEM[64] + (v8 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                    require(MEM[64] + v8 - MEM[64] >= 32);
                    require(!0x55ded68b00000000000000000000000000000000000000000000000000000000);
                }
                v11 = v12 = MEM[64];
                v13 = v5.allowance(this, address(varg2)).gas(msg.gas);
                if (v13) {
                    varg2 = v14 = 0;
                    if (v13) {
                        v15 = 2557;
                        if (32 <= RETURNDATASIZE()) {
                            require(!((v12 + 32 > uint64.max) | (v12 + 32 < v12)), Panic(65)); // failed memory allocation (too much memory)
                            MEM[64] = v12 + 32;
                            v16 = v17 = v12 + 32;
                        }
                    }
                }
            }
        } else {
            CALLDATACOPY(MEM[64], varg5, varg6);
            MEM[MEM[64] + varg6] = 0;
            v18, /* uint256 */ v19 = varg4.call(MEM[MEM[64]:MEM[64] + MEM[64] + v5d0arg0x6 - MEM[64]], MEM[0:0]).value(v3).gas(msg.gas);
            if (!RETURNDATASIZE()) {
                v20 = 96;
            } else {
                require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                v20 = v21 = new bytes[](RETURNDATASIZE());
                require(!((v21 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v21 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v21)), Panic(65)); // failed memory allocation (too much memory)
                v19 = v21.data;
                RETURNDATACOPY(v19, 0, RETURNDATASIZE());
            }
            if (!v18) {
                require(!MEM[v20], v20 + 32, MEM[v20]);
                revert(SwapFailed());
            }
        }
        v2 = v22 = address(varg2);
        if (v22) {
            v11 = v23 = MEM[64];
            v24 = v22.balanceOf(this).gas(msg.gas);
            if (v24) {
                varg2 = v25 = 0;
                varg2 = v26 = 32;
                varg2 = v27 = 2062;
                if (v24) {
                    v15 = v28 = 2142;
                    if (v26 <= RETURNDATASIZE()) {
                        require(!((v23 + 32 > uint64.max) | (v23 + 32 < v23)), Panic(65)); // failed memory allocation (too much memory)
                        MEM[64] = v23 + 32;
                        v16 = v29 = v23 + v26;
                    }
                }
            }
        } else {
            v30, /* uint256 */ v31 = msg.sender.call().value(this.balance).gas(msg.gas);
            if (RETURNDATASIZE()) {
                require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                v32 = v33 = new bytes[](RETURNDATASIZE());
                require(!((v33 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v33 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v33)), Panic(65)); // failed memory allocation (too much memory)
                v31 = v33.data;
                RETURNDATACOPY(v31, 0, RETURNDATASIZE());
            }
            require(v30, SendFailed());
        }
        v34 = v35 = MEM[64];
        v36 = v2.transfer(msg.sender, varg2).value(varg2).gas(msg.gas);
        if (v36) {
            v37 = v38 = 0;
            if (v36) {
                v39 = v40 = 2113;
                if (32 <= RETURNDATASIZE()) {
                    require(!((v35 + 32 > uint64.max) | (v35 + 32 < v35)), Panic(65)); // failed memory allocation (too much memory)
                    MEM[64] = v35 + 32;
                    v41 = v42 = v35 + 32;
                }
            }
        }
        require(v37, TransferFailed());
        // Unknown jump to Block 0x60f. Refer to 3-address code (TAC);
        RETURNDATACOPY(MEM[64], 0, RETURNDATASIZE());
        revert(MEM[64], RETURNDATASIZE());
        if (varg2 < v2) {
            if (varg2) {
                v34 = v43 = MEM[64];
                v44 = varg2.approve(address(varg2), 0).gas(msg.gas);
                if (v44) {
                    varg2 = v45 = 0;
                    varg2 = v46 = 2364;
                    if (v44) {
                        v39 = v47 = 2524;
                        if (32 <= RETURNDATASIZE()) {
                            require(!((v43 + 32 > uint64.max) | (v43 + 32 < v43)), Panic(65)); // failed memory allocation (too much memory)
                            MEM[64] = v43 + 32;
                            v41 = v48 = v43 + 32;
                        }
                    }
                }
            }
        }
        CALLDATACOPY(MEM[64], varg2, varg2);
        MEM[MEM[64] + varg2] = 0;
        v49 = varg2.call(MEM[MEM[64]:MEM[64] + MEM[64] + v5d0arg0x2 - MEM[64]], MEM[0:0]).gas(msg.gas);
        if (!RETURNDATASIZE()) {
            v50 = 96;
        } else {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v50 = v51 = new bytes[](RETURNDATASIZE());
            require(!((v51 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v51 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v51)), Panic(65)); // failed memory allocation (too much memory)
            RETURNDATACOPY(v51.data, 0, RETURNDATASIZE());
        }
        if (!v49) {
            require(!MEM[v50], v50 + 32, MEM[v50]);
            revert(SwapFailed());
        }
        v34 = v52 = MEM[64];
        v53 = varg2.approve(address(varg2), uint256.max).gas(msg.gas);
        if (v53) {
            if (v53) {
                v39 = v54 = 2414;
                if (32 <= RETURNDATASIZE()) {
                    require(!((v52 + 32 > uint64.max) | (v52 + 32 < v52)), Panic(65)); // failed memory allocation (too much memory)
                    MEM[64] = v52 + 32;
                    v41 = v55 = v52 + 32;
                }
            }
        }
        // Unknown jump to Block 0x8f5B0x606. Refer to 3-address code (TAC);
        require(!((v34 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v34 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v34)), Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = v34 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
        v41 = v56 = v34 + RETURNDATASIZE();
        require(v41 - v34 >= 32);
        v37 = v57 = MEM[v34];
        require(!(bool(v57) - v57));
        // Unknown jump to Block ['0x8410x746B0x606', '0x96eB0x606', '0x9dcB0x606']. Refer to 3-address code (TAC);
        // Unknown jump to Block 0x950B0x606. Refer to 3-address code (TAC);
        // Unknown jump to Block 0x9bbB0x606. Refer to 3-address code (TAC);
        // Unknown jump to Block 0x90bB0x606. Refer to 3-address code (TAC);
        require(!((v11 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v11 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v11)), Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = v11 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
        v16 = v58 = v11 + RETURNDATASIZE();
        require(v16 - v11 >= 32);
        varg2 = v59 = MEM[v11];
        // Unknown jump to Block ['0x85eB0x606', '0x9fdB0x606']. Refer to 3-address code (TAC);
        // Unknown jump to Block 0x8edB0x606. Refer to 3-address code (TAC);
    } else {
        v0 = v60 = 1502;
        varg2 = v61 = address(v4);
        if (v61) {
            v62 = v63 = MEM[64];
            v64 = address(0xbb968d878f3d30b3aa957874f7b8a5b11069332b).staticcall(0xaa212975).gas(msg.gas);
            if (v64) {
                varg2 = v65 = 0;
                if (v64) {
                    v66 = v67 = 3366;
                    if (32 <= RETURNDATASIZE()) {
                        require(!((v63 + 32 > uint64.max) | (v63 + 32 < v63)), Panic(65)); // failed memory allocation (too much memory)
                        MEM[64] = v63 + 32;
                        v68 = v69 = v63 + 32;
                    }
                }
            }
        } else {
            CALLDATACOPY(MEM[64], varg5, varg6);
            MEM[MEM[64] + varg6] = 0;
            v70, /* uint256 */ v71 = varg4.call(MEM[MEM[64]:MEM[64] + MEM[64] + v5d0arg0x6 - MEM[64]], MEM[0:0]).value(varg2).gas(msg.gas);
            if (!RETURNDATASIZE()) {
                v72 = 96;
            } else {
                require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                v72 = v73 = new bytes[](RETURNDATASIZE());
                require(!((v73 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v73 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v73)), Panic(65)); // failed memory allocation (too much memory)
                v71 = v73.data;
                RETURNDATACOPY(v71, 0, RETURNDATASIZE());
            }
            if (!v70) {
                require(!MEM[v72], v72 + 32, MEM[v72]);
                revert(SwapFailed());
            }
        }
        varg2 = v74 = address(varg2);
        if (v74) {
            v75 = v76 = MEM[64];
            v77 = v74.balanceOf(this).gas(msg.gas);
            if (v77) {
                v78 = v79 = 0;
                if (v77) {
                    v80 = v81 = 2917;
                    if (32 <= RETURNDATASIZE()) {
                        require(!((v76 + 32 > uint64.max) | (v76 + 32 < v76)), Panic(65)); // failed memory allocation (too much memory)
                        MEM[64] = v76 + 32;
                        v82 = v83 = v76 + 32;
                    }
                }
            }
        } else {
            v84 = this.balance;
            require(v84 > varg2, InsufficientOutput());
            varg2 = v85 = 0;
            varg2 = _SafeSub(v84, varg2);
            if (varg2) {
                varg2 = v86 = 2733;
                v62 = v87 = MEM[64];
                v88 = address(0xbb968d878f3d30b3aa957874f7b8a5b11069332b).getFeeCollector().gas(msg.gas);
                if (v88) {
                    varg2 = v89 = 0;
                    if (v88) {
                        v66 = v90 = 3563;
                        if (32 <= RETURNDATASIZE()) {
                            require(!((v87 + 32 > uint64.max) | (v87 + 32 < v87)), Panic(65)); // failed memory allocation (too much memory)
                            MEM[64] = v87 + 32;
                            v68 = v91 = v87 + 32;
                        }
                    }
                }
            }
        }
        v92 = msg.sender.call(MEM[v5d0arg0x2:v5d0arg0x2 + v5d0arg0x2], MEM[v5d0arg0x2:v5d0arg0x2 + v5d0arg0x2]).value(varg2).gas(msg.gas);
        if (RETURNDATASIZE()) {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v93 = v94 = new bytes[](RETURNDATASIZE());
            require(!((v94 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v94 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v94)), Panic(65)); // failed memory allocation (too much memory)
            RETURNDATACOPY(v94.data, 0, RETURNDATASIZE());
        }
        require(v92, SendFailed());
        v95, /* uint256 */ v96 = varg2.call().value(varg2).gas(msg.gas);
        if (RETURNDATASIZE()) {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v97 = v98 = new bytes[](RETURNDATASIZE());
            require(!((v98 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v98 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v98)), Panic(65)); // failed memory allocation (too much memory)
            v96 = v98.data;
            RETURNDATACOPY(v96, 0, RETURNDATASIZE());
        }
        require(v95, TransferFailed());
        emit FeeCollected(address(varg2), 0, varg2);
        require(v78 > varg2, InsufficientOutput());
        v99 = _SafeSub(v78, varg2);
        if (varg2) {
            0xdf2(varg2, varg2);
        }
        v100 = v101 = MEM[64];
        v102 = varg2.transfer(msg.sender, v99).gas(msg.gas);
        if (v102) {
            v103 = v104 = 0;
            if (v102) {
                v105 = v106 = 2113;
                if (32 <= RETURNDATASIZE()) {
                    require(!((v101 + 32 > uint64.max) | (v101 + 32 < v101)), Panic(65)); // failed memory allocation (too much memory)
                    MEM[64] = v101 + 32;
                    v107 = v108 = v101 + 32;
                }
            }
        }
        require(v103, TransferFailed());
        // Unknown jump to Block 0x5de. Refer to 3-address code (TAC);
        RETURNDATACOPY(MEM[64], 0, RETURNDATASIZE());
        revert(MEM[64], RETURNDATASIZE());
        v75 = v109 = MEM[64];
        v110 = varg2.allowance(this, address(varg2)).gas(msg.gas);
        if (v110) {
            v78 = v111 = 0;
            if (v110) {
                v80 = 3333;
                if (32 <= RETURNDATASIZE()) {
                    require(!((v109 + 32 > uint64.max) | (v109 + 32 < v109)), Panic(65)); // failed memory allocation (too much memory)
                    MEM[64] = v109 + 32;
                    v82 = v112 = v109 + 32;
                }
            }
        }
        if (v78 < varg2) {
            if (v78) {
                v100 = v113 = MEM[64];
                v114 = varg2.approve(address(varg2), 0).gas(msg.gas);
                if (v114) {
                    varg2 = v115 = 0;
                    varg2 = v116 = 3140;
                    if (v114) {
                        v105 = v117 = 3300;
                        if (32 <= RETURNDATASIZE()) {
                            require(!((v113 + 32 > uint64.max) | (v113 + 32 < v113)), Panic(65)); // failed memory allocation (too much memory)
                            MEM[64] = v113 + 32;
                            v107 = v118 = v113 + 32;
                        }
                    }
                }
            }
        }
        CALLDATACOPY(MEM[64], varg2, varg2);
        MEM[MEM[64] + varg2] = 0;
        v119 = varg2.call(MEM[MEM[64]:MEM[64] + MEM[64] + v5d0arg0x2 - MEM[64]], MEM[0:0]).gas(msg.gas);
        if (!RETURNDATASIZE()) {
            v120 = 96;
        } else {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v120 = v121 = new bytes[](RETURNDATASIZE());
            require(!((v121 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v121 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v121)), Panic(65)); // failed memory allocation (too much memory)
            RETURNDATACOPY(v121.data, 0, RETURNDATASIZE());
        }
        if (!v119) {
            require(!MEM[v120], v120 + 32, MEM[v120]);
            revert(SwapFailed());
        }
        v100 = v122 = MEM[64];
        v123 = varg2.approve(address(varg2), uint256.max).gas(msg.gas);
        if (v123) {
            if (v123) {
                v105 = v124 = 3190;
                if (32 <= RETURNDATASIZE()) {
                    require(!((v122 + 32 > uint64.max) | (v122 + 32 < v122)), Panic(65)); // failed memory allocation (too much memory)
                    MEM[64] = v122 + 32;
                    v107 = v125 = v122 + 32;
                }
            }
        }
        // Unknown jump to Block 0xbfdB0x5d6. Refer to 3-address code (TAC);
        require(!((v100 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v100 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v100)), Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = v100 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
        v107 = v126 = v100 + RETURNDATASIZE();
        require(v107 - v100 >= 32);
        v103 = v127 = MEM[v100];
        require(!(bool(v127) - v127));
        // Unknown jump to Block ['0x8410xa45B0x5d6', '0xc76B0x5d6', '0xce4B0x5d6']. Refer to 3-address code (TAC);
        // Unknown jump to Block 0x8200xa45B0x5d6. Refer to 3-address code (TAC);
        // Unknown jump to Block 0xcc3B0x5d6. Refer to 3-address code (TAC);
        // Unknown jump to Block 0xc13B0x5d6. Refer to 3-address code (TAC);
        require(!((v75 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v75 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v75)), Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = v75 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
        v82 = v128 = v75 + RETURNDATASIZE();
        require(v82 - v75 >= 32);
        v78 = v129 = MEM[v75];
        // Unknown jump to Block ['0xb65B0x5d6', '0xd05B0x5d6']. Refer to 3-address code (TAC);
        // Unknown jump to Block 0xaedB0x5d6. Refer to 3-address code (TAC);
        require(!((v62 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v62 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v62)), Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = v62 + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
        v68 = v130 = v62 + RETURNDATASIZE();
        require(v68 - v62 >= 32);
        varg2 = v131 = MEM[v62];
        require(!(address(v131) - v131));
        // Unknown jump to Block ['0xd26B0x5d6', '0xdebB0x5d6']. Refer to 3-address code (TAC);
        // Unknown jump to Block 0xd7bB0x5d6. Refer to 3-address code (TAC);
    }
    return MEM[64] + 64, MEM[64], MEM[64], v132, msg.sender, v132, address(v0);
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function 0xe94af684(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6) public payable { 
    require(msg.data.length - 4 >= 224);
    require(!(address(varg0) - varg0));
    require(!(address(varg1) - varg1));
    require(!(address(varg4) - varg4));
    require(varg5 <= uint64.max);
    require(varg5 + 35 < msg.data.length);
    require(varg5.length <= uint64.max);
    require(varg5 + varg5.length + 36 <= msg.data.length);
    require(!(bool(varg6) - varg6));
    require(address(varg4), InvalidRouter());
    require(varg2, InvalidAmount());
    require(varg2 > varg3, fullExit());
    if (address(varg0)) {
        v0, v1 = address(varg0).transferFrom(msg.sender, this, varg2).gas(msg.gas);
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
            require(!0xdc478d2300000000000000000000000000000000000000000000000000000001);
        }
        require(v1, TransferFailed());
        v5, v6, v7, v8, v9, v10, v11 = 0x5d0(varg6, varg1, varg2, varg3, varg4, varg5.data, varg5.length);
        emit v8(v9, v10, v11);
        // Unknown jump to Block 0x180x86. Refer to 3-address code (TAC);
    } else {
        require(msg.value >= varg2, InsufficientNativeToken());
        v12, v13, v14, v15, v16, v17, v18 = 0x5d0(varg6, varg1, varg2, varg3, varg4, varg5.data, varg5.length);
        emit v15(v16, v17, v18);
    }
    receive();
}

function WRAPPED_NATIVE() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return address(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
}

function withdrawNative(uint256 amount, address to) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(!(msg.sender - _owner), OwnableUnauthorizedAccount(msg.sender));
    require(to, InvalidRecipient());
    v0, /* uint256 */ v1 = to.call().value(amount).gas(msg.gas);
    if (RETURNDATASIZE()) {
        require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v2 = v3 = new bytes[](RETURNDATASIZE());
        require(!((v3 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v3 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v3)), Panic(65)); // failed memory allocation (too much memory)
        v1 = v3.data;
        RETURNDATACOPY(v1, 0, RETURNDATASIZE());
    }
    require(v0, TransferFailed());
}

function owner() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return _owner;
}

function renounceOwnership() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    require(!(msg.sender - _owner), OwnableUnauthorizedAccount(msg.sender));
    _owner = 0;
    emit OwnershipTransferred(_owner, 0);
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
        v2 = v3 = 19154;
        v1 = v4 = 0;
        if (v0) {
            v5 = v6 = 32;
            if (32 > RETURNDATASIZE()) {
                v5 = RETURNDATASIZE();
            }
            require(!((MEM[64] + (v5 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (v5 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
            MEM[64] = MEM[64] + (v5 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
            require(MEM[64] + v5 - MEM[64] >= 32);
        }
    } else {
        v2 = v7 = 19119;
        v1 = v8 = this.balance;
    }
    // Unknown jump to Block ['0x4aaf', '0x4ad2']. Refer to 3-address code (TAC);
    return v1;
    return v1;
}

function withdrawToken(address token, uint256 amount, address sendTo) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(!(msg.sender - _owner), OwnableUnauthorizedAccount(msg.sender));
    require(sendTo, InvalidRecipient());
    v0, v1 = token.transfer(sendTo, amount).gas(msg.gas);
    require(v0, MEM[64], RETURNDATASIZE());
    v1 = v2 = 0;
    if (v0) {
        v3 = v4 = 32;
        if (32 > RETURNDATASIZE()) {
            v3 = RETURNDATASIZE();
        }
        require(!((MEM[64] + (v3 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (v3 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = MEM[64] + (v3 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
        require(MEM[64] + v3 - MEM[64] >= 32);
        require(!0x56fa634500000000000000000000000000000000000000000000000000000001);
    }
    require(v1, TransferFailed());
}

function 0xdf2(address varg0, uint256 varg1) private { 
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
                require(v6, TransferFailed());
                emit FeeCollected(address(v1), varg0, varg1);
                return ;
            }
        } else {
            v10, /* uint256 */ v11 = v1.call().value(varg1).gas(msg.gas);
            if (RETURNDATASIZE()) {
                require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                v12 = v13 = new bytes[](RETURNDATASIZE());
                require(!((v13 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v13 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v13)), Panic(65)); // failed memory allocation (too much memory)
                v11 = v13.data;
                RETURNDATACOPY(v11, 0, RETURNDATASIZE());
            }
            require(v10, TransferFailed());
            emit FeeCollected(address(v1), varg0, varg1);
            return ;
        }
    }
    revert(MEM[64], RETURNDATASIZE());
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        if (0x3ccdbb28 == function_selector >> 224) {
            withdrawToken(address,uint256,address);
        } else if (0x43ab265f == function_selector >> 224) {
            getContractBalance(address);
        } else if (0x5463b936 == function_selector >> 224) {
            0x5463b936();
        } else if (0x715018a6 == function_selector >> 224) {
            renounceOwnership();
        } else if (0x8da5cb5b == function_selector >> 224) {
            owner();
        } else if (0xb8ca8dd8 == function_selector >> 224) {
            withdrawNative(uint256,address);
        } else if (0xd999984d == function_selector >> 224) {
            WRAPPED_NATIVE();
        } else if (0xe94af684 == function_selector >> 224) {
            0xe94af684();
        } else if (!(0xf2fde38b - (function_selector >> 224))) {
            transferOwnership(address);
        }
    }
    require(!msg.data.length);
    receive();
}
