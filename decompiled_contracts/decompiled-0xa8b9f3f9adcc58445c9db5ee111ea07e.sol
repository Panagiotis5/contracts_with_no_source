// Decompiled by library.dedaub.com
// 2025.12.17 04:11 UTC
// Compiled using the solidity compiler version 0.8.20


// Data structures and variables inferred from the use of storage instructions
uint256 stor_1; // STORAGE[0x1]
uint256 _executeOperation; // STORAGE[0x2]
mapping (address => bool) _allowedCallers; // STORAGE[0x4]
address _owner; // STORAGE[0x0] bytes 0 to 19
bool _active; // STORAGE[0x3] bytes 0 to 0


// Events
OwnershipTransferred(address, address);

function getPool() public nonPayable { 
    return address(0x87870bca3f3fd6335c3f4ce8392d69350b4fa4e2);
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= varg1 + varg0, Panic(17)); // arithmetic overflow or underflow
    return varg1 + varg0;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require((varg1 == varg1 * varg0 / varg0) | !varg0, Panic(17)); // arithmetic overflow or underflow
    return varg1 * varg0;
}

function active() public nonPayable { 
    return _active;
}

function ADDRESSES_PROVIDER() public nonPayable { 
    return address(0x2f39d218133afab8f2b819b1066c7e434ad94e9e);
}

function executeOperation(address asset, uint256 amount, uint256 premium, address initiator, bytes params) public nonPayable { 
    require(msg.data.length - 4 >= 160);
    require(params <= uint64.max);
    require(4 + params + 31 < msg.data.length);
    require(msg.data[4 + params] <= uint64.max);
    require(v0.data <= msg.data.length);
    require(address(0x87870bca3f3fd6335c3f4ce8392d69350b4fa4e2) == msg.sender, UnauthorizedCaller());
    require(this == initiator, UnauthorizedCaller());
    require(4 + params + 32 + msg.data[4 + params] - (4 + params + 32) >= 192);
    v1 = new struct(6);
    require(!((v1 + 192 > uint64.max) | (v1 + 192 < v1)), Panic(65)); // failed memory allocation (too much memory)
    require(params.word1 == address(params.word1));
    v1.word0 = params.word1;
    require(params.word2 == address(params.word2));
    v1.word1 = params.word2;
    require(params.word3 == address(params.word3));
    v1.word2 = params.word3;
    v1.word3 = params.word4;
    v1.word4 = params.word5;
    require(params.word6 == uint24(params.word6));
    v1.word5 = params.word6;
    v2 = 0x90f(premium, amount, v1);
    require(v2 >= _executeOperation, InsufficientProfit(_executeOperation, v2));
    v3 = _SafeAdd(amount, premium);
    0xbf2(v3, 0x87870bca3f3fd6335c3f4ce8392d69350b4fa4e2, asset);
    return True;
}

function withdrawProfit(address _token) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(msg.sender == _owner, OwnableUnauthorizedAccount(msg.sender));
    v0, /* uint256 */ v1 = _token.balanceOf(this).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    if (v1) {
        v2, v3 = 0x5d3(_owner, 1508, v1);
        emit 0x16e128b6bdadd9e9068abd0b18db2fc8b27ed3dbced50e4aa6cc0a6934251ab(address(v3), v2);
    }
}

function 0x2dba7804() public nonPayable { 
    return _executeOperation;
}

function rescueTokens(address _tokenAddr, uint256 _amount) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(msg.sender == _owner, OwnableUnauthorizedAccount(msg.sender));
    v0, v1 = 0x5d3(_owner, 23787, _amount);
}

function renounceOwnership() public nonPayable { 
    require(msg.sender == _owner, OwnableUnauthorizedAccount(msg.sender));
    _owner = 0;
    emit OwnershipTransferred(_owner, address(0x0));
}

function POOL() public nonPayable { 
    return address(0x87870bca3f3fd6335c3f4ce8392d69350b4fa4e2);
}

function setMinProfit(uint256 _minAcceptableProfit) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(msg.sender == _owner, OwnableUnauthorizedAccount(msg.sender));
    _executeOperation = _minAcceptableProfit;
    emit 0x2acc1bd5b3ae4c19ab13da56e1c7e31ac45f79546e0833f8520002eeb41704e9(_minAcceptableProfit);
}

