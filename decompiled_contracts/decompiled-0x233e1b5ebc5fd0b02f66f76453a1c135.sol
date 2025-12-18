// Decompiled by library.dedaub.com
// 2025.12.17 03:57 UTC
// Compiled using the solidity compiler version 0.8.24





function fallback() public payable { 
    revert();
}

function unlockCallback(bytes rawData) public payable { 
    require(msg.data.length - 4 >= 32);
    require(rawData <= uint64.max);
    require(4 + rawData + 31 < msg.data.length);
    require(msg.data[4 + rawData] <= uint64.max);
    require(v0.data <= msg.data.length);
    require(address(0x4444c5dc75cb358380d2e3de08a90) == msg.sender, Error('NOT_POOL_MANAGER'));
    require(36 + rawData + msg.data[4 + rawData] - (36 + rawData) >= 32);
    require(rawData.word1 <= uint64.max);
    require(36 + rawData + msg.data[4 + rawData] - (36 + rawData + rawData.word1) >= 320);
    v1 = new struct(4);
    require(!((v1 + 128 > uint64.max) | (v1 + 128 < v1)), Panic(65)); // failed memory allocation (too much memory)
    require(msg.data[36 + rawData + rawData.word1] == address(msg.data[36 + rawData + rawData.word1]));
    v1.word0 = msg.data[36 + rawData + rawData.word1];
    require(36 + rawData + msg.data[4 + rawData] - (36 + rawData + rawData.word1 + 32) >= 160);
    v2 = new struct(5);
    require(!((v2 + 160 > uint64.max) | (v2 + 160 < v2)), Panic(65)); // failed memory allocation (too much memory)
    require(msg.data[36 + rawData + rawData.word1 + 32] == address(msg.data[36 + rawData + rawData.word1 + 32]));
    v2.word0 = msg.data[36 + rawData + rawData.word1 + 32];
    require(msg.data[36 + rawData + rawData.word1 + 32 + 32] == address(msg.data[36 + rawData + rawData.word1 + 32 + 32]));
    v2.word1 = msg.data[36 + rawData + rawData.word1 + 32 + 32];
    require(msg.data[36 + rawData + rawData.word1 + 32 + 64] == uint24(msg.data[36 + rawData + rawData.word1 + 32 + 64]));
    v2.word2 = msg.data[36 + rawData + rawData.word1 + 32 + 64];
    require(msg.data[36 + rawData + rawData.word1 + 32 + 96] == int24(msg.data[36 + rawData + rawData.word1 + 32 + 96]));
    v2.word3 = msg.data[36 + rawData + rawData.word1 + 32 + 96];
    require(msg.data[36 + rawData + rawData.word1 + 32 + 128] == address(msg.data[36 + rawData + rawData.word1 + 32 + 128]));
    v2.word4 = msg.data[36 + rawData + rawData.word1 + 32 + 128];
    v1.word1 = v2;
    require(36 + rawData + msg.data[4 + rawData] - (36 + rawData + rawData.word1 + 192) >= 96);
    v3 = new struct(3);
    require(!((v3 + 96 > uint64.max) | (v3 + 96 < v3)), Panic(65)); // failed memory allocation (too much memory)
    require(msg.data[36 + rawData + rawData.word1 + 192] == bool(msg.data[36 + rawData + rawData.word1 + 192]));
    v3.word0 = msg.data[36 + rawData + rawData.word1 + 192];
    v3.word1 = msg.data[32 + (36 + rawData + rawData.word1 + 192)];
    require(msg.data[36 + rawData + rawData.word1 + 192 + 64] == address(msg.data[36 + rawData + rawData.word1 + 192 + 64]));
    v3.word2 = msg.data[36 + rawData + rawData.word1 + 192 + 64];
    v1.word2 = v3;
    require(msg.data[36 + rawData + rawData.word1 + 288] <= uint64.max);
    require(36 + rawData + rawData.word1 + msg.data[36 + rawData + rawData.word1 + 288] + 31 < 36 + rawData + msg.data[4 + rawData]);
    require(msg.data[36 + rawData + rawData.word1 + msg.data[36 + rawData + rawData.word1 + 288]] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v4 = new bytes[](msg.data[36 + rawData + rawData.word1 + msg.data[36 + rawData + rawData.word1 + 288]]);
    require(!((v4 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + msg.data[36 + rawData + rawData.word1 + msg.data[36 + rawData + rawData.word1 + 288]]) + 31) < v4) | (v4 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + msg.data[36 + rawData + rawData.word1 + msg.data[36 + rawData + rawData.word1 + 288]]) + 31) > uint64.max)), Panic(65)); // failed memory allocation (too much memory)
    require(36 + rawData + rawData.word1 + msg.data[36 + rawData + rawData.word1 + 288] + msg.data[36 + rawData + rawData.word1 + msg.data[36 + rawData + rawData.word1 + 288]] + 32 <= 36 + rawData + msg.data[4 + rawData]);
    CALLDATACOPY(v4.data, 36 + rawData + rawData.word1 + msg.data[36 + rawData + rawData.word1 + 288] + 32, msg.data[36 + rawData + rawData.word1 + msg.data[36 + rawData + rawData.word1 + 288]]);
    v4[msg.data[36 + rawData + rawData.word1 + msg.data[36 + rawData + rawData.word1 + 288]]] = 0;
    v1.word3 = v4;
    if (MEM[v1.word2]) {
        v5 = v6 = MEM[v1.word1];
        v7 = v8 = MEM[32 + v1.word1];
    } else {
        v5 = v9 = MEM[v1.word1 + 32];
        v7 = v10 = MEM[v1.word1];
    }
    v11 = 0xa5d(MEM[32 + v1.word2]);
    v12, /* bool */ v13 = address(v5).transferFrom(address(v1.word0), address(0x4444c5dc75cb358380d2e3de08a90), v11).gas(msg.gas);
    require(bool(v12), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v13 == bool(v13));
    require(bool((address(0x4444c5dc75cb358380d2e3de08a90)).code.size));
    v14 = address(0x4444c5dc75cb358380d2e3de08a90).sync(address(v5)).gas(msg.gas);
    require(bool(v14), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v15, /* uint256 */ v16 = address(0x4444c5dc75cb358380d2e3de08a90).settle().gas(msg.gas);
    require(bool(v15), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v17 = 0xa5d(v11);
    v18 = new bytes[](v19.length);
    v20 = v21 = 0;
    while (v20 < v19.length) {
        v18[v20] = v19[v20];
        v20 += 32;
    }
    v18[v19.length] = 0;
    v22, /* uint256 */ v23 = address(0x4444c5dc75cb358380d2e3de08a90).swap(address(MEM[v1.word1]), address(MEM[v1.word1 + 32]), uint24(MEM[v1.word1 + 64]), int24(MEM[v1.word1 + 96]), address(MEM[128 + v1.word1]), bool(MEM[v1.word2]), v17, address(MEM[64 + v1.word2]), v18).gas(msg.gas);
    require(bool(v22), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v24 = 0x5e7(v7, this, address(0x4444c5dc75cb358380d2e3de08a90));
    require(bool((address(0x4444c5dc75cb358380d2e3de08a90)).code.size));
    v25 = address(0x4444c5dc75cb358380d2e3de08a90).take(address(v7), address(v1.word0), v24).gas(msg.gas);
    require(bool(v25), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v26 = new uint256[](32);
    v27 = v28 = 0;
    while (v27 < 32) {
        MEM[v27 + v26.data] = MEM[v27 + (MEM[64] + 32)];
        v27 += 32;
    }
    MEM[32 + v26.data] = 0;
    return v26, v29, v23;
}

function 0x5e7(address varg0, address varg1, address varg2) private { 
    v0, /* uint256 */ v1 = varg2.exttload(keccak256(varg1, varg0)).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    return v1;
}

function poolManager() public payable { 
    return address(0x4444c5dc75cb358380d2e3de08a90);
}

function 0xa5d(uint256 varg0) private { 
    require(varg0 + int256.min, Panic(17)); // arithmetic overflow or underflow
    return 0 - varg0;
}

function swap(address varg0, address varg1, uint24 varg2, int24 varg3, address varg4, bool varg5, uint256 varg6, address varg7, uint256 varg8) public payable { 
    require(msg.data.length - 4 >= 288);
    require(msg.data.length - 4 >= 160);
    v0 = new struct(5);
    require(!((v0 + 160 > uint64.max) | (v0 + 160 < v0)), Panic(65)); // failed memory allocation (too much memory)
    v0.word0 = varg0;
    v0.word1 = varg1;
    v0.word2 = varg2;
    v0.word3 = varg3;
    v0.word4 = varg4;
    require(msg.data.length - 164 >= 96);
    v1 = new struct(3);
    require(!((v1 + 96 > uint64.max) | (v1 + 96 < v1)), Panic(65)); // failed memory allocation (too much memory)
    v1.word0 = varg5;
    v1.word1 = varg6;
    v1.word2 = varg7;
    require(varg8 <= uint64.max);
    require(4 + varg8 + 31 < msg.data.length);
    require(varg8.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v2 = new bytes[](varg8.length);
    require(!((v2 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + varg8.length) + 31) < v2) | (v2 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + varg8.length) + 31) > uint64.max)), Panic(65)); // failed memory allocation (too much memory)
    require(4 + varg8 + varg8.length + 32 <= msg.data.length);
    CALLDATACOPY(v2.data, varg8.data, varg8.length);
    v2[varg8.length] = 0;
    v3 = new struct(4);
    v3.word0 = msg.sender;
    v3.word1 = v0;
    v3.word2 = v1;
    v3.word3 = v2;
    MEM[32 + MEM[64]] = 32;
    MEM[64 + MEM[64]] = address(v3.word0);
    MEM[32 + MEM[64] + 64] = address(MEM[v3.word1]);
    MEM[32 + MEM[64] + 64 + 32] = address(MEM[v3.word1 + 32]);
    MEM[32 + MEM[64] + 64 + 64] = uint24(MEM[v3.word1 + 64]);
    MEM[32 + MEM[64] + 64 + 96] = int24(MEM[v3.word1 + 96]);
    MEM[32 + MEM[64] + 64 + 128] = address(MEM[128 + v3.word1]);
    MEM[32 + MEM[64] + 224] = bool(MEM[v3.word2]);
    MEM[32 + MEM[64] + (uint8.max + 1)] = MEM[v3.word2 + 32];
    MEM[32 + MEM[64] + 288] = address(MEM[v3.word2 + 64]);
    MEM[32 + MEM[64] + 320] = 320;
    MEM[32 + MEM[64] + 352] = v4.length;
    v5 = v6 = 0;
    while (v5 < v4.length) {
        MEM[v5 + (32 + MEM[64] + 352 + 32)] = v4[v5];
        v5 += 32;
    }
    MEM[v4.length + (32 + MEM[64] + 352 + 32)] = 0;
    v7 = new uint256[](32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + v4.length) + (32 + MEM[64] + 352)) - MEM[64] - 32);
    v8 = v9 = 0;
    while (v8 < 32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + v4.length) + (32 + MEM[64] + 352)) - MEM[64] - 32) {
        MEM[v8 + v7.data] = MEM[v8 + (MEM[64] + 32)];
        v8 += 32;
    }
    MEM[32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + v4.length) + (32 + MEM[64] + 352)) - MEM[64] - 32 + v7.data] = 0;
    v10, /* uint256 */ v11 = address(0x4444c5dc75cb358380d2e3de08a90).unlock(v7).gas(msg.gas);
    require(bool(v10), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    RETURNDATACOPY(v11, 0, RETURNDATASIZE());
    MEM[64] = v11 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & RETURNDATASIZE() + 31);
    require(v11 + RETURNDATASIZE() - v11 >= 32);
    require(MEM[v11] <= uint64.max);
    require(v11 + RETURNDATASIZE() > v11 + MEM[v11] + 31);
    require(MEM[v11 + MEM[v11]] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v12 = new bytes[](MEM[v11 + MEM[v11]]);
    require(!((v12 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v11 + MEM[v11]]) + 31) < v12) | (v12 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[v11 + MEM[v11]]) + 31) > uint64.max)), Panic(65)); // failed memory allocation (too much memory)
    require(v11 + MEM[v11] + MEM[v11 + MEM[v11]] + 32 <= v11 + RETURNDATASIZE());
    v13 = v14 = 0;
    while (v13 < MEM[v11 + MEM[v11]]) {
        v12[v13] = MEM[v13 + (v11 + MEM[v11] + 32)];
        v13 += 32;
    }
    v12[MEM[v11 + MEM[v11]]] = 0;
    require(v12.data + v12.length - v12.data >= 32);
    return MEM[v12.data];
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    require(!msg.value);
    if (msg.data.length >= 4) {
        if (0x91dd7346 == function_selector >> 224) {
            unlockCallback(bytes);
        } else if (0xdc4c90d3 == function_selector >> 224) {
            poolManager();
        } else if (0xf3cd914c == function_selector >> 224) {
            swap((address,address,uint24,int24,address),(bool,int256,uint160),bytes);
        }
    }
    fallback();
}
