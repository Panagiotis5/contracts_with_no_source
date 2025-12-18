// Decompiled by library.dedaub.com
// 2025.12.17 04:10 UTC
// Compiled using the solidity compiler version 0.8.27


// Data structures and variables inferred from the use of storage instructions
mapping (address => bool) _approvedSellers; // STORAGE[0x0]
mapping (address => bool) mapping_1; // STORAGE[0x1]
mapping (address => bool) mapping_2; // STORAGE[0x2]
mapping (address => bool) mapping_3; // STORAGE[0x3]
struct_1426[] _products; // STORAGE[0x4]
uint256 stor_9b779b17422d0df92223018b32b4d1fa46e071723d6817e2486d003becc55f00; // STORAGE[0x9b779b17422d0df92223018b32b4d1fa46e071723d6817e2486d003becc55f00]
uint64 stor_f0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00_0_7; // STORAGE[0xf0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00] bytes 0 to 7
bool stor_f0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00_8_8; // STORAGE[0xf0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00] bytes 8 to 8
address stor_360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc_0_19; // STORAGE[0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc] bytes 0 to 19
address _owner; // STORAGE[0x9016d09d72d40fdae2fd8ceac6b6234c7706214fd39c1cd1e609a0528c199300] bytes 0 to 19

struct struct_1426 { uint256 field0; string field1; string field2; };

// Events
Initialized(uint64);
OwnershipTransferred(address, address);
Upgraded(address);

function 0x122c() private { 
    v0 = stor_f0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00_8_8;
    v1 = v2 = !v0;
    v1 = v3 = stor_f0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00_0_7 == 0;
    v4 = v5 = stor_f0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00_0_7 == 1;
    if (v5) {
        v4 = v6 = (address(this)).code.size == 0;
    }
    v7 = v8 = !v1;
    if (!bool(v1)) {
        v7 = v9 = !v4;
    }
    require(!v7, InvalidInitialization());
    stor_f0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00_0_7 = 1;
    if (!stor_f0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00_8_8) {
        stor_f0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00_8_8 = 1;
    }
    require(stor_f0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00_8_8, NotInitializing());
    require(stor_f0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00_8_8, NotInitializing());
    require(msg.sender - address(0x0), OwnableInvalidOwner(address(0x0)));
    0x2a27(msg.sender);
    if (!stor_f0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00_8_8) {
        stor_f0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00_8_8 = 0;
        emit Initialized(uint64(1));
    }
    return ;
}

function receive() public payable { 
}

