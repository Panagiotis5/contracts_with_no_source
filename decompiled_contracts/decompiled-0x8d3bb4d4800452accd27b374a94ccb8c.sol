// Decompiled by library.dedaub.com
// 2025.12.17 04:29 UTC
// Compiled using the solidity compiler version 0.8.21





function fallback() public payable { 
    v0 = new uint256[](msg.data.length);
    CALLDATACOPY(v0.data, 0, msg.data.length);
    MEM[64 + (msg.data.length + (4 + MEM[64]))] = 0;
    revert(v0);
}

function approve(address spender, uint256 amount) public payable { 
    require(msg.data.length - 4 >= 64);
    MEM[MEM[64] + 32] = bytes20(spender << 96);
    v0 = v1 = 0;
    while (v0 < 20) {
        MEM[64 + (v0 + MEM[64])] = MEM[32 + (v0 + MEM[64])];
        v0 += 32;
    }
    return 32, 20, 0;
}

function withdraw(address _dao, address member, address tokenAddr, uint256 amount) public payable { 
    require(msg.data.length - 4 >= 128);
    v0 = v1 = 0;
    while (v0 < MEM[96]) {
        MEM[64 + (v0 + MEM[64])] = MEM[32 + (v0 + 96)];
        v0 += 32;
    }
    MEM[MEM[64] + MEM[96] + 64] = 0;
    return 32, MEM[96];
}

function 0x11a806dc(address varg0, uint32 varg1, uint64 varg2, uint64 varg3, bool varg4) public payable { 
    require(msg.data.length - 4 >= 160);
    v0 = v1 = 0;
    while (v0 < MEM[96]) {
        MEM[64 + (v0 + MEM[64])] = MEM[32 + (v0 + 96)];
        v0 += 32;
    }
    MEM[MEM[64] + MEM[96] + 64] = 0;
    return 32, MEM[96];
}

function 0x3d7d693e(address varg0, uint64 varg1) public payable { 
    require(msg.data.length - 4 >= 64);
    v0 = v1 = 0;
    while (v0 < MEM[96]) {
        MEM[64 + (v0 + MEM[64])] = MEM[32 + (v0 + 96)];
        v0 += 32;
    }
    MEM[MEM[64] + MEM[96] + 64] = 0;
    return 32, MEM[96];
}

function 0x7213f469(address varg0, address varg1, uint64 varg2) public payable { 
    require(msg.data.length - 4 >= 96);
    v0 = v1 = 0;
    while (v0 < MEM[96]) {
        MEM[64 + (v0 + MEM[64])] = MEM[32 + (v0 + 96)];
        v0 += 32;
    }
    MEM[MEM[64] + MEM[96] + 64] = 0;
    return 32, MEM[96];
}

function 0x496b7c3e(address varg0, uint32 varg1, uint64 varg2) public payable { 
    require(msg.data.length - 4 >= 96);
    v0 = v1 = 0;
    while (v0 < MEM[96]) {
        MEM[64 + (v0 + MEM[64])] = MEM[32 + (v0 + 96)];
        v0 += 32;
    }
    MEM[MEM[64] + MEM[96] + 64] = 0;
    return 32, MEM[96];
}

function 0x5db372b2(address varg0, address varg1, address varg2, uint64 varg3) public payable { 
    require(msg.data.length - 4 >= 128);
    v0 = v1 = 0;
    while (v0 < MEM[96]) {
        MEM[64 + (v0 + MEM[64])] = MEM[32 + (v0 + 96)];
        v0 += 32;
    }
    MEM[MEM[64] + MEM[96] + 64] = 0;
    return 32, MEM[96];
}

function acceptOwnership() public payable { 
    v0 = v1 = 0;
    while (v0 < MEM[96]) {
        MEM[64 + (v0 + MEM[64])] = MEM[32 + (v0 + 96)];
        v0 += 32;
    }
    MEM[MEM[64] + MEM[96] + 64] = 0;
    return 32, MEM[96];
}

