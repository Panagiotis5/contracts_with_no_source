// Decompiled by library.dedaub.com
// 2025.12.17 03:56 UTC
// Compiled using the solidity compiler version 0.8.20


// Data structures and variables inferred from the use of storage instructions
uint256 stor_1; // STORAGE[0x1]
uint256 _minProfit; // STORAGE[0x2]
mapping (address => bool) _approvedRouters; // STORAGE[0x3]
address _owner; // STORAGE[0x0] bytes 0 to 19


// Events
OwnershipTransferred(address, address);
EmergencyWithdraw(address, uint256);

function 0x11a8() private { 
    require(stor_1 != 2, ReentrancyGuardReentrantCall());
    stor_1 = 2;
    return ;
}

function 0x1225(address varg0, address varg1, uint256 varg2) private { 
    v0 = new bytes[](68);
    MEM[v0.data] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
    MEM[v0 + 36] = varg1;
    MEM[v0 + 68] = varg2;
    require(!((v0 + 128 > uint64.max) | (v0 + 128 < v0)), Panic(65)); // failed memory allocation (too much memory)
    v1 = v0.length;
    v2 = v0.data;
    v3, /* uint256 */ v4 = varg0.transfer(varg1, varg2).gas(msg.gas);
    if (!RETURNDATASIZE()) {
        v5 = v6 = 96;
    } else {
        require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v5 = new bytes[](RETURNDATASIZE());
        require(!((v5 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v5 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v5)), Panic(65)); // failed memory allocation (too much memory)
        v4 = v5.data;
        RETURNDATACOPY(v4, 0, RETURNDATASIZE());
    }
    if (v3) {
        v7 = v8 = !MEM[v5];
        if (v8) {
            v7 = v9 = !varg0.code.size;
        }
        require(!v7, AddressEmptyCode(varg0));
        v10 = v11 = bool(MEM[v5]);
        if (v11) {
            require(v5 + MEM[v5] + 32 - (v5 + 32) >= 32);
            require(!(MEM[v5 + 32] - bool(MEM[v5 + 32])));
            v10 = v12 = !MEM[v5 + 32];
        }
        require(!v10, SafeERC20FailedOperation(varg0));
        return ;
    } else {
        require(!MEM[v5], 32 + v5, MEM[v5]);
        revert(FailedInnerCall());
    }
}

function uniswapV3FlashCallback(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(varg1 <= uint64.max);
    require(4 + varg1 + 31 < msg.data.length);
    require(msg.data[4 + varg1] <= uint64.max);
    require(v0.data <= msg.data.length);
    require(4 + varg1 + 32 + msg.data[4 + varg1] - (4 + varg1 + 32) >= 128);
    require(!(varg1.word1 - address(varg1.word1)));
    require(!(varg1.word3 - address(varg1.word3)));
    require(varg1.word4 <= uint64.max);
    require(4 + varg1 + 32 + varg1.word4 + 31 < 4 + varg1 + 32 + msg.data[4 + varg1]);
    require(msg.data[4 + varg1 + 32 + varg1.word4] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v1 = new bytes[](msg.data[4 + varg1 + 32 + varg1.word4]);
    require(!((v1 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + msg.data[4 + varg1 + 32 + varg1.word4]) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v1 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + msg.data[4 + varg1 + 32 + varg1.word4]) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v1)), Panic(65)); // failed memory allocation (too much memory)
    require(4 + varg1 + 32 + varg1.word4 + msg.data[4 + varg1 + 32 + varg1.word4] + 32 <= 4 + varg1 + 32 + msg.data[4 + varg1]);
    CALLDATACOPY(v1.data, 4 + varg1 + 32 + varg1.word4 + 32, msg.data[4 + varg1 + 32 + varg1.word4]);
    v1[msg.data[4 + varg1 + 32 + varg1.word4]] = 0;
    0xf3a(address(varg1.word1), address(varg1.word3), varg1.word2);
    v2, /* uint256 */ v3 = address(varg1.word3).call(MEM[v11fdV0x1cf.data:v11fdV0x1cf.data + v11fdV0x1cf.length], MEM[0:0]).gas(msg.gas);
    if (RETURNDATASIZE()) {
        require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v4 = v5 = new bytes[](RETURNDATASIZE());
        require(!((v5 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v5 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v5)), Panic(65)); // failed memory allocation (too much memory)
        v3 = v5.data;
        RETURNDATACOPY(v3, 0, RETURNDATASIZE());
    }
    require(v2, SwapFailed());
    v6 = _SafeAdd(varg1.word2, varg0);
    0x1225(address(varg1.word1), msg.sender, v6);
    return ;
}