function 0x1b22(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) private { 
    v0 = v1 = varg2 != 65;
    if (varg2 == 65) {
        require(0 < varg2, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v0 = v2 = bytes1(msg.data[varg3] >> 248 << 248) != 0x400000000000000000000000000000000000000000000000000000000000000;
    }
    require(!v0, InvalidPubKey());
    v3 = new bytes[](varg2);
    CALLDATACOPY(v3.data, varg3, varg2);
    v3[varg2] = 0;
    require(64 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v4 = new bytes[](64);
    if (64) {
        CALLDATACOPY(v4.data, msg.data.length, 64);
    }
    v5 = 0;
    while (v5 < 64) {
        v6 = _SafeAdd(v5, 1);
        require(v6 < v3.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require(v5 < v4.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        MEM8[32 + v5 + v4] = (byte(bytes1(v3[v6] >> 248 << 248), 0x0)) & 0xFF;
        v5 += 1;
    }
    v7 = v8 = !_approvedSellers[address(keccak256(MEM[v1b220x2b66.data:v1b220x2b66.data + v1b220x2b66.length]))];
    if (_approvedSellers[address(keccak256(MEM[v1b220x2b66.data:v1b220x2b66.data + v1b220x2b66.length]))]) {
        v7 = v9 = mapping_1[address(keccak256(MEM[v1b220x2b66.data:v1b220x2b66.data + v1b220x2b66.length]))];
    }
    if (!v7) {
        v10 = new struct(3);
        v10.word0 = block.timestamp;
        v11 = new bytes[](varg2);
        CALLDATACOPY(v11.data, varg3, varg2);
        v11[varg2] = 0;
        v10.word1 = v11;
        v12 = new bytes[](varg0);
        CALLDATACOPY(v12.data, varg1, varg0);
        v12[varg0] = 0;
        v10.word2 = v12;
        _products.length = _products.length + 1;
        _products[_products.length - 1].field0 = v10.word0;
        _products[_products.length - 1].field1 = string(v10.word1);
        _products[_products.length - 1].field2 = string(v10.word2);
        return ;
    } else {
        MEM[MEM[64]] = 0xbab7ca3500000000000000000000000000000000000000000000000000000000;
        revert(aurNum());
    }
}

function rescueTokens(address _token) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    require(_owner == msg.sender, OwnableUnauthorizedAccount(msg.sender));
    v0, /* uint256 */ v1 = _token.balanceOf(address(this)).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v2 = v3 = _token.transfer(_owner, v1).gas(msg.gas);
    if (!(v3 & (MEM[0] == 1))) {
        require(!(!v3 & 0x1), MEM[64], RETURNDATASIZE());
        v2 = v3 & (!RETURNDATASIZE() & (_token.code.size > 0));
    }
    require(v2, SafeERC20FailedOperation(_token));
}

function 0x1ee5(uint256 varg0, address varg1, uint256 varg2) private { 
    v0 = varg2.transfer(varg1, varg0).gas(msg.gas);
    if (!(v0 & (MEM[0] == 1))) {
        require(!(!v0 & 0x1), MEM[64], RETURNDATASIZE());
        v0 = v1 = v0 & (!RETURNDATASIZE() & (varg2.code.size > 0));
    }
    require(v0, SafeERC20FailedOperation(address(varg2)));
    return ;
}

function 0x1f38() private { 
    require(stor_9b779b17422d0df92223018b32b4d1fa46e071723d6817e2486d003becc55f00 != 2, ReentrancyGuardReentrantCall());
    stor_9b779b17422d0df92223018b32b4d1fa46e071723d6817e2486d003becc55f00 = 2;
    return ;
}

function 0x1f5a(address varg0, address varg1) private { 
    v0 = v1 = !_approvedSellers[varg1];
    if (_approvedSellers[varg1]) {
        v0 = v2 = mapping_1[varg1];
    }
    require(!v0, aurNum());
    v3 = v4 = !mapping_2[varg0];
    if (mapping_2[varg0]) {
        v3 = v5 = mapping_3[varg0];
    }
    require(!v3);
    v6, /* uint256 */ v7 = varg0.balanceOf(msg.sender).gas(msg.gas);
    require(bool(v6), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v7 - 0);
    return ;
}

function 0x0a33e9be(address varg0, address varg1, bytes varg2) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 96);
    require(varg2 <= uint64.max);
    require(4 + varg2 + 31 < 4 + (msg.data.length - 4));
    require(varg2.length <= uint64.max);
    require(varg2.data + varg2.length <= 4 + (msg.data.length - 4));
    v0 = v1 = !_approvedSellers[msg.sender];
    if (_approvedSellers[msg.sender]) {
        v0 = mapping_1[msg.sender];
    }
    require(!v0, aurNum());
    v2 = v3 = !mapping_2[varg1];
    if (mapping_2[varg1]) {
        v2 = mapping_3[varg1];
    }
    require(!v2);
    v4, /* uint256 */ v5 = varg1.balanceOf(varg0).gas(msg.gas);
    require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v5 - 0);
    CALLDATACOPY(v6.data, varg2.data, varg2.length);
    MEM[v6.data + varg2.length] = 0;
    v7, /* uint256 */ v8 = varg0.call(v6.data).gas(msg.gas);
    if (RETURNDATASIZE() != 0) {
        v9 = new bytes[](RETURNDATASIZE());
        RETURNDATACOPY(v9.data, 0, RETURNDATASIZE());
    }
    require(v7, TransferFailed());
}

function 0x21b3(uint256 varg0, address varg1, address varg2, uint256 varg3) private { 
    v0 = v1 = varg3.transferFrom(varg2, varg1, varg0).gas(msg.gas);
    if (!(v1 & (MEM[0] == 1))) {
        require(!(!v1 & 0x1), MEM[64], RETURNDATASIZE());
        v0 = v2 = v1 & (!RETURNDATASIZE() & (varg3.code.size > 0));
    }
    MEM[96] = 0;
    require(v0, SafeERC20FailedOperation(address(varg3)));
    return ;
}