function allowedCallers(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    return _allowedCallers[varg0];
}

function owner() public nonPayable { 
    return _owner;
}

function 0x940dc368(address varg0, address varg1, address varg2, address varg3, uint256 varg4, uint256 varg5) public nonPayable { 
    require(msg.data.length - 4 >= 192);
    require(stor_1 - 2, ReentrancyGuardReentrantCall());
    stor_1 = 2;
    require(_active, NotActive());
    require(_allowedCallers[msg.sender], UnauthorizedCaller());
    require(0 - varg3, InvalidParams());
    v0 = new uint256[](varg0);
    MEM[v0.data] = varg1;
    require(varg5 == uint24(varg5));
    require(32 >= 32);
    v1 = new uint256[](192);
    v2 = v3 = 0;
    while (v2 < 192) {
        MEM[v2 + v1.data] = MEM[v2 + (MEM[64] + 32)];
        v2 += 32;
    }
    MEM[192 + v1.data] = 0;
    require(bool((address(0x87870bca3f3fd6335c3f4ce8392d69350b4fa4e2)).code.size));
    v4 = address(0x87870bca3f3fd6335c3f4ce8392d69350b4fa4e2).flashLoanSimple(address(this), varg1, varg3, v1, uint16(0), v0, v5, v5, varg2, varg3, varg4, uint24(varg5)).gas(msg.gas);
    require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    stor_1 = 1;
}

function isAllowedCaller(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    return _allowedCallers[varg0];
}

function setActive(bool isActive_) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(msg.sender == _owner, OwnableUnauthorizedAccount(msg.sender));
    _active = isActive_;
    emit 0xfd4c863fca0819fcff766a20df76e96402563b7f7cd04e16ef6b98cc5084418(isActive_);
}

function SWAP_ROUTER() public nonPayable { 
    return address(0xe592427a0aece92de3edee1f18e0157c05861564);
}

function setCallerAllowance(address _caller, bool _isAllowed) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(msg.sender == _owner, OwnableUnauthorizedAccount(msg.sender));
    _allowedCallers[_caller] = _isAllowed;
    emit 0x57c3036567d21a6b6ffc0d4ad1e0037ce150de0c81fcd93c32dca0820b45bc44(_caller, _isAllowed);
}

function withdrawETH() public nonPayable { 
    require(msg.sender == _owner, OwnableUnauthorizedAccount(msg.sender));
    if (this.balance) {
        v0 = _owner.call().value(this.balance).gas(2300 * !this.balance);
        require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
}

function 0xe549ff21() public nonPayable { 
    return 9;
}

function transferOwnership(address newOwner) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(msg.sender == _owner, OwnableUnauthorizedAccount(msg.sender));
    require(newOwner, OwnableInvalidOwner(0));
    _owner = newOwner;
    emit OwnershipTransferred(_owner, newOwner);
}

function MAX_SLIPPAGE() public nonPayable { 
    return 300;
}

function 0x5d3(address varg0, uint256 varg1, uint256 varg2) private { 
    v0 = v1 = 0;
    while (v0 < 68) {
        MEM[v0 + MEM[64]] = MEM[v0 + (MEM[64] + 32)];
        v0 += 32;
    }
    MEM[68 + MEM[64]] = 0;
    v2, /* uint256 */ v3, /* uint256 */ v4, /* uint256 */ v5 = address(v6).transfer(varg0, varg2).gas(msg.gas);
    if (RETURNDATASIZE() == 0) {
        v7 = v8 = 96;
    } else {
        v7 = v9 = new bytes[](RETURNDATASIZE());
        RETURNDATACOPY(v9.data, 0, RETURNDATASIZE());
    }
    if (v2) {
        v10 = v11 = !MEM[v7];
        if (!bool(MEM[v7])) {
            v10 = !(address(v6)).code.size;
        }
        require(!v10, AddressEmptyCode(address(v6)));
        v12 = v13 = 0 != MEM[v7];
        if (0 != MEM[v7]) {
            require(32 + v7 + MEM[v7] - (32 + v7) >= 32);
            require(MEM[32 + v7] == bool(MEM[32 + v7]));
            v12 = !MEM[32 + v7];
        }
        require(!v12, SafeERC20FailedOperation(address(v6)));
        return varg2, v6;
    } else {
        require(!MEM[v7], v5, MEM[v7]);
        revert(FailedInnerCall());
    }
}