function 0x94b0ec10(address varg0, address varg1, uint256 varg2) public payable { 
    require(msg.data.length - 4 >= 96);
    v0 = v1 = 0;
    while (v0 < MEM[96]) {
        MEM[64 + (v0 + MEM[64])] = MEM[32 + (v0 + 96)];
        v0 += 32;
    }
    MEM[MEM[64] + MEM[96] + 64] = 0;
    return 32, MEM[96];
}

function 0xfde171a7(address varg0, address varg1, uint64 varg2, uint64 varg3) public payable { 
    require(msg.data.length - 4 >= 128);
    v0 = v1 = 0;
    while (v0 < MEM[96]) {
        MEM[64 + (v0 + MEM[64])] = MEM[32 + (v0 + 96)];
        v0 += 32;
    }
    MEM[MEM[64] + MEM[96] + 64] = 0;
    return 32, MEM[96];
}

function transferOwnership(address newOwner) public payable { 
    require(msg.data.length - 4 >= 32);
    MEM[MEM[64] + 32] = bytes20(newOwner << 96);
    v0 = v1 = 0;
    while (v0 < 20) {
        MEM[64 + (v0 + MEM[64])] = MEM[32 + (v0 + MEM[64])];
        v0 += 32;
    }
    return 32, 20, 0;
}

function 0xf861570d(address varg0, uint256 varg1) public payable { 
    require(msg.data.length - 4 >= 64);
    v0 = v1 = 0;
    while (v0 < MEM[96]) {
        MEM[64 + (v0 + MEM[64])] = MEM[32 + (v0 + 96)];
        v0 += 32;
    }
    MEM[MEM[64] + MEM[96] + 64] = 0;
    return 32, MEM[96];
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    require(!msg.value);
    if (msg.data.length >= 4) {
        if (0xb6bf3bc3 > function_selector >> 224) {
            if (0x4154e2d2 > function_selector >> 224) {
                if (0x95ea7b3 == function_selector >> 224) {
                    approve(address,uint256);
                } else if (0xb620b81 == function_selector >> 224) {
                    withdraw(address,address,address,uint256);
                } else if (0x11a806dc != function_selector >> 224) {
                    if (0x1d97c83c != function_selector >> 224) {
                        if (0x3d7d693e == function_selector >> 224) {
                            // Unknown jump to Block 0x109c. Refer to 3-address code (TAC);
                        }
                    }
                }
            } else if (0x4154e2d2 != function_selector >> 224) {
                if (0x496b7c3e == function_selector >> 224) {
                    0x496b7c3e();
                } else if (0x5db372b2 == function_selector >> 224) {
                    0x5db372b2();
                } else if (0x7213f469 != function_selector >> 224) {
                    if (0x79ba5097 == function_selector >> 224) {
                        acceptOwnership();
                    } else if (0x94b0ec10 != function_selector >> 224) {
                    }
                }
            }
        } else {
            if (0xe217b295 > function_selector >> 224) {
                if (0xb6bf3bc3 != function_selector >> 224) {
                    if (0xbd2530e5 != function_selector >> 224) {
                        if (0xc17b1e59 != function_selector >> 224) {
                            if (0xcc61c8e8 != function_selector >> 224) {
                                if (0xd79ef7ee != function_selector >> 224) {
                                }
                            }
                        }
                    }
                }
            } else if (0xe217b295 != function_selector >> 224) {
                if (0xeb2ca17b != function_selector >> 224) {
                    if (0xeeb0bb2c != function_selector >> 224) {
                        if (0xf2fde38b == function_selector >> 224) {
                            transferOwnership(address);
                        } else if (0xf861570d == function_selector >> 224) {
                            0xf861570d();
                        } else if (0xfde171a7 != function_selector >> 224) {
                        }
                    }
                }
            }
            0xfde171a7();
        }
        0x7213f469();
        0x3d7d693e();
        0x11a806dc();
        0x94b0ec10();
    }
    fallback();
}
