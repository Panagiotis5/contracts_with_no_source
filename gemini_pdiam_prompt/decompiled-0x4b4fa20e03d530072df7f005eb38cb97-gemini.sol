// Decompiled by library.dedaub.com
// 2025.12.17 03:48 UTC
// Compiled using the solidity compiler version 0.8.25


// Data structures and variables inferred from the use of storage instructions
address _owner; // STORAGE[0x0] bytes 0 to 19


// Events
OwnershipTransferred(address, address);

function 0xa19b0ac0() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0x28b5a0e9c621a5badaa536219b3a228c8168cf5d;
}

function 0x9085dca2(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    v0 = 0x568(varg0);
    v1 = new bytes[](v0.word0.length);
    MCOPY(v1.data, v0.data, v0.word0.length);
    v1[v0.word0.length] = 0;
    return v1;
}

function owner() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return _owner;
}

function USDC() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48;
}

function bridge(address _token, address _to, uint256 _amount) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(!(msg.sender - _owner), OwnableUnauthorizedAccount(msg.sender));
    require(!(_token - 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48), Error('Invalid asset'));
    if (uint256.max == _amount) {
        v0 = MEM[64];
        v1, v2 = 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48.balanceOf(this).gas(msg.gas);
        require(v1, MEM[64], RETURNDATASIZE());
        v2 = v3 = 0;
        if (v1) {
            v4 = v5 = 32;
            if (32 > RETURNDATASIZE()) {
                v4 = v6 = RETURNDATASIZE();
            }
            require(!((v0 + (v4 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v0 + (v4 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v0)), Panic(65)); // failed memory allocation (too much memory)
            require(v0 + v4 - v0 >= 32);
        }
    }
    v7 = MEM[64];
    v8 = v9 = 32;
    v10, v11 = 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48.approve(0x28b5a0e9c621a5badaa536219b3a228c8168cf5d, v2).gas(msg.gas);
    require(v10, MEM[64], RETURNDATASIZE());
    if (v10) {
        if (v9 > RETURNDATASIZE()) {
            v8 = v12 = RETURNDATASIZE();
        }
        require(!((v7 + (v8 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v7 + (v8 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v7)), Panic(65)); // failed memory allocation (too much memory)
        require(v7 + v8 - v7 >= v9);
        require(!0xf6a1584d00000000000000000000000000000000000000000000000000000001);
    }
    require(!0, Panic(65)); // failed memory allocation (too much memory)
    if (v13.length < v9) {
        v14 = v15 = uint256(v16);
    }
    v17 = 0x568(_to);
    require(0x28b5a0e9c621a5badaa536219b3a228c8168cf5d.code.size);
    v18 = MEM[64];
    v19 = new bytes[](v17.word0.length);
    MCOPY(v19.data, v17.data, v17.word0.length);
    v19[v17.word0.length] = 0;
    v20, /* uint256 */ v21 = 0x28b5a0e9c621a5badaa536219b3a228c8168cf5d.call(0x779b432d, v2, 19, v14, 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48, v14, 0x7a120, 2000, v19).gas(msg.gas);
    require(v20, v21, RETURNDATASIZE());
    if (v20) {
        require(v18 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = v18;
        exit;
    } else {
        return ;
    }
}

function renounceOwnership() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    require(!(msg.sender - _owner), OwnableUnauthorizedAccount(msg.sender));
    _owner = 0;
    emit OwnershipTransferred(_owner, 0);
}

function 0x0b5c5bbc() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0xb21d281dedb17ae5b501f6aa8256fe38c4e45757;
}

function 0x568(uint256 varg0) private { 
    v0 = new struct(3);
    v1 = v0.data;
    v0.word1 = 'cctp-forward';
    MEM[v0 + 56] = 0;
    MEM[v0 + 60] = 0x1800000000000000000000000000000000000000000000000000000000;
    v0.word2 = bytes20(varg0 << 96);
    MEM[v0 + 84] = 0;
    v0.word0 = 56;
    require(!((v0 + 96 > uint64.max) | (v0 + 96 < v0)), Panic(65)); // failed memory allocation (too much memory)
    if (0) {
        MEM[v0 + 96] = 0x8c379a000000000000000000000000000000000000000000000000000000000;
        MEM[v0 + 100] = 32;
        revert(Error('Invalid hook data length'));
    } else {
        return v0;
    }
}

function transferOwnership(address newOwner) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(!(msg.sender - _owner), OwnableUnauthorizedAccount(msg.sender));
    require(newOwner, OwnableInvalidOwner(0));
    _owner = newOwner;
    emit OwnershipTransferred(_owner, newOwner);
    return ;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    require(msg.data.length >= 4);
    if (0xb5c5bbc == function_selector >> 224) {
        0x0b5c5bbc();
    } else if (0x715018a6 == function_selector >> 224) {
        renounceOwnership();
    } else if (0x87121759 == function_selector >> 224) {
        bridge(address,address,uint256);
    } else if (0x89a30271 == function_selector >> 224) {
        USDC();
    } else if (0x8da5cb5b == function_selector >> 224) {
        owner();
    } else if (0x9085dca2 == function_selector >> 224) {
        0x9085dca2(function_selector >> 224, 4, 64);
    } else if (0xa19b0ac0 == function_selector >> 224) {
        0xa19b0ac0(function_selector >> 224, 4, 64);
    } else {
        require(0xf2fde38b == function_selector >> 224);
        transferOwnership(address);
    }
}