function setApprovedRouter(address _manager, bool _isActive) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(!(msg.sender - _owner), OwnableUnauthorizedAccount(msg.sender));
    require(_manager, ZeroAddress());
    _approvedRouters[_manager] = _isActive;
    return ;
}

function 0xbe34c766(address varg0, address varg1, uint256 varg2, bytes varg3) public nonPayable { 
    require(msg.data.length - 4 >= 128);
    require(varg3 <= uint64.max);
    require(4 + varg3 + 31 < msg.data.length);
    require(varg3.length <= uint64.max);
    require(4 + varg3 + varg3.length + 32 <= msg.data.length);
    0x11a8();
    require(!(msg.sender - _owner), OwnableUnauthorizedAccount(msg.sender));
    v0 = v1 = !varg0;
    if (bool(varg0)) {
        v0 = v2 = !varg1;
    }
    require(!v0, ZeroAddress());
    require(varg2, ZeroAmount());
    require(varg0.code.size);
    v3 = new uint256[](varg3.length);
    CALLDATACOPY(v3.data, varg3.data, varg3.length);
    MEM[164 + (varg3.length + MEM[64])] = 0;
    v4, /* uint256 */ v5 = varg0.flash(this, varg2, 0, v3).gas(msg.gas);
    require(v4, v5, RETURNDATASIZE());
    if (v4) {
        require(MEM[64] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        MEM[64] = MEM[64];
    }
    stor_1 = 1;
    return ;
}

function WETH() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2;
}

function owner() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return _owner;
}

function setMinProfit(uint256 _minAcceptableProfit) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(!(msg.sender - _owner), OwnableUnauthorizedAccount(msg.sender));
    _minProfit = _minAcceptableProfit;
    return ;
}

function minProfit() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return _minProfit;
}

function renounceOwnership() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    require(!(msg.sender - _owner), OwnableUnauthorizedAccount(msg.sender));
    _owner = 0;
    emit OwnershipTransferred(_owner, 0);
    return ;
}