function receive() public payable { 
}

function 0x90f(uint256 varg0, uint256 varg1, struct(6) varg2) private { 
    0xbf2(varg2.word3, 0x87870bca3f3fd6335c3f4ce8392d69350b4fa4e2, address(varg2.word1));
    v0, /* uint256 */ v1 = address(varg2.word0).balanceOf(this).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(bool((address(0x87870bca3f3fd6335c3f4ce8392d69350b4fa4e2)).code.size));
    v2 = address(0x87870bca3f3fd6335c3f4ce8392d69350b4fa4e2).liquidationCall(address(varg2.word0), address(varg2.word1), address(varg2.word2), varg2.word3, 0).gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v3, /* uint256 */ v4 = address(varg2.word0).balanceOf(this).gas(msg.gas);
    require(bool(v3), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v5 = _SafeSub(v4, v1);
    require(v5 >= varg2.word4, InsufficientProfit(varg2.word4, v5));
    v6 = 0xd88(varg2.word5, v5, varg2.word1, varg2.word0);
    v7 = _SafeAdd(varg1, varg0);
    require(v6 >= v7, InsufficientProfit(v7, v6));
    v8 = _SafeSub(v6, v7);
    emit 0x77dabbf924a6f11f55b1042aa168a422b93d6d1b6db5d812f2c479c16a512da7(address(varg2.word2), address(varg2.word0), address(varg2.word1), varg2.word3, v5, v8);
    return v8;
}

function 0xbf2(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    v0, /* uint256 */ v1 = address(varg2).allowance(this, address(varg1)).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v2 = _SafeAdd(v1, varg0);
    0xf20(v2, varg1, varg2);
    return ;
}

function 0xd88(uint24 varg0, uint256 varg1, address varg2, address varg3) private { 
    0xbf2(varg1, 0xe592427a0aece92de3edee1f18e0157c05861564, varg3);
    v0 = _SafeSub(10000, 300);
    v1 = _SafeMul(varg1, v0);
    require(10000, Panic(18)); // division by zero
    v2, /* uint256 */ v3 = address(0xe592427a0aece92de3edee1f18e0157c05861564).exactInputSingle(varg3, varg2, varg0, address(this), block.timestamp, varg1, v1 / 10000, address(0x0)).gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(0 - v3, SwapFailed());
    return v3;
}

function 0xf20(uint256 varg0, address varg1, address varg2) private { 
    v0 = v1 = 0;
    while (v0 < 68) {
        MEM[v0 + MEM[64]] = MEM[v0 + (MEM[64] + 32)];
        v0 += 32;
    }
    MEM[68 + MEM[64]] = 0;
    v2 = v3, /* uint256 */ v4, /* uint256 */ v5 = varg2.approve(varg1, varg0).gas(msg.gas);
    if (RETURNDATASIZE() == 0) {
        v6 = v7 = 96;
    } else {
        v6 = v8 = new bytes[](RETURNDATASIZE());
        RETURNDATACOPY(v8.data, 0, RETURNDATASIZE());
    }
    if (v3) {
        v2 = v9 = !MEM[v6];
        if (MEM[v6]) {
            require(v5 + MEM[v6] - v5 >= 32);
            v2 = MEM[v5];
            require(v2 == bool(v2));
        }
    }
    if (v2) {
        v2 = v10 = varg2.code.size > 0;
    }
    if (v2) {
        return ;
    } else {
        v11 = v12 = 0;
        while (v11 < 68) {
            MEM[v11 + MEM[64]] = MEM[v11 + (MEM[64] + 32)];
            v11 += 32;
        }
        MEM[68 + MEM[64]] = 0;
        v13, /* uint256 */ v14, /* uint256 */ v15, /* uint256 */ v16 = varg2.approve(varg1, 0).gas(msg.gas);
        if (RETURNDATASIZE() == 0) {
            v17 = v18 = 96;
        } else {
            v17 = v19 = new bytes[](RETURNDATASIZE());
            RETURNDATACOPY(v19.data, 0, RETURNDATASIZE());
        }
        if (v13) {
            v20 = v21 = !MEM[v17];
            if (!bool(MEM[v17])) {
                v20 = !varg2.code.size;
            }
            require(!v20, AddressEmptyCode(varg2));
            v22 = v23 = 0 != MEM[v17];
            if (0 != MEM[v17]) {
                require(32 + v17 + MEM[v17] - (32 + v17) >= 32);
                require(MEM[32 + v17] == bool(MEM[32 + v17]));
                v22 = !MEM[32 + v17];
            }
            require(!v22, SafeERC20FailedOperation(varg2));
            v24 = v25 = 0;
            while (v24 < 68) {
                MEM[v24 + MEM[64]] = MEM[v24 + (MEM[64] + 32)];
                v24 += 32;
            }
            MEM[68 + MEM[64]] = 0;
            v26, /* uint256 */ v27, /* uint256 */ v28, /* uint256 */ v29 = varg2.call(RETURNDATASIZE(), varg1, RETURNDATASIZE()).gas(msg.gas);
            if (RETURNDATASIZE() == 0) {
                v30 = v31 = 96;
            } else {
                v30 = v32 = new bytes[](RETURNDATASIZE());
                RETURNDATACOPY(v32.data, 0, RETURNDATASIZE());
            }
            if (v26) {
                v33 = v34 = !MEM[v30];
                if (!bool(MEM[v30])) {
                    v33 = !varg2.code.size;
                }
                require(!v33, AddressEmptyCode(varg2));
                v35 = v36 = 0 != MEM[v30];
                if (0 != MEM[v30]) {
                    require(32 + v30 + MEM[v30] - (32 + v30) >= 32);
                    require(MEM[32 + v30] == bool(MEM[32 + v30]));
                    v35 = !MEM[32 + v30];
                }
                require(!v35, SafeERC20FailedOperation(varg2));
                return ;
            } else {
                require(!MEM[v30], v29, MEM[v30]);
                revert(FailedInnerCall());
            }
        } else {
            require(!MEM[v17], v16, MEM[v17]);
            revert(FailedInnerCall());
        }
    }
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        require(!msg.data.length);
        receive();
    } else if (0x7b334154 > function_selector >> 224) {
        if (0x2dba7804 > function_selector >> 224) {
            if (0x26b1d5f == function_selector >> 224) {
                getPool();
            } else if (0x2fb0c5e == function_selector >> 224) {
                active();
            } else if (0x542975c == function_selector >> 224) {
                ADDRESSES_PROVIDER();
            } else if (0x1b11d0ff == function_selector >> 224) {
                executeOperation(address,uint256,uint256,address,bytes);
            } else {
                require(0x24e26241 == function_selector >> 224);
                withdrawProfit(address);
            }
        } else if (0x2dba7804 == function_selector >> 224) {
            0x2dba7804();
        } else if (0x57376198 == function_selector >> 224) {
            rescueTokens(address,uint256);
        } else if (0x715018a6 == function_selector >> 224) {
            renounceOwnership();
        } else if (0x7535d246 == function_selector >> 224) {
            POOL();
        } else {
            require(0x78400f17 == function_selector >> 224);
            setMinProfit(uint256);
        }
    } else if (0xc6005893 > function_selector >> 224) {
        if (0x7b334154 == function_selector >> 224) {
            allowedCallers(address);
        } else if (0x8da5cb5b == function_selector >> 224) {
            owner();
        } else if (0x940dc368 == function_selector >> 224) {
            0x940dc368();
        } else if (0xa6801258 == function_selector >> 224) {
            isAllowedCaller(address);
        } else {
            require(0xacec338a == function_selector >> 224);
            setActive(bool);
        }
    } else if (0xc6005893 == function_selector >> 224) {
        SWAP_ROUTER();
    } else if (0xcab0de25 == function_selector >> 224) {
        setCallerAllowance(address,bool);
    } else if (0xe086e5ec == function_selector >> 224) {
        withdrawETH();
    } else if (0xe549ff21 == function_selector >> 224) {
        0xe549ff21();
    } else if (0xf2fde38b == function_selector >> 224) {
        transferOwnership(address);
    } else {
        require(0xf9759518 == function_selector >> 224);
        MAX_SLIPPAGE();
    }
}