function 0x2208(uint256 varg0, uint256 varg1, address varg2) private { 
    if (varg2 - address(0xdac17f958d2ee523a2206206994597c13d831ec7)) {
        v0 = 0x2ffe(0, varg1, 0x68b3465833fb72a70ecdf485e0e4c7bd8665fc45, varg2);
        if (!v0) {
            v1 = 0x2ffe(1, 0, 0x68b3465833fb72a70ecdf485e0e4c7bd8665fc45, varg2);
            require(v1, SafeERC20FailedOperation(varg2));
            v2 = 0x2ffe(1, varg1, 0x68b3465833fb72a70ecdf485e0e4c7bd8665fc45, varg2);
            require(v2, SafeERC20FailedOperation(varg2));
        }
        if (varg2 - address(0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48)) {
            require(!(varg2 - address(0x2260fac5e5542a773aa44fbcfedf7c193bc2c599)), UnsupportedToken());
            MEM[64] += 128;
            MEM[32 + MEM[64]] = 0x2260fac5e5542a773aa44fbcfedf7c193bc2c599000000000000000000000000;
            MEM[32 + MEM[64] + 20] = 0xbb80000000000000000000000000000000000000000000000000000000000;
            MEM[32 + MEM[64] + 20 + 3] = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2000000000000000000000000;
            MEM[32 + MEM[64] + 20 + 3 + 20] = 0xbb80000000000000000000000000000000000000000000000000000000000;
            MEM[32 + MEM[64] + 20 + 3 + 20 + 3] = 0xdac17f958d2ee523a2206206994597c13d831ec7000000000000000000000000;
            MEM[MEM[64]] = 66;
            v3 = new uint256[](128);
            MEM[v3 + 128] = MEM[MEM[64]];
            MCOPY(v3 + 128 + 32, MEM[64] + 32, MEM[MEM[64]]);
            MEM[v3 + 128 + 32 + MEM[MEM[64]]] = 0;
            MEM[v3.data] = address(this);
            MEM[v3 + 64] = varg1;
            v4 = new uint256[](varg0);
            v5, /* uint256 */ v6 = address(0x68b3465833fb72a70ecdf485e0e4c7bd8665fc45).exactInput(v3, v4).gas(msg.gas);
            require(bool(v5), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            return v6;
        } else {
            v7, /* uint256 */ v8 = address(0x68b3465833fb72a70ecdf485e0e4c7bd8665fc45).exactInputSingle(address(0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48), address(0xdac17f958d2ee523a2206206994597c13d831ec7), uint24(100), address(this), varg1, varg0, address(0x0)).gas(msg.gas);
            require(bool(v7), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
            MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            return v8;
        }
    } else {
        require(varg1 >= varg0, InsufficientOutput());
        return varg1;
    }
}

function rescueETH() public nonPayable { 
    require(_owner == msg.sender, OwnableUnauthorizedAccount(msg.sender));
    v0, /* uint256 */ v1 = _owner.call().value(this.balance).gas(msg.gas);
    if (RETURNDATASIZE() != 0) {
        v2 = new bytes[](RETURNDATASIZE());
        RETURNDATACOPY(v2.data, 0, RETURNDATASIZE());
    }
    require(v0, TransferFailed());
}

function 0x2aba0266(uint256 varg0, address varg1, uint256 varg2, address varg3, address varg4, uint256 varg5, bytes varg6) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 224);
    require(varg6 <= uint64.max);
    require(4 + varg6 + 31 < 4 + (msg.data.length - 4));
    require(varg6.length <= uint64.max);
    require(varg6.data + varg6.length <= 4 + (msg.data.length - 4));
    0x1f38();
    0x1f5a(varg4, varg3);
    0x21b3(varg2, this, msg.sender, varg1);
    v0 = 0x2208(varg5, varg2, varg1);
    v1, /* uint256 */ v2 = varg4.overhead().gas(msg.gas);
    require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2615(v2, varg4, varg3, v0);
    v3 = new bytes[](varg6.length);
    CALLDATACOPY(v3.data, varg6.data, varg6.length);
    v3[varg6.length] = 0;
    emit 0xe36154de668f24bc41941f0c888c265782624d2de73e77ef2e9759a4af01fcbe(msg.sender, varg3, varg4, varg0, varg1, varg2, v0, v3);
    stor_9b779b17422d0df92223018b32b4d1fa46e071723d6817e2486d003becc55f00 = 1;
}

