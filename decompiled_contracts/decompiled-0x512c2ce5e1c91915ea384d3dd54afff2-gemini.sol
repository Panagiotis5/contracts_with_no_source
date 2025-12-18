// Decompiled by library.dedaub.com
// 2025.12.17 04:38 UTC
// Compiled using the solidity compiler version 0.8.0


// Data structures and variables inferred from the use of storage instructions
address stor_0_0_19; // STORAGE[0x0] bytes 0 to 19
address stor_1_0_19; // STORAGE[0x1] bytes 0 to 19
address owner; // STORAGE[0x2] bytes 0 to 19



function fallback() public payable { 
    revert();
}

function 0x17405f67(address varg0, address[] varg1, address[] varg2) public payable { 
    v2 = varg1;
    v9 = varg2;
    0x4c(v9, v2, varg0);
}

function 0x4c(uint256 varg0, uint256 varg1, address varg2) private { 
    require(owner == msg.sender);
    require(varg1.length <= -2, Panic(17)); // arithmetic overflow or underflow
    require(varg1.length + 1 <= uint256.max - varg0.length, Panic(17)); // arithmetic overflow or underflow
    v0 = varg1.length + 1 + varg0.length;
    require(v0 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v1 = new uint256[](v0);
    if (v0) {
        v2 = v3 = v1.data;
        do {
            v4 = new struct(3);
            v4.word0 = address(0x0);
            v4.word1 = 96;
            v4.word2 = 0;
            MEM[v2] = v4;
            v2 += 32;
            v0 = v0 - 1;
        } while (v0);
    }
    v5 = new struct(3);
    v5.word0 = stor_1_0_19;
    require(0 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v6 = new bytes[](0);
    if (0) {
        CALLDATACOPY(v6.data, msg.data.length, 0);
        v7 = v6.data;
    }
    MEM[36 + MEM[64] + 32] = 64;
    MEM[36 + MEM[64] + 64] = v6.length;
    v8 = v9 = 0;
    while (v8 < v6.length) {
        MEM[36 + MEM[64] + 64 + 32 + v8] = v6[v8];
        v8 = v8 + 32;
    }
    if (v8 > v6.length) {
        MEM[36 + MEM[64] + 64 + 32 + v6.length] = 0;
    }
    MEM[MEM[64]] = 100;
    MEM[MEM[64] + 32] = uint224(msg.sender) | bytes4(0xa12d517100000000000000000000000000000000000000000000000000000000);
    v5.word1 = MEM[64];
    v5.word2 = 0;
    v10 = v11 = 0xd92(0);
    require(0 < v1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v12 = v1.data;
    v1[0] = v5;
    v13 = v14 = 0;
    while (v13 < varg1.length) {
        v15 = new struct(3);
        require(v13 < varg1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v15.word0 = address(varg1[v13]);
        require(v13 < varg1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require(bool((address(varg1[v13])).code.size));
        v16, /* uint256 */ v17 = address(varg1[v13]).balanceOf(varg2).gas(msg.gas);
        require(bool(v16), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        MEM[36 + MEM[64] + 32] = address(0xbadfda5596b52b7ccfbf47f323f70bbdcae51d3);
        MEM[36 + MEM[64] + 64] = v17;
        MEM[MEM[64]] = 100;
        MEM[MEM[64] + 32] = uint224(varg2) | bytes4(0x23b872dd00000000000000000000000000000000000000000000000000000000);
        v15.word1 = MEM[64];
        v15.word2 = 0;
        v10 = 0xd92(v10);
        require(v10 < v1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v1[v10] = v15;
        v13 = 0xd92(v13);
    }
    v18 = v19 = 0;
    while (v18 < varg0.length) {
        v20 = new struct(3);
        require(v18 < varg0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v20.word0 = address(varg0[v18]);
        require(v18 < varg0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require(bool((address(varg0[v18])).code.size));
        v21, /* uint256 */ v22 = address(varg0[v18]).balanceOf(stor_0_0_19).gas(msg.gas);
        require(bool(v21), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        MEM[36 + MEM[64] + 32] = v22;
        MEM[MEM[64]] = 68;
        MEM[MEM[64] + 32] = uint224(address(0xbadfda5596b52b7ccfbf47f323f70bbdcae51d3)) | bytes4(0xa9059cbb00000000000000000000000000000000000000000000000000000000);
        v20.word1 = MEM[64];
        v20.word2 = 0;
        v10 = 0xd92(v10);
        require(v10 < v1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v1[v10] = v20;
        v18 = 0xd92(v18);
    }
    v23 = new uint256[](v1.length);
    v24 = v25 = v23.data;
    v26 = v27 = v25 + (v1.length << 5);
    v28 = v29 = v1.data;
    v30 = v31 = 0;
    while (v30 < v1.length) {
        MEM[v24] = v26 - v25;
        MEM[v26] = address(MEM[MEM[v28]]);
        MEM[v26 + 32] = v26 + 96 - v26;
        MEM[v26 + 96] = MEM[MEM[MEM[v28] + 32]];
        v32 = v33 = 0;
        while (v32 < MEM[MEM[MEM[v28] + 32]]) {
            MEM[v26 + 96 + 32 + v32] = MEM[MEM[MEM[v28] + 32] + 32 + v32];
            v32 = v32 + 32;
        }
        if (v32 > MEM[MEM[MEM[v28] + 32]]) {
            MEM[v26 + 96 + 32 + MEM[MEM[MEM[v28] + 32]]] = 0;
        }
        v26 = v26 + 96 + 32 + (MEM[MEM[MEM[v28] + 32]] + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
        MEM[v26 + 64] = MEM[MEM[v28] + 64];
        v28 = v28 + 32;
        v24 = v24 + 32;
        v30 = v30 + 1;
    }
    require(bool(stor_0_0_19.code.size));
    v34 = stor_0_0_19.multicall(True, v23).gas(msg.gas);
    require(bool(v34), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    return ;
}

function 0xd92(uint256 varg0) private { 
    require(varg0 != uint256.max, Panic(17)); // arithmetic overflow or underflow
    return varg0 + 1;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    require(!msg.value);
    if (msg.data.length >= 4) {
        if (0x17405f67 == function_selector >> 224) {
            0x17405f67();
        }
    }
    fallback();
}
