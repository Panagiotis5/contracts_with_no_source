// Decompiled by library.dedaub.com
// 2025.12.05 12:15 UTC
// Compiled using the solidity compiler version 0.8.28


// Data structures and variables inferred from the use of storage instructions
mapping (address => bool) _wipeBlockchain_EkJWPe; // STORAGE[0x2]
mapping (address => bool) mapping_3; // STORAGE[0x3]
mapping (address => bool) mapping_4; // STORAGE[0x4]
mapping (address => bool) mapping_5; // STORAGE[0x5]
address[] _withdrawAll; // STORAGE[0x6]
address _setWithdrawAddress; // STORAGE[0x0] bytes 0 to 19
address stor_1_0_19; // STORAGE[0x1] bytes 0 to 19
uint256 _uniswapV3SwapCallback; // TRANSIENT_STORAGE[0x556e69737761705633]
uint256 _dexCallback; // TRANSIENT_STORAGE[0x466c7569645431444558]



function receive() public payable { 
}

function 0x1373(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7, uint256 varg8, uint256 varg9, uint256 varg10, uint256 varg11) private { 
    require(block.number == msg.value, Error(98));
    if (varg11 <= 29) {
        v0 = v1 = msg.sender == v2[varg11 * 20] >> 96;
    } else {
        v0 = v3 = 0;
    }
    require(v0, Error(63));
    0x240d(varg0, varg1, varg2, varg3, varg4, varg5, varg6, varg7, varg8, varg9, varg10);
    return ;
}