function 0x2615(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) private { 
    v0 = _SafeAdd(100, varg0);
    v1 = _SafeMul(varg3, varg0);
    v2 = _SafeDiv(v1, v0);
    v3 = _SafeSub(varg3, v2);
    v4 = _SafeAdd(100, 20);
    v5 = _SafeMul(v3, 20);
    v6 = _SafeDiv(v5, v4);
    v7 = _SafeSub(v3, v6);
    if (v2 > 0) {
        0x1ee5(v2, varg1, address(0xdac17f958d2ee523a2206206994597c13d831ec7));
    }
    if (v6 > 0) {
        0x1ee5(v6, 0x3855d35e3b2e7307fc0a82a64f2173d77cb437ce, address(0xdac17f958d2ee523a2206206994597c13d831ec7));
    }
    if (v7 > 0) {
        0x1ee5(v7, varg2, address(0xdac17f958d2ee523a2206206994597c13d831ec7));
    }
    return ;
}

function TREASURY() public nonPayable { 
    return address(0x3855d35e3b2e7307fc0a82a64f2173d77cb437ce);
}

function 0x2882(bytes varg0, uint256 varg1) private { 
    v0 = v1, /* uint256 */ v2 = address(varg1).proxiableUUID().gas(msg.gas);
    if (v1) {
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        v0 = v3 = 1;
    }
    require(v0, ERC1967InvalidImplementation(address(v2)));
    require(v2 == 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc, UUPSUnsupportedProxiableUUID(v2));
    require((address(v2)).code.size - 0, ERC1967InvalidImplementation(address(v2)));
    stor_360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc_0_19 = v2;
    emit Upgraded(address(v2));
    if (MEM[v2] <= 0) {
        require(msg.value <= 0, ERC1967NonPayable());
    } else {
        v4 = v5 = v2.delegatecall(MEM[v2882arg0x2 + 32:v2882arg0x2 + 32 + MEM[v2882arg0x2]], MEM[0:0]).gas(msg.gas);
        if (v5) {
            v4 = v6 = RETURNDATASIZE() > 0;
            if (RETURNDATASIZE() <= 0) {
                v4 = (address(v2)).code.size > 0;
            }
        }
        if (!v4) {
            require(!v5, AddressEmptyCode(address(v2)));
            require(RETURNDATASIZE() <= 0, MEM[64], RETURNDATASIZE());
            revert(FailedCall());
        } else {
            MEM[MEM[64]] = RETURNDATASIZE();
            RETURNDATACOPY(MEM[64] + 32, 0, RETURNDATASIZE());
            MEM[64] = MEM[64] + (32 + RETURNDATASIZE());
        }
    }
    return ;
}

function ROUTER() public nonPayable { 
    return address(0x68b3465833fb72a70ecdf485e0e4c7bd8665fc45);
}

function 0x2a27(address varg0) private { 
    _owner = varg0;
    emit OwnershipTransferred(_owner, varg0);
    return ;
}

function WBTC() public nonPayable { 
    return address(0x2260fac5e5542a773aa44fbcfedf7c193bc2c599);
}