function emergencyWithdraw(address _receiver) public nonPayable { 
    v0 = v1 = 32;
    require(msg.data.length - 4 >= v1);
    require(!(msg.sender - _owner), OwnableUnauthorizedAccount(msg.sender));
    if (_receiver) {
        v2, /* uint256 */ v3 = _receiver.balanceOf(this).gas(msg.gas);
        require(v2, MEM[64], RETURNDATASIZE());
        if (v2) {
            if (v1 > RETURNDATASIZE()) {
                v0 = v4 = RETURNDATASIZE();
            }
            require(!((MEM[64] + (v0 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (v0 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
            require(MEM[64] + v0 - MEM[64] >= v1);
        }
        0x1225(_receiver, _owner, v3);
        emit EmergencyWithdraw(_receiver, v3);
        return ;
    } else {
        v5, /* uint256 */ v6 = _owner.call().value(this.balance).gas(msg.gas);
        if (RETURNDATASIZE()) {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v7 = v8 = new bytes[](RETURNDATASIZE());
            require(!((v8 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v8 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v8)), Panic(65)); // failed memory allocation (too much memory)
            v6 = v8.data;
            RETURNDATACOPY(v6, 0, RETURNDATASIZE());
        }
        require(v5, Error('ETH transfer failed'));
        emit EmergencyWithdraw(0, this.balance);
        return ;
    }
}

function 0x6c12f386() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0x68b3465833fb72a70ecdf485e0e4c7bd8665fc45;
}

function 0x62337027(address varg0, address varg1, uint256 varg2, address varg3, address varg4, bytes varg5, bytes varg6, uint256 varg7) public nonPayable { 
    require(msg.data.length - 4 >= uint8.max + 1);
    require(varg5 <= uint64.max);
    require(4 + varg5 + 31 < msg.data.length);
    require(varg5.length <= uint64.max);
    require(4 + varg5 + varg5.length + 32 <= msg.data.length);
    require(varg6 <= uint64.max);
    require(4 + varg6 + 31 < msg.data.length);
    require(varg6.length <= uint64.max);
    require(4 + varg6 + varg6.length + 32 <= msg.data.length);
    0x11a8();
    require(!(msg.sender - _owner), OwnableUnauthorizedAccount(msg.sender));
    v0 = v1 = !varg0;
    if (bool(varg0)) {
        v0 = v2 = !varg1;
    }
    require(!v0, ZeroAddress());
    require(varg2, ZeroAmount());
    v3 = v4 = 32;
    v5 = v6 = !_approvedRouters[varg3];
    if (_approvedRouters[varg3]) {
        v5 = v7 = !_approvedRouters[varg4];
    }
    require(!v5, InvalidPath());
    v8, /* uint256 */ v9 = varg0.balanceOf(this).gas(msg.gas);
    require(v8, MEM[64], RETURNDATASIZE());
    if (v8) {
        if (v4 > RETURNDATASIZE()) {
            v3 = v10 = RETURNDATASIZE();
        }
        require(!((MEM[64] + (v3 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (v3 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
        require(MEM[64] + v3 - MEM[64] >= v4);
    }
    0xf3a(varg0, varg3, varg2);
    CALLDATACOPY(v11.data, varg5.data, varg5.length);
    MEM[v11.data + varg5.length] = 0;
    v12, /* uint256 */ v13 = varg3.call(v11.data).gas(msg.gas);
    if (RETURNDATASIZE()) {
        require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v14 = v15 = new bytes[](RETURNDATASIZE());
        require(!((v15 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v15 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v15)), Panic(65)); // failed memory allocation (too much memory)
        v13 = v15.data;
        RETURNDATACOPY(v13, 0, RETURNDATASIZE());
    }
    require(v12, SwapFailed());
    v16, /* uint256 */ v9 = varg1.balanceOf(this).gas(msg.gas);
    require(v16, MEM[64], RETURNDATASIZE());
    if (v16) {
        if (v4 > RETURNDATASIZE()) {
            v3 = v17 = RETURNDATASIZE();
        }
        require(!((MEM[64] + (v3 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (v3 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
        require(MEM[64] + v3 - MEM[64] >= v4);
    }
    0xf3a(varg1, varg4, v9);
    CALLDATACOPY(v18.data, varg6.data, varg6.length);
    MEM[v18.data + varg6.length] = 0;
    v19, /* uint256 */ v20 = varg4.call(v18.data).gas(msg.gas);
    if (RETURNDATASIZE()) {
        require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v21 = v22 = new bytes[](RETURNDATASIZE());
        require(!((v22 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v22 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v22)), Panic(65)); // failed memory allocation (too much memory)
        v20 = v22.data;
        RETURNDATACOPY(v20, 0, RETURNDATASIZE());
    }
    require(v19, SwapFailed());
    v23, /* uint256 */ v9 = varg0.balanceOf(this).gas(msg.gas);
    require(v23, MEM[64], RETURNDATASIZE());
    if (v23) {
        if (v4 > RETURNDATASIZE()) {
            v3 = v24 = RETURNDATASIZE();
        }
        require(!((MEM[64] + (v3 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (v3 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
        require(MEM[64] + v3 - MEM[64] >= v4);
    }
    if (v9 > v9) {
        v9 = v25 = _SafeSub(v9, v9);
    }
    v26 = v27 = _minProfit;
    if (varg7 > v27) {
    }
    require(v9 >= v26, InsufficientProfit());
    emit 0x766728be372c898c13c663da63b59fdfeb89dab2a81d4afe3177eb038ee0dcd2(varg0, varg1, varg2, v9, v9, block.timestamp);
    stor_1 = 1;
    return ;
}

function receive() public payable { 
}

function approvedRouters(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    return _approvedRouters[varg0];
}

function UNISWAP_V3_ROUTER() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0xe592427a0aece92de3edee1f18e0157c05861564;
}

function SUSHISWAP_ROUTER() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return 0xd9e1ce17f2641f24ae83637ab66a2cca9c378b9f;
}

function 0x005769e8(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 <= uint64.max);
    require(varg0 + 35 < msg.data.length);
    require(varg0.length <= uint64.max);
    require(varg0 + (varg0.length << 5) + 36 <= msg.data.length);
    0x11a8();
    require(!(msg.sender - _owner), OwnableUnauthorizedAccount(msg.sender));
    require(varg0.length >= 2, InvalidPath());
    require(varg1, ZeroAmount());
    require(varg0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    require(msg.data[varg0 + 36] < msg.data.length - varg0 - 67);
    require(msg.data[varg0 + msg.data[varg0 + 36] + 36] <= uint64.max);
    require(varg0 + msg.data[varg0 + 36] + 68 <= msg.data.length - msg.data[varg0 + msg.data[varg0 + 36] + 36]);
    require(68 + (msg.data[varg0 + msg.data[varg0 + 36] + 36] + (varg0 + msg.data[varg0 + 36])) - (varg0 + msg.data[varg0 + 36] + 68) >= 96);
    require(!(msg.data[varg0 + msg.data[varg0 + 36] + 68] - address(msg.data[varg0 + msg.data[varg0 + 36] + 68])));
    require(!(msg.data[varg0 + msg.data[varg0 + 36] + 68 + 32] - address(msg.data[varg0 + msg.data[varg0 + 36] + 68 + 32])));
    require(msg.data[varg0 + msg.data[varg0 + 36] + 68 + 64] <= uint64.max);
    require(varg0 + msg.data[varg0 + 36] + 68 + msg.data[varg0 + msg.data[varg0 + 36] + 68 + 64] + 31 < 68 + (msg.data[varg0 + msg.data[varg0 + 36] + 36] + (varg0 + msg.data[varg0 + 36])));
    require(msg.data[varg0 + msg.data[varg0 + 36] + 68 + msg.data[varg0 + msg.data[varg0 + 36] + 68 + 64]] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v0 = new bytes[](msg.data[varg0 + msg.data[varg0 + 36] + 68 + msg.data[varg0 + msg.data[varg0 + 36] + 68 + 64]]);
    require(!((v0 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + msg.data[varg0 + msg.data[varg0 + 36] + 68 + msg.data[varg0 + msg.data[varg0 + 36] + 68 + 64]]) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v0 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + msg.data[varg0 + msg.data[varg0 + 36] + 68 + msg.data[varg0 + msg.data[varg0 + 36] + 68 + 64]]) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v0)), Panic(65)); // failed memory allocation (too much memory)
    require(varg0 + msg.data[varg0 + 36] + 68 + msg.data[varg0 + msg.data[varg0 + 36] + 68 + 64] + msg.data[varg0 + msg.data[varg0 + 36] + 68 + msg.data[varg0 + msg.data[varg0 + 36] + 68 + 64]] + 32 <= 68 + (msg.data[varg0 + msg.data[varg0 + 36] + 36] + (varg0 + msg.data[varg0 + 36])));
    CALLDATACOPY(v0.data, varg0 + msg.data[varg0 + 36] + 68 + msg.data[varg0 + msg.data[varg0 + 36] + 68 + 64] + 32, msg.data[varg0 + msg.data[varg0 + 36] + 68 + msg.data[varg0 + msg.data[varg0 + 36] + 68 + 64]]);
    v0[msg.data[varg0 + msg.data[varg0 + 36] + 68 + msg.data[varg0 + msg.data[varg0 + 36] + 68 + 64]]] = 0;
    v1, /* uint256 */ v2 = address(msg.data[varg0 + msg.data[varg0 + 36] + 68]).balanceOf(this).gas(msg.gas);
    require(v1, MEM[64], RETURNDATASIZE());
    if (v1) {
        v3 = v4 = 32;
        if (32 > RETURNDATASIZE()) {
            v3 = v5 = RETURNDATASIZE();
        }
        require(!((MEM[64] + (v3 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (v3 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
        require(MEM[64] + v3 - MEM[64] >= 32);
    }
    while (v2 < varg0.length) {
        require(msg.data[varg0 + (v2 << 5) + 36] < msg.data.length - varg0 - 67);
        require(msg.data[varg0 + msg.data[varg0 + (v2 << 5) + 36] + 36] <= uint64.max);
        v6 = msg.data[36 + (varg0 + (v2 << 5))] + varg0 + 68;
        require(v6 <= msg.data.length - msg.data[msg.data[36 + (varg0 + (v2 << 5))] + varg0 + 36]);
        v7 = msg.data[msg.data[36 + (varg0 + (v2 << 5))] + varg0 + 36] + (msg.data[36 + (varg0 + (v2 << 5))] + varg0) + 68;
        require(v7 - v6 >= 96);
        require(!(msg.data[v6] - address(msg.data[v6])));
        require(!(msg.data[v6 + 32] - address(msg.data[v6 + 32])));
        require(msg.data[v6 + 64] <= uint64.max);
        require(v6 + msg.data[v6 + 64] + 31 < v7);
        require(msg.data[v6 + msg.data[v6 + 64]] <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v8 = new bytes[](msg.data[v6 + msg.data[v6 + 64]]);
        require(!((v8 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + msg.data[v6 + msg.data[v6 + 64]]) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v8 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + msg.data[v6 + msg.data[v6 + 64]]) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v8)), Panic(65)); // failed memory allocation (too much memory)
        require(v6 + msg.data[v6 + 64] + msg.data[v6 + msg.data[v6 + 64]] + 32 <= v7);
        CALLDATACOPY(v8.data, v6 + msg.data[v6 + 64] + 32, msg.data[v6 + msg.data[v6 + 64]]);
        v8[msg.data[v6 + msg.data[v6 + 64]]] = 0;
        require(_approvedRouters[address(msg.data[v6 + 32])], InvalidPath());
        v9, /* uint256 */ v2 = address(msg.data[v6]).balanceOf(this).gas(msg.gas);
        require(v9, MEM[64], RETURNDATASIZE());
        if (v9) {
            v10 = v11 = 32;
            if (32 > RETURNDATASIZE()) {
                v10 = v12 = RETURNDATASIZE();
            }
            require(!((MEM[64] + (v10 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (v10 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
            require(MEM[64] + v10 - MEM[64] >= 32);
        }
        0xf3a(address(msg.data[v6]), address(msg.data[v6 + 32]), v2);
        v13, /* uint256 */ v14, /* uint256 */ v15 = address(msg.data[v6 + 32]).call(MEM[v11fdV0x129aV0xcaa.data:v11fdV0x129aV0xcaa.data + v11fdV0x129aV0xcaa.length], MEM[0:0]).gas(msg.gas);
        if (RETURNDATASIZE()) {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v16 = v17 = new bytes[](RETURNDATASIZE());
            require(!((v17 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v17 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v17)), Panic(65)); // failed memory allocation (too much memory)
            v15 = v17.data;
            RETURNDATACOPY(v15, 0, RETURNDATASIZE());
        }
        require(v13, SwapFailed());
        require(v2 != uint256.max, Panic(17)); // arithmetic overflow or underflow
        v2 += 1;
    }
    v18, /* uint256 */ v2 = address(msg.data[varg0 + msg.data[varg0 + 36] + 68]).balanceOf(this).gas(msg.gas);
    require(v18, MEM[64], RETURNDATASIZE());
    if (v18) {
        v19 = v20 = 32;
        if (32 > RETURNDATASIZE()) {
            v19 = v21 = RETURNDATASIZE();
        }
        require(!((MEM[64] + (v19 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (v19 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
        require(MEM[64] + v19 - MEM[64] >= 32);
    }
    if (v2 > v2) {
        v2 = v22 = _SafeSub(v2, v2);
    }
    require(v2 >= varg2, InsufficientProfit());
    emit 0x766728be372c898c13c663da63b59fdfeb89dab2a81d4afe3177eb038ee0dcd2(address(msg.data[varg0 + msg.data[varg0 + 36] + 68]), address(msg.data[varg0 + msg.data[varg0 + 36] + 68]), varg1, v2, v2, block.timestamp);
    stor_1 = 1;
    return ;
}

function transferOwnership(address newOwner) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(!(msg.sender - _owner), OwnableUnauthorizedAccount(msg.sender));
    require(newOwner, OwnableInvalidOwner(0));
    _owner = newOwner;
    emit OwnershipTransferred(_owner, newOwner);
    return ;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= varg0 + varg1, Panic(17)); // arithmetic overflow or underflow
    return varg0 + varg1;
}

function 0xf3a(address varg0, address varg1, uint256 varg2) private { 
    v0 = v1 = 32;
    v2, v3 = varg0.allowance(this, varg1).gas(msg.gas);
    require(v2, MEM[64], RETURNDATASIZE());
    v3 = v4 = 0;
    if (v2) {
        if (v1 > RETURNDATASIZE()) {
            v0 = v5 = RETURNDATASIZE();
        }
        require(!((MEM[64] + (v0 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (MEM[64] + (v0 + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < MEM[64])), Panic(65)); // failed memory allocation (too much memory)
        require(MEM[64] + v0 - MEM[64] >= v1, v4, v4);
    }
    v6 = _SafeAdd(v3, varg2);
    v7 = new bytes[](68);
    MEM[v7.data] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
    MEM[v7 + 36] = varg1;
    MEM[v7 + 68] = v6;
    require(!((v7 + 128 > uint64.max) | (v7 + 128 < v7)), Panic(65)); // failed memory allocation (too much memory)
    v8 = v7.length;
    v9 = v10, /* uint256 */ v11 = varg0.approve(varg1, v6).gas(msg.gas);
    if (!RETURNDATASIZE()) {
        v12 = v13 = 96;
    } else {
        require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v12 = v14 = new bytes[](RETURNDATASIZE());
        require(!((v14 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v14 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v14)), Panic(65)); // failed memory allocation (too much memory)
        v11 = v14.data;
        RETURNDATACOPY(v11, 0, RETURNDATASIZE());
    }
    if (v10) {
        v9 = v15 = !MEM[v12];
        if (bool(MEM[v12])) {
            require(v1 + (v12 + MEM[v12]) - (v12 + v1) >= 32);
            v9 = MEM[v12 + v1];
            require(!(v9 - bool(v9)));
        }
    }
    if (v9) {
        v9 = v16 = bool(varg0.code.size);
    }
    if (!v9) {
        v17 = new bytes[](68);
        MEM[v17.data] = 0x95ea7b300000000000000000000000000000000000000000000000000000000;
        MEM[v17 + 36] = varg1;
        MEM[v17 + 68] = 0;
        require(!((v17 + 128 > uint64.max) | (v17 + 128 < v17)), Panic(65)); // failed memory allocation (too much memory)
        v18 = v17.length;
        v19 = v17.data;
        v20, /* uint256 */ v21 = varg0.approve(varg1, 0).gas(msg.gas);
        if (!RETURNDATASIZE()) {
            v22 = v23 = 96;
        } else {
            require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
            v22 = new bytes[](RETURNDATASIZE());
            require(!((v22 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v22 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v22)), Panic(65)); // failed memory allocation (too much memory)
            v21 = v22.data;
            RETURNDATACOPY(v21, 0, RETURNDATASIZE());
        }
        if (v20) {
            v24 = v25 = !MEM[v22];
            if (v25) {
                v24 = v26 = !varg0.code.size;
            }
            require(!v24, AddressEmptyCode(varg0));
            v27 = v28 = bool(MEM[v22]);
            if (v28) {
                require(v22 + MEM[v22] + 32 - (v22 + 32) >= 32);
                require(!(MEM[v22 + 32] - bool(MEM[v22 + 32])));
                v27 = v29 = !MEM[v22 + 32];
            }
            require(!v27, SafeERC20FailedOperation(varg0));
            v30 = v7.length;
            v31 = v7.data;
            v32, /* uint256 */ v33 = varg0.approve(varg1, v6).gas(msg.gas);
            if (!RETURNDATASIZE()) {
                v34 = v35 = 96;
            } else {
                require(RETURNDATASIZE() <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
                v34 = new bytes[](RETURNDATASIZE());
                require(!((v34 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max) | (v34 + (32 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + RETURNDATASIZE()) + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v34)), Panic(65)); // failed memory allocation (too much memory)
                v33 = v34.data;
                RETURNDATACOPY(v33, 0, RETURNDATASIZE());
            }
            if (v32) {
                v36 = v37 = !MEM[v34];
                if (v37) {
                    v36 = v38 = !varg0.code.size;
                }
                require(!v36, AddressEmptyCode(varg0));
                v39 = v40 = bool(MEM[v34]);
                if (v40) {
                    require(v34 + MEM[v34] + 32 - (v34 + 32) >= 32);
                    require(!(MEM[v34 + 32] - bool(MEM[v34 + 32])));
                    v39 = v41 = !MEM[v34 + 32];
                }
                require(!v39, SafeERC20FailedOperation(varg0));
            } else {
                require(!MEM[v34], 32 + v34, MEM[v34]);
                revert(FailedInnerCall());
            }
        } else {
            require(!MEM[v22], 32 + v22, MEM[v22]);
            revert(FailedInnerCall());
        }
    }
    return ;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        v0 = function_selector >> 224;
        if (0x5769e8 == v0) {
            0x005769e8(v0);
        } else if (0x277754ed == v0) {
            SUSHISWAP_ROUTER();
        } else if (0x41c64a2f == v0) {
            UNISWAP_V3_ROUTER();
        } else if (0x445b1e4b == v0) {
            approvedRouters(address);
        } else if (0x62337027 == v0) {
            0x62337027(v0);
        } else if (0x6c12f386 == v0) {
            0x6c12f386(v0);
        } else if (0x6ff1c9bc == v0) {
            emergencyWithdraw(address);
        } else if (0x715018a6 == v0) {
            renounceOwnership();
        } else if (0x75c81ad0 == v0) {
            minProfit();
        } else if (0x78400f17 == v0) {
            setMinProfit(uint256);
        } else if (0x8da5cb5b == v0) {
            owner();
        } else if (0xad5c4648 == v0) {
            WETH();
        } else if (0xbe34c766 == v0) {
            0xbe34c766(v0);
        } else if (0xd5eebede == v0) {
            setApprovedRouter(address,bool);
        } else if (0xe9cbafb0 == v0) {
            uniswapV3FlashCallback(uint256,uint256,bytes);
        } else if (0xf2fde38b == v0) {
            transferOwnership(address);
        }
    }
    require(!msg.data.length);
    receive();
}