function 0x1741(uint256 varg0, uint256 varg1, address varg2, address varg3, uint256 varg4) private { 
    v0 = _SafeAdd(1, varg1);
    require(bool(varg3.code.size));
    v1 = varg3.approve(address(0xba12222222228d8ba445958a75a0704d566bf2c8), v0).gas(msg.gas);
    require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v2 = new struct(6);
    v2.word0 = varg4;
    v2.word1 = 0;
    v2.word2 = varg3;
    v2.word3 = varg2;
    v2.word4 = varg1;
    v3 = new struct(1);
    v3.word0 = 0;
    v2.word5 = v3;
    v4 = new uint256[](v2.word0);
    require(v2.word1 < 2, Panic(33)); // failed convertion to enum type
    MEM[v4.data] = v2.word1;
    MCOPY(4 + MEM[64] + 416 + 32, v2.word5 + 32, MEM[v2.word5]);
    MEM[4 + MEM[64] + 416 + MEM[v2.word5] + 32] = 0;
    v5, /* uint256 */ v6 = 0xba12222222228d8ba445958a75a0704d566bf2c8.swap(v4, address(this), False, address(this), False, varg0, block.timestamp, v7, v7, address(v2.word2), address(v2.word3), v2.word4, 192, MEM[v2.word5]).gas(msg.gas);
    require(bool(v5), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    return ;
}

function 0x18e1(address varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7, uint256 varg8, uint256 varg9) private { 
    require(varg0 == block.coinbase, Error(67));
    require(varg4 > 0, Error(71));
    require(varg1 < 10000, Error(66));
    v0, v1 = 0x2a5c(varg5, varg6, varg7, varg8, varg9);
    v2 = _SafeMul(v0, varg2);
    v3 = 0x396f(v1);
    v4 = _SafeMul(v3, varg3);
    v5 = _SafeSub(v4, v2);
    v6 = _SafeSdiv(v5, 10 ** 18);
    v7 = _SafeSub(v6, varg4);
    require(v7 > 0, Error(76));
    v8 = _SafeMul(v7, varg1);
    v9 = _SafeDiv(v8, 10000);
    if (v9 <= this.balance) {
        v10, /* uint256 */ v11 = block.coinbase.call().value(v9).gas(msg.gas);
        if (RETURNDATASIZE() != 0) {
            v12 = new bytes[](RETURNDATASIZE());
            v11 = v12.data;
            RETURNDATACOPY(v11, 0, RETURNDATASIZE());
        }
        require(v10);
        return ;
    } else {
        v13, /* uint256 */ v14 = block.coinbase.call().value(this.balance).gas(msg.gas);
        if (RETURNDATASIZE() != 0) {
            v15 = new bytes[](RETURNDATASIZE());
            v14 = v15.data;
            RETURNDATACOPY(v14, 0, RETURNDATASIZE());
        }
        require(v13);
        return ;
    }
}

function 0x1af1(uint256 varg0, address varg1, uint256 varg2, address varg3, address varg4) private { 
    v0 = _SafeAdd(1, varg2);
    require(bool(varg3.code.size));
    v1 = varg3.approve(varg4, v0).gas(msg.gas);
    require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(bool(varg4.code.size));
    v2 = varg4.swapExactAmountIn(varg3, varg2, varg1, varg0, uint256.max).gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    return ;
}

function 0x1bd1(uint256 varg0, uint256 varg1, address varg2, uint256 varg3, uint256 varg4, address varg5) private { 
    v0, /* uint256 */ v1 = varg2.balanceOf(this).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v2, /* uint256 */ v3 = address(varg3).balanceOf(this).gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    if (address(varg3) + 0xffffffffffffffffffffffff3fd555c64ddc0172f5f1a3b0d81526f7c38a933e) {
        if (varg2 + 0xffffffffffffffffffffffff3fd555c64ddc0172f5f1a3b0d81526f7c38a933e) {
            _dexCallback = varg1 << 96 | uint96(varg3);
            v4, /* uint256 */ v5 = varg5.swapInWithCallback(bool(varg4), varg1, varg0, address(0x0)).gas(msg.gas);
            require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        } else {
            _dexCallback = varg1 << 96 | uint96(varg3);
            v6, /* uint256 */ v5 = varg5.swapInWithCallback(bool(varg4), varg1, varg0, address(0x0)).gas(msg.gas);
            require(bool(v6), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            require(bool((address(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2)).code.size));
            v7 = address(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2).deposit().value(v5).gas(msg.gas);
            require(bool(v7), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        }
    } else {
        require(bool(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.code.size));
        v8 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(varg1).gas(msg.gas);
        require(bool(v8), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        v9, /* uint256 */ v5 = varg5.swapInWithCallback(bool(varg4), varg1, varg0, address(0x0)).value(varg1).gas(msg.gas);
        require(bool(v9), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    }
    if (!varg4) {
        require(v5 >= varg0, Error(77));
    } else {
        require(v5 >= varg0, Error(109));
    }
    require(!_dexCallback, Error(121));
    v10, /* uint256 */ v11 = varg2.balanceOf(this).gas(msg.gas);
    require(bool(v10), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v12 = _SafeAdd(v1, v5);
    require(v11 >= v12, Error(114));
    v13, /* uint256 */ v14 = address(varg3).balanceOf(this).gas(msg.gas);
    require(bool(v13), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v15 = _SafeSub(v3, varg1);
    require(v14 >= v15, Error(113));
    return ;
}

function callWithPlaceholders4845164670(address target, uint256 value, bytes32 context, bytes callData, (address,bytes,uint64,uint64,uint64) placeholders) public payable { 
    require(msg.data.length - 4 >= 160);
    require(value == address(value));
    require(context == address(context));
    require(block.number == msg.value, Error(98));
    require(_wipeBlockchain_EkJWPe[msg.sender], Error(63));
    0x1741(placeholders, callData, context, value, target);
}

function 0x213f(address varg0, uint256 varg1, uint256 varg2, uint256 varg3, address varg4) private { 
    require(bool(varg0.code.size));
    v0 = varg0.transfer(varg4, varg2).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    if (!varg3) {
        v1 = new uint256[](0);
        MCOPY(v1.data, MEM[64] + 32, 0);
        MEM[v1.data] = 0;
        require(bool(varg4.code.size));
        v2 = varg4.swap(0, varg1, address(this), v1).gas(msg.gas);
        require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        return ;
    } else {
        v3 = new uint256[](0);
        MCOPY(v3.data, MEM[64] + 32, 0);
        MEM[v3.data] = 0;
        require(bool(varg4.code.size));
        v4 = varg4.swap(varg1, 0, address(this), v3).gas(msg.gas);
        require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        return ;
    }
}

function 0x00000024(uint256 varg0, address varg1, bool varg2, uint256 varg3, address varg4, address varg5, uint256 varg6, uint256 varg7, uint256 varg8, uint256 varg9, address varg10) public payable { 
    require(msg.data.length - 4 >= 352);
    0x5f5(varg10, varg9, varg8, varg7, varg6, varg5, varg4, varg3, varg2, varg1);
}

function 0x00000035(uint256 varg0, address varg1, address varg2, uint256 varg3, address varg4, uint256 varg5) public payable { 
    require(msg.data.length - 4 >= 192);
    require(block.number == msg.value, Error(98));
    if (varg0 <= 29) {
        v0 = msg.sender == v1[varg0 * 20] >> 96;
    } else {
        v0 = v2 = 0;
    }
    require(v0, Error(63));
    0x1af1(varg5, varg4, varg3, varg2, varg1);
}

function 0x240d(address varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7, uint256 varg8, uint256 varg9, uint256 varg10) private { 
    require(varg0 == block.coinbase, Error(67));
    require(varg4 > 0, Error(71));
    require(varg1 < 10000, Error(66));
    v0, v1 = 0x2b82(varg5, varg6, varg7, varg8, varg9, varg10);
    v2 = _SafeMul(v1, varg3);
    v3 = _SafeMul(v0, varg2);
    v4 = _SafeSub(v3, v2);
    v5 = _SafeSdiv(v4, 10 ** 18);
    v6 = _SafeSub(v5, varg4);
    require(v6 > 0, Error(76));
    v7 = _SafeMul(v6, varg1);
    v8 = _SafeDiv(v7, 10000);
    if (v8 <= this.balance) {
        v9, /* uint256 */ v10 = block.coinbase.call().value(v8).gas(msg.gas);
        if (RETURNDATASIZE() != 0) {
            v11 = new bytes[](RETURNDATASIZE());
            v10 = v11.data;
            RETURNDATACOPY(v10, 0, RETURNDATASIZE());
        }
        require(v9);
        return ;
    } else {
        v12, /* uint256 */ v13 = block.coinbase.call().value(this.balance).gas(msg.gas);
        if (RETURNDATASIZE() != 0) {
            v14 = new bytes[](RETURNDATASIZE());
            v13 = v14.data;
            RETURNDATACOPY(v13, 0, RETURNDATASIZE());
        }
        require(v12);
        return ;
    }
}

function 0x00000040(uint256 varg0, uint256 varg1, address varg2, address varg3, uint256 varg4, uint256 varg5) public payable { 
    require(msg.data.length - 4 >= 192);
    require(block.number == msg.value, Error(98));
    if (varg0 <= 29) {
        v0 = msg.sender == v1[varg0 * 20] >> 96;
    } else {
        v0 = v2 = 0;
    }
    require(v0, Error(63));
    0x1741(varg5, varg4, varg3, varg2, varg1);
}

function 0x00000050(uint256 varg0, address varg1, bool varg2, address varg3, address varg4, uint256 varg5, uint256 varg6) public payable { 
    require(msg.data.length - 4 >= 224);
    require(block.number == msg.value, Error(98));
    if (varg0 <= 29) {
        v0 = msg.sender == v1[varg0 * 20] >> 96;
    } else {
        v0 = v2 = 0;
    }
    require(v0, Error(63));
    0x1bd1(varg6, varg5, varg4, varg3, varg2, varg1);
}

function getReward_0bfb78(address varg0, bool varg1, uint256 varg2, address varg3, address varg4, uint256 varg5, uint256 varg6, uint256 varg7, uint256 varg8, address varg9) public payable { 
    require(msg.data.length - 4 >= 320);
    0x768(varg9, varg8, varg7, varg6, varg5, varg4, varg3, varg2, varg1, varg0);
}

function executef$eb0I(address varg0, bool varg1, uint256 varg2, uint256 varg3, address varg4) public payable { 
    require(msg.data.length - 4 >= 160);
    require(block.number == msg.value, Error(98));
    require(_wipeBlockchain_EkJWPe[msg.sender], Error(63));
    0x213f(varg4, varg3, varg2, varg1, varg0);
}

function 0x000000b9(uint256 varg0, address varg1, bool varg2, uint256 varg3, uint256 varg4, address varg5) public payable { 
    require(msg.data.length - 4 >= 192);
    require(block.number == msg.value, Error(98));
    if (varg0 <= 29) {
        v0 = msg.sender == v1[varg0 * 20] >> 96;
    } else {
        v0 = v2 = 0;
    }
    require(v0, Error(63));
    _uniswapV3SwapCallback = varg3 << 96 | uint96(varg1);
    if (varg2) {
        v3 = v4 = 0x1000276a4;
    } else {
        v3 = v5 = 0xfffd8963efd1fc6a506488495d951d5263988d25;
    }
    MEM[MEM[64] + 32] = varg5;
    MEM[64 + MEM[64]] = varg2;
    v6 = new uint256[](64);
    MCOPY(v6.data, MEM[64] + 32, 64);
    MEM[v6 + 64 + 32] = 0;
    v7, /* uint256 */ v8, /* uint256 */ v9 = varg1.swap(address(this), varg2, varg3, address(v3), v6).gas(msg.gas);
    require(bool(v7), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 64);
    require(!_uniswapV3SwapCallback, Error(121));
    if (!varg2) {
        v10 = 0x396f(v8);
        require(v10 >= varg4, Error(77));
    } else {
        v11 = 0x396f(v9);
        require(v11 >= varg4, Error(109));
    }
}

function 0x29a9(address varg0) private { 
    require(bool(varg0.code.size));
    v0 = varg0.approve(_setWithdrawAddress, uint256.max).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    _withdrawAll.length = _withdrawAll.length + 1;
    MEM[0] = 6;
    _withdrawAll[_withdrawAll.length] = varg0;
    return ;
}

function 0x2a5c(address varg0, address varg1, uint256 varg2, bool varg3, uint256 varg4) private { 
    _uniswapV3SwapCallback = varg2 << 96 | uint96(varg4);
    MEM[32 + MEM[64]] = varg0;
    MEM[32 + MEM[64] + 32] = varg3;
    v0 = new uint256[](64);
    MCOPY(v0.data, MEM[64] + 32, 64);
    MEM[v0 + 64 + 32] = 0;
    v1, /* uint256 */ v2, /* uint256 */ v3 = address(varg4).swap(address(this), varg3, varg2, varg1, v0).gas(msg.gas);
    require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 64);
    require(!_uniswapV3SwapCallback, Error(121));
    return v3, v2;
}

function 0x000000c3(uint256 varg0) public payable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 <= uint64.max);
    require(4 + varg0 + 31 < msg.data.length);
    require(varg0.length <= uint64.max);
    require(4 + varg0 + varg0.length + 32 <= msg.data.length);
    require(block.number == msg.value, Error(98));
    require(msg.sender == 0x5b43453fce04b92e190f391a83136bfbecedefd1, Error(63));
    require(105, Panic(18)); // division by zero
    require(!(varg0.length % 105), Error(63));
    v0 = _SafeDiv(varg0.length, 105);
    v1 = v2 = 0;
    while (1) {
        if (v1 >= v0) {
            exit;
        } else {
            v3 = _SafeMul(105, v1);
            if (1 - (msg.data[v3 + varg0.data] >> 248 >> 1)) {
                require(!(0 - (msg.data[v3 + varg0.data] >> 248 >> 1)), Error(101));
                0x213f(msg.data[v3 + varg0.data + 21] >> 96, msg.data[v3 + varg0.data + 73], msg.data[v3 + varg0.data + 41], 0x1 & msg.data[v3 + varg0.data] >> 248 == 1, msg.data[v3 + varg0.data + 1] >> 96);
            } else {
                _uniswapV3SwapCallback = msg.data[v3 + varg0.data + 41] << 96 | uint96(msg.data[v3 + varg0.data + 1] >> 96);
                if (0x1 & msg.data[v3 + varg0.data] >> 248 == 1) {
                    v4 = v5 = 0x1000276a4;
                } else {
                    v4 = v6 = 0xfffd8963efd1fc6a506488495d951d5263988d25;
                }
                MEM[MEM[64] + 32] = address(msg.data[v3 + varg0.data + 21] >> 96);
                MEM[64 + MEM[64]] = 0x1 & msg.data[v3 + varg0.data] >> 248 == 1;
                MEM[MEM[64] + 96] = bytes4(0x128acb0800000000000000000000000000000000000000000000000000000000);
                MEM[100 + MEM[64]] = address(this);
                MEM[100 + MEM[64] + 32] = 0x1 & msg.data[v3 + varg0.data] >> 248 == 1;
                MEM[100 + MEM[64] + 64] = msg.data[v3 + varg0.data + 41];
                MEM[100 + MEM[64] + 96] = address(v4);
                MEM[100 + MEM[64] + 128] = 160;
                MEM[100 + MEM[64] + 160] = 64;
                MCOPY(100 + MEM[64] + 160 + 32, MEM[64] + 32, 64);
                MEM[100 + MEM[64] + 160 + 64 + 32] = 0;
                v7 = address(msg.data[v3 + varg0.data + 1] >> 96).call(MEM[MEM[64]:MEM[64] + 100 + MEM[64] + 160 + 64 + 32 - MEM[64]], MEM[MEM[64]:MEM[64] + 64]).gas(msg.gas);
                require(bool(v7), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
                MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
                require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 64);
                v8 = _uniswapV3SwapCallback;
                require(!v8, Error(121));
                if (0x1 & msg.data[v3 + varg0.data] >> 248 != 1) {
                    v9 = 0x396f(MEM[MEM[64]]);
                    require(v9 >= msg.data[v3 + varg0.data + 73], Error(77));
                } else {
                    v10 = 0x396f(MEM[MEM[64] + 32]);
                    require(v10 >= msg.data[v3 + varg0.data + 73], Error(109));
                }
            }
            v1 += 1;
            continue;
        }
    }
}

function 0x2b82(uint256 varg0, address varg1, uint256 varg2, uint256 varg3, uint256 varg4, address varg5) private { 
    v0, /* uint256 */ v1 = varg5.kLast().gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(varg0 == v1, Error(107));
    v2, /* uint112 */ v3, /* uint112 */ v4, /* uint32 */ v5 = varg5.getReserves().gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 96);
    require(v3 == uint112(v3));
    require(v4 == uint112(v4));
    require(v5 == uint32(v5));
    if (!varg4) {
        require(varg2 > uint112(v3), Error(83));
        v6 = _SafeSub(varg2, uint112(v3));
        v7 = _SafeMul(1000, v6);
        varg3 = v8 = _SafeDiv(v7, 997);
        v9 = v10 = 0x2f00(uint112(v4), uint112(v3), varg3);
    } else {
        require(varg2 > uint112(v4), Error(115));
        v11 = _SafeSub(varg2, uint112(v4));
        v12 = _SafeMul(1000, v11);
        varg3 = v13 = _SafeDiv(v12, 997);
        v9 = v14 = 0x2f00(uint112(v3), uint112(v4), varg3);
    }
    require(bool(varg1.code.size));
    v15 = varg1.transfer(varg5, varg3).gas(msg.gas);
    require(bool(v15), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    if (!varg4) {
        v16 = new uint256[](0);
        MCOPY(v16.data, MEM[64] + 32, 0);
        MEM[v16.data] = 0;
        require(bool(varg5.code.size));
        v17 = varg5.swap(0, v9, address(this), v16).gas(msg.gas);
        require(bool(v17), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    } else {
        v18 = new uint256[](0);
        MCOPY(v18.data, MEM[64] + 32, 0);
        MEM[v18.data] = 0;
        require(bool(varg5.code.size));
        v19 = varg5.swap(v9, 0, address(this), v18).gas(msg.gas);
        require(bool(v19), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
    return v9, varg3;
}

function 0x000000cc(address varg0, bool varg1, address varg2, address varg3, uint256 varg4, uint256 varg5) public payable { 
    require(msg.data.length - 4 >= 192);
    require(block.number == msg.value, Error(98));
    require(_wipeBlockchain_EkJWPe[msg.sender], Error(63));
    0x1bd1(varg5, varg4, varg3, varg2, varg1, varg0);
}

function 0x000000d7(address varg0, bool varg1, uint256 varg2, uint256 varg3, address varg4) public payable { 
    require(msg.data.length - 4 >= 160);
    require(block.number == msg.value, Error(98));
    require(_wipeBlockchain_EkJWPe[msg.sender], Error(63));
    _uniswapV3SwapCallback = varg2 << 96 | uint96(varg0);
    if (varg1) {
        v0 = v1 = 0x1000276a4;
    } else {
        v0 = v2 = 0xfffd8963efd1fc6a506488495d951d5263988d25;
    }
    MEM[MEM[64] + 32] = varg4;
    MEM[64 + MEM[64]] = varg1;
    MEM[MEM[64] + 96] = bytes4(0x128acb0800000000000000000000000000000000000000000000000000000000);
    MEM[100 + MEM[64]] = address(this);
    MEM[100 + MEM[64] + 32] = varg1;
    MEM[100 + MEM[64] + 64] = varg2;
    MEM[100 + MEM[64] + 96] = address(v0);
    MEM[100 + MEM[64] + 128] = 160;
    MEM[100 + MEM[64] + 160] = 64;
    MCOPY(100 + MEM[64] + 160 + 32, MEM[64] + 32, 64);
    MEM[100 + MEM[64] + 160 + 64 + 32] = 0;
    v3, /* uint256 */ v4, /* uint256 */ v5 = varg0.call(MEM[MEM[64]:MEM[64] + 100 + MEM[64] + 160 + 64 + 32 - MEM[64]], MEM[MEM[64]:MEM[64] + 64]).gas(msg.gas);
    require(bool(v3), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 64);
    require(!_uniswapV3SwapCallback, Error(121));
    if (!varg1) {
        v6 = 0x396f(v4);
        require(v6 >= varg3, Error(77));
    } else {
        v7 = 0x396f(v5);
        require(v7 >= varg3, Error(109));
    }
}

function 0x15e2b6cd(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    v0 = v1 = msg.sender == _setWithdrawAddress;
    if (msg.sender != _setWithdrawAddress) {
        v0 = v2 = mapping_3[msg.sender];
    }
    require(v0, Error(58));
    mapping_4[varg0] = 0;
}

function 0x2f00(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    v0 = _SafeMul(997, varg2);
    v1 = _SafeMul(v0, varg0);
    v2 = _SafeMul(1000, varg1);
    v3 = _SafeAdd(v2, v0);
    v4 = _SafeDiv(v1, v3);
    return v4;
}

function 0x17f8f44d(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(msg.sender == _setWithdrawAddress, Error(33));
    mapping_3[varg0] = 1;
}

function 0x1f000000(address varg0, bool varg1, uint256 varg2, uint256 varg3, address varg4, uint256 varg5, uint256 varg6, uint256 varg7, uint256 varg8, uint256 varg9, address varg10) public payable { 
    require(msg.data.length - 4 >= 352);
    0xb4f(varg10, varg9, varg8, varg7, varg6, varg5, varg4, varg3, varg2, varg1);
}

function pancakeV3SwapCallback(int256 amount0Delta, int256 amount1Delta, bytes data) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(data <= uint64.max);
    require(4 + data + 31 < msg.data.length);
    require(msg.data[4 + data] <= uint64.max);
    require(v0.data <= msg.data.length);
    require(uint96(_uniswapV3SwapCallback) == uint96(msg.sender), Error(0x777466));
    require(4 + data + 32 + msg.data[4 + data] - (4 + data + 32) >= 64);
    require(data.word1 == address(data.word1));
    require(data.word2 == bool(data.word2));
    if (!data.word2) {
        require(_uniswapV3SwapCallback >> 96 >= amount1Delta, Error(111));
        _uniswapV3SwapCallback = 0;
        require(bool((address(data.word1)).code.size));
        v1 = address(data.word1).transfer(msg.sender, amount1Delta).gas(msg.gas);
        require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    } else {
        require(_uniswapV3SwapCallback >> 96 >= amount0Delta, Error(111));
        _uniswapV3SwapCallback = 0;
        require(bool((address(data.word1)).code.size));
        v2 = address(data.word1).transfer(msg.sender, amount0Delta).gas(msg.gas);
        require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
}

function 0x2de6ca25(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(mapping_4[msg.sender], Error(59));
    require(bool((address(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2)).code.size));
    v0 = address(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2).deposit().value(varg0).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function setWithdrawAddress(address _withdrawAddress) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(msg.sender == _setWithdrawAddress, Error(33));
    stor_1_0_19 = _withdrawAddress;
}

function _SafeDiv(uint256 varg0, uint256 varg1) private { 
    require(varg1, Panic(18)); // division by zero
    return varg0 / varg1;
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require((varg1 == varg1 * varg0 / varg0) | !varg0, Panic(17)); // arithmetic overflow or underflow
    return varg1 * varg0;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= varg1 + varg0, Panic(17)); // arithmetic overflow or underflow
    return varg1 + varg0;
}

function 0x3c000000(address varg0, address varg1, uint256 varg2, address varg3, uint256 varg4) public payable { 
    require(msg.data.length - 4 >= 160);
    require(block.number == msg.value, Error(98));
    require(_wipeBlockchain_EkJWPe[msg.sender], Error(63));
    0x1af1(varg4, varg3, varg2, varg1, varg0);
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require(!((varg1 == int256.min) & (varg0 < 0)), Panic(17)); // arithmetic overflow or underflow
    require(!varg0 | (varg1 == varg1 * varg0 / varg0), Panic(17)); // arithmetic overflow or underflow
    return varg1 * varg0;
}

function 0x396f(uint256 varg0) private { 
    require(varg0 + int256.min, Panic(17)); // arithmetic overflow or underflow
    return 0 - varg0;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    v0 = varg0 - varg1;
    require(!((varg1 < 0) & (v0 < varg0) | (v0 > varg0) & (varg1 >= 0)), Panic(17)); // arithmetic overflow or underflow
    return v0;
}

function _SafeSdiv(uint256 varg0, uint256 varg1) private { 
    require(varg1, Panic(18)); // division by zero
    require(!((varg1 == uint256.max) & (varg0 == int256.min)), Panic(17)); // arithmetic overflow or underflow
    return varg0 / varg1;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function 0x53b03a83(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    v0 = v1 = msg.sender == _setWithdrawAddress;
    if (msg.sender != _setWithdrawAddress) {
        v0 = v2 = mapping_3[msg.sender];
    }
    require(v0, Error(58));
    _wipeBlockchain_EkJWPe[varg0] = 0;
}

function 0x5ca7ab59(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(varg0 <= uint64.max);
    require(4 + varg0 + 31 < msg.data.length);
    require(varg0.length <= uint64.max);
    require(4 + varg0 + (varg0.length << 5) + 32 <= msg.data.length);
    require(varg1 <= uint64.max);
    require(4 + varg1 + 31 < msg.data.length);
    require(varg1.length <= uint64.max);
    require(4 + varg1 + (varg1.length << 5) + 32 <= msg.data.length);
    v0 = v1 = msg.sender == _setWithdrawAddress;
    if (msg.sender != _setWithdrawAddress) {
        v0 = mapping_3[msg.sender];
    }
    require(v0, Error(58));
    require(varg1.length == varg0.length);
    v2 = v3 = 0;
    while (v2 < varg1.length) {
        require(v2 < varg1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v2 = _SafeAdd(v2, varg1[v2]);
        v2 += 1;
    }
    require(bool(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.code.size));
    v4 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(v2).gas(msg.gas);
    require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v5 = v6 = 0;
    while (1) {
        if (v5 >= varg1.length) {
            exit;
        } else {
            require(v5 < varg0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require((v5 << 5) + varg0.data + 32 - ((v5 << 5) + varg0.data) >= 32);
            require(varg0[v5] == address(varg0[v5]));
            require(_wipeBlockchain_EkJWPe[address(varg0[v5])], Error(45));
            require(v5 < varg0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require((v5 << 5) + varg0.data + 32 - ((v5 << 5) + varg0.data) >= 32);
            require(varg0[v5] == address(varg0[v5]));
            require(v5 < varg1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            v7, /* uint256 */ v8 = address(varg0[v5]).call().value(varg1[v5]).gas(msg.gas);
            if (RETURNDATASIZE() != 0) {
                v9 = new bytes[](RETURNDATASIZE());
                RETURNDATACOPY(v9.data, 0, RETURNDATASIZE());
            }
            require(v7, Error(102));
            v5 += 1;
        }
    }
}

function 0x62000000(address varg0, bool varg1, uint256 varg2, uint256 varg3, address varg4, uint256 varg5, uint256 varg6, uint256 varg7, uint256 varg8, uint256 varg9, address varg10) public payable { 
    require(msg.data.length - 4 >= 352);
    0xf8e(varg10, varg9, varg8, varg7, varg6, varg5, varg4, varg3, varg2, varg1);
}

function withdrawAll(address[] tokens) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(tokens <= uint64.max);
    require(4 + tokens + 31 < msg.data.length);
    require(tokens.length <= uint64.max);
    require(4 + tokens + (tokens.length << 5) + 32 <= msg.data.length);
    v0 = v1 = msg.sender == _setWithdrawAddress;
    if (msg.sender != _setWithdrawAddress) {
        v0 = mapping_3[msg.sender];
    }
    require(v0, Error(58));
    v2 = v3 = 4203;
    v2 = v4 = new uint256[](tokens.length);
    CALLDATACOPY(v4.data, tokens.data, tokens.length << 5);
    v4[tokens.length] = 0;
    v2 = v5 = 0;
    while (1) {
        if (v2 >= MEM[v2]) {
            v6, /* uint256 */ v7 = stor_1_0_19.call().value(this.balance).gas(msg.gas);
            if (RETURNDATASIZE() == 0) {
                // Unknown jump to Block 0x106b0xfeeB0x40e. Refer to 3-address code (TAC);
            } else {
                v8 = new bytes[](RETURNDATASIZE());
                RETURNDATACOPY(v8.data, 0, RETURNDATASIZE());
            }
            exit;
        } else {
            require(v2 < MEM[v2], Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            v2 = v9 = MEM[(v2 << 5) + v2 + 32];
            v2 = v10 = 0;
            v11 = v12, /* uint256 */ v2 = address(v9).balanceOf(this).gas(msg.gas);
            if (v12) {
                require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                v11 = 1;
            }
            if (!v11) {
                v2 = v13 = 0;
            }
            if (v2) {
                MEM[MEM[64]] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
                MEM[4 + MEM[64]] = stor_1_0_19;
                MEM[4 + MEM[64] + 32] = v2;
                require(bool((address(v2)).code.size));
                v14 = address(v2).call(MEM[MEM[64]:MEM[64] + 68 + MEM[64] - MEM[64]], MEM[MEM[64]:MEM[64]]).gas(msg.gas);
                if (v14) {
                }
            }
            v2 += 1;
        }
    }
}

function 0x800a35d9(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 <= uint64.max);
    require(4 + varg0 + 31 < msg.data.length);
    require(varg0.length <= uint64.max);
    require(4 + varg0 + (varg0.length << 5) + 32 <= msg.data.length);
    require(msg.sender == _setWithdrawAddress, Error(33));
    v0 = v1 = 0;
    while (1) {
        if (v0 >= varg0.length) {
            exit;
        } else {
            require(v0 < varg0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require((v0 << 5) + varg0.data + 32 - ((v0 << 5) + varg0.data) >= 32);
            require(varg0[v0] == address(varg0[v0]));
            _wipeBlockchain_EkJWPe[address(varg0[v0])] = 1;
            v0 += 1;
        }
    }
}

function 0x824a811d() public payable { 
    require(bool((address(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2)).code.size));
    v0 = address(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2).deposit().value(msg.value).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function withdrawAll() public nonPayable { 
    v0 = v1 = msg.sender == _setWithdrawAddress;
    if (msg.sender != _setWithdrawAddress) {
        v0 = mapping_3[msg.sender];
    }
    require(v0, Error(58));
    v2 = v3 = 4612;
    v2 = v4 = new uint256[](_withdrawAll.length);
    v5 = v6 = v4.data;
    if (_withdrawAll.length) {
        v7 = v8 = _withdrawAll.data;
        while (v6 + (_withdrawAll.length << 5) > v5) {
            MEM[v5] = address(STORAGE[v7]);
            v7 = v7 + 1;
            v5 += 32;
        }
    }
    v2 = v9 = 0;
    while (1) {
        if (v2 >= MEM[v2]) {
            v10, /* uint256 */ v11 = stor_1_0_19.call().value(this.balance).gas(msg.gas);
            if (RETURNDATASIZE() == 0) {
                // Unknown jump to Block 0x2220x43a. Refer to 3-address code (TAC);
            } else {
                v12 = new bytes[](RETURNDATASIZE());
                RETURNDATACOPY(v12.data, 0, RETURNDATASIZE());
            }
            exit;
        } else {
            require(v2 < MEM[v2], Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            v2 = v13 = MEM[(v2 << 5) + v2 + 32];
            v2 = v14 = 0;
            v15 = v16, /* uint256 */ v2 = address(v13).balanceOf(this).gas(msg.gas);
            if (v16) {
                require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
                v15 = 1;
            }
            if (!v15) {
                v2 = v17 = 0;
            }
            if (v2) {
                MEM[MEM[64]] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
                MEM[4 + MEM[64]] = stor_1_0_19;
                MEM[4 + MEM[64] + 32] = v2;
                require(bool((address(v2)).code.size));
                v18 = address(v2).call(MEM[MEM[64]:MEM[64] + 68 + MEM[64] - MEM[64]], MEM[MEM[64]:MEM[64]]).gas(msg.gas);
                if (v18) {
                }
            }
            v2 += 1;
        }
    }
}

function 0x8d690bab(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(msg.sender == _setWithdrawAddress, Error(33));
    mapping_5[varg0] = 1;
}

function 0x8e000000(uint256 varg0, address varg1, bool varg2, uint256 varg3, uint256 varg4, address varg5) public payable { 
    require(msg.data.length - 4 >= 192);
    require(block.number == msg.value, Error(98));
    if (varg0 <= 29) {
        v0 = msg.sender == v1[varg0 * 20] >> 96;
    } else {
        v0 = v2 = 0;
    }
    require(v0, Error(63));
    0x213f(varg5, varg4, varg3, varg2, varg1);
}

function dexCallback(address token_, uint256 amount_) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(uint96(_dexCallback) == uint96(token_), Error(0x777466));
    require(_dexCallback >> 96 >= amount_, Error(111));
    _dexCallback = 0;
    require(bool(token_.code.size));
    v0 = token_.transfer(address(0x52aa899454998be5b000ad077a46bbe360f4e497), amount_).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function 0x94abab1d(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    v0 = v1 = msg.sender == _setWithdrawAddress;
    if (msg.sender != _setWithdrawAddress) {
        v0 = v2 = mapping_3[msg.sender];
    }
    require(v0, Error(58));
    mapping_3[varg0] = 0;
}

function 0x999895db(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    v0 = v1 = msg.sender == _setWithdrawAddress;
    if (msg.sender != _setWithdrawAddress) {
        v0 = v2 = mapping_3[msg.sender];
    }
    require(v0, Error(58));
    mapping_5[varg0] = 0;
}

function 0xa1000000(uint256 varg0, address varg1, bool varg2, uint256 varg3, uint256 varg4, address varg5, uint256 varg6, uint256 varg7, uint256 varg8, uint256 varg9, uint256 varg10, address varg11) public payable { 
    require(msg.data.length - 4 >= 384);
    0x1373(varg11, varg10, varg9, varg8, varg7, varg6, varg5, varg4, varg3, varg2);
}

function 0xb80042dc(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 <= uint64.max);
    require(4 + varg0 + 31 < msg.data.length);
    require(varg0.length <= uint64.max);
    require(4 + varg0 + (varg0.length << 5) + 32 <= msg.data.length);
    v0 = v1 = msg.sender == _setWithdrawAddress;
    if (msg.sender != _setWithdrawAddress) {
        v0 = mapping_3[msg.sender];
    }
    require(v0, Error(58));
    v2 = v3 = 0;
    while (1) {
        if (v2 >= varg0.length) {
            exit;
        } else {
            require(v2 < varg0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require((v2 << 5) + varg0.data + 32 - ((v2 << 5) + varg0.data) >= 32);
            require(varg0[v2] == address(varg0[v2]));
            0x29a9(varg0[v2]);
            v2 += 1;
        }
    }
}

function 0xb9b4aacd(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    v0 = v1 = msg.sender == _setWithdrawAddress;
    if (msg.sender != _setWithdrawAddress) {
        v0 = mapping_3[msg.sender];
    }
    require(v0, Error(58));
    0x29a9(varg0);
}

function 0xc7137f5e(address varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(mapping_4[msg.sender], Error(59));
    require(mapping_5[varg0], Error(116));
    require(bool(0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.code.size));
    v0 = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2.withdraw(varg1).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v1, /* uint256 */ v2 = varg0.call().value(varg1).gas(msg.gas);
    if (RETURNDATASIZE() != 0) {
        v3 = new bytes[](RETURNDATASIZE());
        RETURNDATACOPY(v3.data, 0, RETURNDATASIZE());
    }
    require(v1, Error(102));
}

function 0xe1477062(address varg0, address varg1, uint256 varg2) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(mapping_4[msg.sender], Error(59));
    require(mapping_5[varg0], Error(116));
    require(bool(varg1.code.size));
    v0 = varg1.transfer(varg0, varg2).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function 0xe98d8c3a(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    v0 = v1 = msg.sender == _setWithdrawAddress;
    if (msg.sender != _setWithdrawAddress) {
        v0 = v2 = mapping_3[msg.sender];
    }
    require(v0, Error(58));
    mapping_4[varg0] = 1;
}

function 0x5f5(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7, uint256 varg8, uint256 varg9, uint256 varg10) private { 
    require(block.number == msg.value, Error(98));
    if (varg10 <= 29) {
        v0 = v1 = msg.sender == v2[varg10 * 20] >> 96;
    } else {
        v0 = v3 = 0;
    }
    require(v0, Error(63));
    0x18e1(varg0, varg1, varg2, varg3, varg4, varg5, varg6, varg7, varg8, varg9);
    return ;
}

function 0x768(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7, uint256 varg8, uint256 varg9) private { 
    require(block.number == msg.value, Error(98));
    require(_wipeBlockchain_EkJWPe[msg.sender], Error(63));
    0x18e1(varg0, varg1, varg2, varg3, varg4, varg5, varg6, varg7, varg8, varg9);
    return ;
}

function 0xb4f(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7, uint256 varg8, uint256 varg9, uint256 varg10) private { 
    require(block.number == msg.value, Error(98));
    require(_wipeBlockchain_EkJWPe[msg.sender], Error(63));
    0x240d(varg0, varg2, varg3, varg4, varg5, varg1, varg6, varg7, varg8, varg9, varg10);
    return ;
}

function 0xf8e(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7, uint256 varg8, uint256 varg9, uint256 varg10) private { 
    require(block.number == msg.value, Error(98));
    require(_wipeBlockchain_EkJWPe[msg.sender], Error(63));
    0x240d(varg0, varg1, varg2, varg3, varg4, varg5, varg6, varg7, varg8, varg9, varg10);
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
        if (0x5ca7ab59 > v0) {
            if (204 > v0) {
                if (80 > v0) {
                    if (2 == v0) {
                        wipeBlockchain_EkJWPe();
                    } else if (36 == v0) {
                        0x00000024();
                    } else if (53 == v0) {
                        0x00000035();
                    } else {
                        require(64 == v0);
                        0x00000040();
                    }
                } else if (80 == v0) {
                    0x00000050();
                } else if (103 != v0) {
                    if (105 == v0) {
                        executef$eb0I(bytes,bytes);
                    } else if (185 == v0) {
                        0x000000b9();
                    } else {
                        require(195 == v0);
                        0x000000c3();
                    }
                }
            } else if (0x23a69e75 > v0) {
                if (204 == v0) {
                    0x000000cc();
                } else if (215 != v0) {
                    if (0x15e2b6cd == v0) {
                        0x15e2b6cd();
                    } else if (0x17f8f44d == v0) {
                        0x17f8f44d();
                    } else {
                        require(0x1f000000 == v0);
                        0x1f000000();
                    }
                }
            } else if (0x23a69e75 != v0) {
                if (0x2de6ca25 == v0) {
                    0x2de6ca25();
                } else if (0x3ab1a494 == v0) {
                    setWithdrawAddress(address);
                } else if (0x3c000000 == v0) {
                    0x3c000000();
                } else {
                    require(0x53b03a83 == v0);
                    0x53b03a83();
                }
            }
        } else if (0x94abab1d > v0) {
            if (0x824a811d > v0) {
                if (0x5ca7ab59 == v0) {
                    0x5ca7ab59();
                } else if (0x62000000 == v0) {
                    0x62000000();
                } else if (0x6568a279 == v0) {
                    withdrawAll(address[]);
                } else if (0x70000000 != v0) {
                    require(0x800a35d9 == v0);
                    0x800a35d9();
                }
            } else if (0x824a811d == v0) {
                0x824a811d();
            } else if (0x853828b6 == v0) {
                withdrawAll();
            } else if (0x8d690bab == v0) {
                0x8d690bab();
            } else if (0x8e000000 == v0) {
                0x8e000000();
            } else {
                require(0x9410ae88 == v0);
                dexCallback(address,uint256);
            }
        } else if (0xb9b4aacd > v0) {
            if (0x94abab1d == v0) {
                0x94abab1d();
            } else if (0x999895db == v0) {
                0x999895db();
            } else if (0xa0000000 != v0) {
                if (0xa1000000 == v0) {
                    0xa1000000();
                } else {
                    require(0xb80042dc == v0);
                    0xb80042dc();
                }
            }
        } else if (0xb9b4aacd == v0) {
            0xb9b4aacd();
        } else if (0xc7137f5e == v0) {
            0xc7137f5e();
        } else if (0xe1477062 == v0) {
            0xe1477062();
        } else if (0xe98d8c3a == v0) {
            0xe98d8c3a();
        } else {
            require(0xfa461e33 == v0);
        }
        0x000000d7();
        uniswapV3SwapCallback(int256,int256,bytes);
        0x70000000();
    }
}