function upgradeToAndCall(address newImplementation, bytes data) public payable { 
    require(4 + (msg.data.length - 4) - 4 >= 64);
    require(data <= uint64.max);
    require(4 + data + 31 < 4 + (msg.data.length - 4));
    require(data.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v0 = new bytes[](data.length);
    require(!((v0 + ((data.length + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v0 + ((data.length + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v0)), Panic(65)); // failed memory allocation (too much memory)
    require(data.data + data.length <= 4 + (msg.data.length - 4));
    CALLDATACOPY(v0.data, data.data, data.length);
    v0[data.length] = 0;
    0xcc7(v0, newImplementation);
}

function 0x2ffe(uint256 varg0, uint256 varg1, address varg2, uint256 varg3) private { 
    v0 = v1 = varg3.approve(varg2, varg1).gas(msg.gas);
    if (!(v1 & (MEM[0] == 1))) {
        require(!(!v1 & varg0), MEM[64], RETURNDATASIZE());
        v0 = v2 = v1 & (!RETURNDATASIZE() & (varg3.code.size > 0));
    }
    return v0;
}

function proxiableUUID() public nonPayable { 
    require(address(this) == address(0xffcbdccde6c498a9135b79a2388ea2e21ec5e5df), UUPSUnauthorizedCallContext());
    return 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;
}

function 0x550b3f8d(uint256 varg0, address varg1, address varg2, uint256 varg3, bytes varg4) public payable { 
    require(4 + (msg.data.length - 4) - 4 >= 160);
    require(varg4 <= uint64.max);
    require(4 + varg4 + 31 < 4 + (msg.data.length - 4));
    require(varg4.length <= uint64.max);
    require(varg4.data + varg4.length <= 4 + (msg.data.length - 4));
    0x1f38();
    require(msg.value - 0, NoETHSent());
    0x1f5a(varg2, varg1);
    v0, /* uint256 */ v1 = address(0x68b3465833fb72a70ecdf485e0e4c7bd8665fc45).exactInputSingle(address(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2), address(0xdac17f958d2ee523a2206206994597c13d831ec7), uint24(3000), address(this), msg.value, varg3, address(0x0)).value(msg.value).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v2, /* uint256 */ v3 = varg2.overhead().gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    0x2615(v3, varg2, varg1, v1);
    v4 = new bytes[](varg4.length);
    CALLDATACOPY(v4.data, varg4.data, varg4.length);
    v4[varg4.length] = 0;
    emit 0xe36154de668f24bc41941f0c888c265782624d2de73e77ef2e9759a4af01fcbe(msg.sender, varg1, varg2, varg0, address(0x0), msg.value, v1, v4);
    stor_9b779b17422d0df92223018b32b4d1fa46e071723d6817e2486d003becc55f00 = 1;
}

function renounceOwnership() public nonPayable { 
    require(_owner == msg.sender, OwnableUnauthorizedAccount(msg.sender));
    0x2a27(0);
}

function 0x73ced5e5(address varg0) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    require(_owner == msg.sender, OwnableUnauthorizedAccount(msg.sender));
    mapping_3[varg0] = 1;
    emit 0x9bb0ffc69396b0385186b3d89d98eb0e58cf785de95d5b312520ed06a8da83f9(varg0, mapping_2[varg0], True);
}

function 0x7ac286f1(address varg0) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    return mapping_1[varg0];
}

function 0x3b9b(uint256 varg0, uint256 varg1) private { 
    MEM[varg0] = varg0 + 32 - varg0;
    MEM[varg0 + 32] = varg1.length;
    v0 = v1 = varg0 + 32 + 32;
    v2 = v3 = v1 + (varg1.length << 5);
    v4 = v5 = varg1.data;
    v6 = v7 = 0;
    while (v6 < varg1.length) {
        MEM[v0] = v2 - v1;
        MEM[v2] = address(MEM[MEM[v4]]);
        MEM[v2 + 32] = v2 + 128 - v2;
        MEM[v2 + 128] = MEM[MEM[MEM[v4] + 32]];
        MCOPY(v2 + 128 + 32, MEM[MEM[v4] + 32] + 32, MEM[MEM[MEM[v4] + 32]]);
        MEM[v2 + 128 + 32 + MEM[MEM[MEM[v4] + 32]]] = 0;
        MEM[v2 + 64] = v2 + 128 + 32 + (MEM[MEM[MEM[v4] + 32]] + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) - v2;
        MEM[v2 + 128 + 32 + (MEM[MEM[MEM[v4] + 32]] + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0)] = MEM[MEM[MEM[v4] + 64]];
        MCOPY(v2 + 128 + 32 + (MEM[MEM[MEM[v4] + 32]] + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32, MEM[MEM[v4] + 64] + 32, MEM[MEM[MEM[v4] + 64]]);
        MEM[v2 + 128 + 32 + (MEM[MEM[MEM[v4] + 32]] + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + MEM[MEM[MEM[v4] + 64]]] = 0;
        v2 = v2 + 128 + 32 + (MEM[MEM[MEM[v4] + 32]] + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) + 32 + (MEM[MEM[MEM[v4] + 64]] + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
        MEM[v2 + 96] = MEM[MEM[v4] + 96];
        v4 = v4 + 32;
        v0 = v0 + 32;
        v6 = v6 + 1;
    }
    return v2;
}

function products(uint256 varg0) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    require(varg0 < _products.length);
    return (_products[varg0].field0, bytes(_products[varg0].field1), bytes(_products[varg0].field2));
}

function 0x3f0e(uint256 varg0) private { 
    v0 = v1 = varg0 >> 1;
    if (!(varg0 & 0x1)) {
        v0 = v2 = v1 & 0x7f;
    }
    require((varg0 & 0x1) - (v0 < 32), Panic(34)); // access to incorrectly encoded storage byte array
    return v0;
}

function initialize() public nonPayable { 
    0x122c();
}

function USDC() public nonPayable { 
    return address(0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48);
}

function owner() public nonPayable { 
    return _owner;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= varg0 + varg1, Panic(17)); // arithmetic overflow or underflow
    return varg0 + varg1;
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require(!varg0 | (varg1 == varg0 * varg1 / varg0), Panic(17)); // arithmetic overflow or underflow
    return varg0 * varg1;
}

function _SafeDiv(uint256 varg0, uint256 varg1) private { 
    require(varg1, Panic(18)); // division by zero
    return varg0 / varg1;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function 0x9039bd0e(address varg0) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    require(_owner == msg.sender, OwnableUnauthorizedAccount(msg.sender));
    mapping_2[varg0] = 1;
    mapping_3[varg0] = 0;
    emit 0x9bb0ffc69396b0385186b3d89d98eb0e58cf785de95d5b312520ed06a8da83f9(varg0, True, False);
}

function approvedSellers(address varg0) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    return _approvedSellers[varg0];
}

function 0xa9390aee(address varg0) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    return mapping_3[varg0];
}

function UPGRADE_INTERFACE_VERSION() public nonPayable { 
    v0 = new bytes[](v1.length);
    MCOPY(v0.data, v1.data, v1.length);
    v0[v1.length] = 0;
    return v0;
}

function WETH() public nonPayable { 
    return address(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
}

function 0xb46b39a9(address varg0) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    return mapping_2[varg0];
}

function getProducts() public nonPayable { 
    v0 = v1 = _products.length;
    require(v1 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v2 = new uint256[](v1);
    if (v1) {
        v3 = v4 = v2.data;
        do {
            v5 = new struct(4);
            v5.word0 = address(0x0);
            v5.word1 = 96;
            v5.word2 = 96;
            v5.word3 = 0;
            MEM[v3] = v5;
            v3 += 32;
            v0 = v0 - 1;
        } while (v0);
    }
    v6 = v7 = 0;
    v8 = v9 = 0;
    while (v8 < _products.length) {
        require(v8 < _products.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v11 = bytes(_products[v8].field1);
        require(64 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v17 = new bytes[](64);
        if (64) {
            CALLDATACOPY(v17.data, msg.data.length, 64);
        }
        v18 = 0;
        while (v18 < 64) {
            v19 = _SafeAdd(v18, 1);
            require(v19 < v11.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require(v18 < v17.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            MEM8[32 + v18 + v17] = (byte(bytes1(v11[v19] >> 248 << 248), 0x0)) & 0xFF;
            v18 += 1;
        }
        if (!mapping_1[address(keccak256(MEM[v59a0x2b66.data:v59a0x2b66.data + v59a0x2b66.length]))]) {
            v20 = new struct(4);
            v20.word0 = address(keccak256(MEM[v59a0x2b66.data:v59a0x2b66.data + v59a0x2b66.length]));
            require(v8 < _products.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            v20.word1 = bytes(_products[v8].field1);
            require(v8 < _products.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            v20.word2 = bytes(_products[v8].field2);
            require(v8 < _products.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            v20.word3 = _products[v8].field0;
            require(v6 < v2.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            v2[v6] = v20;
            require(v6 - uint256.max, Panic(17)); // arithmetic overflow or underflow
            v6 = v6 + 1;
        }
        v8 += 1;
    }
    v35 = 0x3b9b(MEM[64], v2);
    return MEM[MEM[64]:MEM[64] + v5ba_0x0 - MEM[64]];
}

function USDT() public nonPayable { 
    return address(0xdac17f958d2ee523a2206206994597c13d831ec7);
}

function addSeller(address _seller) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    require(_owner == msg.sender, OwnableUnauthorizedAccount(msg.sender));
    _approvedSellers[_seller] = 1;
    mapping_1[_seller] = 0;
    emit 0x464e5dc308e526f9fc18be094f924f0cbbaacbf1472b461ea1e512f5a1e1f38d(_seller, True, False);
}

function blacklistSeller(address _seller) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    require(_owner == msg.sender, OwnableUnauthorizedAccount(msg.sender));
    mapping_1[_seller] = 1;
    emit 0x464e5dc308e526f9fc18be094f924f0cbbaacbf1472b461ea1e512f5a1e1f38d(_seller, _approvedSellers[_seller], True);
}

function 0xe775137c(bytes varg0, bytes varg1) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 64);
    require(varg0 <= uint64.max);
    require(4 + varg0 + 31 < 4 + (msg.data.length - 4));
    require(varg0.length <= uint64.max);
    require(varg0.data + varg0.length <= 4 + (msg.data.length - 4));
    require(varg1 <= uint64.max);
    require(4 + varg1 + 31 < 4 + (msg.data.length - 4));
    require(varg1.length <= uint64.max);
    require(varg1.data + varg1.length <= 4 + (msg.data.length - 4));
    0x1b22(varg1.length, varg1.data, varg0.length, varg0.data);
}

function TREASURY_CUT() public nonPayable { 
    return 20;
}

function transferOwnership(address newOwner) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    require(_owner == msg.sender, OwnableUnauthorizedAccount(msg.sender));
    require(newOwner - address(0x0), OwnableInvalidOwner(address(0x0)));
    0x2a27(newOwner);
}

function 0xcc7(bytes varg0, uint256 varg1) private { 
    v0 = v1 = address(this) == address(0xffcbdccde6c498a9135b79a2388ea2e21ec5e5df);
    if (address(this) != address(0xffcbdccde6c498a9135b79a2388ea2e21ec5e5df)) {
        v0 = stor_360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc_0_19 != address(0xffcbdccde6c498a9135b79a2388ea2e21ec5e5df);
    }
    require(!v0, UUPSUnauthorizedCallContext());
    require(_owner == msg.sender, OwnableUnauthorizedAccount(msg.sender));
    0x2882(varg0, varg1);
    return ;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        require(!msg.data.length);
        receive();
    } else {
        v0 = function_selector >> 224;
        if (0x89a30271 > v0) {
            if (0x4f1ef286 > v0) {
                if (0x2aba0266 > v0) {
                    if (0xae3bf8 == v0) {
                        rescueTokens(address);
                    } else if (0xa33e9be == v0) {
                        0x0a33e9be();
                    } else {
                        require(0x20800a00 == v0);
                        rescueETH();
                    }
                } else if (0x2aba0266 == v0) {
                    0x2aba0266();
                } else if (0x2d2c5565 == v0) {
                    TREASURY();
                } else if (0x32fe7b26 == v0) {
                    ROUTER();
                } else {
                    require(0x4dede3de == v0);
                    WBTC();
                }
            } else if (0x73ced5e5 > v0) {
                if (0x4f1ef286 == v0) {
                    upgradeToAndCall(address,bytes);
                } else if (0x52d1902d == v0) {
                    proxiableUUID();
                } else if (0x550b3f8d == v0) {
                    0x550b3f8d();
                } else {
                    require(0x715018a6 == v0);
                    renounceOwnership();
                }
            } else if (0x73ced5e5 == v0) {
                0x73ced5e5();
            } else if (0x7ac286f1 == v0) {
                0x7ac286f1();
            } else if (0x7acc0b20 == v0) {
                products(uint256);
            } else {
                require(0x8129fc1c == v0);
                initialize();
            }
        } else if (0xb46b39a9 > v0) {
            if (0x931e52ee > v0) {
                if (0x89a30271 == v0) {
                    USDC();
                } else if (0x8da5cb5b == v0) {
                    owner();
                } else {
                    require(0x9039bd0e == v0);
                    0x9039bd0e();
                }
            } else if (0x931e52ee == v0) {
                approvedSellers(address);
            } else if (0xa9390aee == v0) {
                0xa9390aee();
            } else if (0xad3cb1cc == v0) {
                UPGRADE_INTERFACE_VERSION();
            } else {
                require(0xad5c4648 == v0);
                WETH();
            }
        } else if (0xdb1e8924 > v0) {
            if (0xb46b39a9 == v0) {
                0xb46b39a9();
            } else if (0xc29b2f20 == v0) {
                getProducts();
            } else if (0xc54e44eb == v0) {
                USDT();
            } else {
                require(0xd93fabfa == v0);
                addSeller(address);
            }
        } else if (0xdb1e8924 == v0) {
            blacklistSeller(address);
        } else if (0xe775137c == v0) {
            0xe775137c();
        } else if (0xf166bf48 == v0) {
            TREASURY_CUT();
        } else {
            require(0xf2fde38b == v0);
            transferOwnership(address);
        }
    }
}
