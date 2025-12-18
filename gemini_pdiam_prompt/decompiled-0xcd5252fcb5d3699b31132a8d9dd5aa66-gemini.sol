// Decompiled by library.dedaub.com
// 2025.12.17 03:48 UTC
// Compiled using the solidity compiler version 0.8.25


// Data structures and variables inferred from the use of storage instructions
mapping (uint256 => struct_679) _getRoleAdmin; // STORAGE[0x0]
mapping (uint256 => struct_682) _getRoleMemberCount; // STORAGE[0x1]
uint256 _getRate; // STORAGE[0x2]
mapping (address => mapping (uint256 => uint32)) mapping_4; // STORAGE[0x4]
mapping (address => struct_683[]) _reports; // STORAGE[0x5]
uint32 _updatedAt; // STORAGE[0x3] bytes 0 to 3

struct struct_679 { mapping (address => bool) field0; uint256 field1; };
struct struct_682 { uint256[] field0; mapping (address => uint256) field1; };
struct struct_683 { uint224 field0_0_27; uint32 field0_28_31; bool field1; };

// Events
RoleGranted(bytes32, address, address);
RoleRevoked(bytes32, address, address);

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function fallback() public payable { 
    revert();
}

function supportsInterface(bytes4 interfaceId) public payable { 
    require(msg.data.length - 4 >= 32);
    v0 = v1 = 0x5a05180f00000000000000000000000000000000000000000000000000000000 == interfaceId;
    if (0x5a05180f00000000000000000000000000000000000000000000000000000000 != interfaceId) {
        v0 = v2 = 0x7965db0b00000000000000000000000000000000000000000000000000000000 == interfaceId;
        if (0x7965db0b00000000000000000000000000000000000000000000000000000000 != interfaceId) {
            v0 = v3 = interfaceId == 0x1ffc9a700000000000000000000000000000000000000000000000000000000;
        }
    }
    return bool(v0);
}

function 0x1ad5b19c(uint256 varg0, uint256 varg1, uint256 varg2) public payable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 <= uint64.max);
    require(4 + varg0 + 31 < msg.data.length);
    require(varg0.length <= uint64.max);
    require(4 + varg0 + (varg0.length << 5) + 32 <= msg.data.length);
    require(varg1 <= uint64.max);
    require(4 + varg1 + 31 < msg.data.length);
    require(varg1.length <= uint64.max);
    require(4 + varg1 + (varg1.length << 5) + 32 <= msg.data.length);
    require(varg2 <= uint64.max);
    require(4 + varg2 + 31 < msg.data.length);
    require(varg2.length <= uint64.max);
    require(4 + varg2 + (varg2.length << 5) + 32 <= msg.data.length);
    v0, /* uint256 */ v1 = address(0xe3b5b799b1a3877444cdb7ca419d9f594c3565f1).staticcall(uint32(0x56679cf4)).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(_getRoleAdmin[v1].field0[msg.sender], AccessControlUnauthorizedAccount(msg.sender, v1));
    v2 = v3 = 0;
    while (1) {
        if (v2 >= varg0.length) {
            exit;
        } else {
            require(v2 < varg0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require((v2 << 5) + varg0.data + 32 - ((v2 << 5) + varg0.data) >= 32);
            require(varg0[v2] == address(varg0[v2]));
            require(v2 < varg1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require((v2 << 5) + varg1.data + 32 - ((v2 << 5) + varg1.data) >= 32);
            require(varg1[v2] == uint224(varg1[v2]));
            require(v2 < varg2.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require((v2 << 5) + varg2.data + 32 - ((v2 << 5) + varg2.data) >= 32);
            require(varg2[v2] == uint32(varg2[v2]));
            require(bool((address(0xe3b5b799b1a3877444cdb7ca419d9f594c3565f1)).code.size));
            v4 = address(0xe3b5b799b1a3877444cdb7ca419d9f594c3565f1).call(bytes4(0x6c038d0300000000000000000000000000000000000000000000000000000000), address(varg0[v2]), uint224(varg1[v2]), uint32(varg2[v2])).gas(msg.gas);
            require(bool(v4), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
            if (!(address(varg0[v2]) - address(0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee))) {
                require(!v2, InvalidOrder());
                require(v2 < varg1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                require((v2 << 5) + varg1.data + 32 - ((v2 << 5) + varg1.data) >= 32);
                require(varg1[v2] == uint224(varg1[v2]));
                0xba2(varg1[v2]);
            }
            v5 = _SafeSub(_reports[address(varg0[v2])].length, 1);
            mapping_4[address(varg0[v2])][v5] = block.timestamp;
            v2 += 1;
        }
    }
}

function getRoleAdmin(bytes32 role) public payable { 
    require(msg.data.length - 4 >= 32);
    return _getRoleAdmin[role].field1;
}

function reports(address varg0) public payable { 
    require(msg.data.length - 4 >= 32);
    return _reports[varg0].length;
}

function 0x2bde5811(address varg0, uint256 varg1) public payable { 
    require(msg.data.length - 4 >= 64);
    return mapping_4[varg0][varg1];
}

function grantRole(bytes32 role, address account) public payable { 
    require(msg.data.length - 4 >= 64);
    require(_getRoleAdmin[_getRoleAdmin[role].field1].field0[msg.sender], AccessControlUnauthorizedAccount(msg.sender, _getRoleAdmin[role].field1));
    if (_getRoleAdmin[role].field0[account]) {
        v0 = 0;
    } else {
        _getRoleAdmin[role].field0[account] = 1;
        emit RoleGranted(role, account, msg.sender);
        v0 = v1 = 1;
    }
    if (v0) {
        if (!_getRoleMemberCount[role].field1[account]) {
            v2 = v3 = 1;
            _getRoleMemberCount[role].length += v3;
            _getRoleMemberCount[role].field0[_getRoleMemberCount[role].length] = account;
            _getRoleMemberCount[role].field1[account] = _getRoleMemberCount[role].length;
        }
    }
}

function decimals() public payable { 
    return uint8(18);
}

function renounceRole(bytes32 role, address account) public payable { 
    require(msg.data.length - 4 >= 64);
    require(msg.sender == account, AccessControlBadConfirmation());
    v0 = 0xc12(account, role);
}

function latestAnswer() public payable { 
    return _getRate;
}

function getRate() public payable { 
    return _getRate;
}

function updatedAt() public payable { 
    return _updatedAt;
}

function oracle() public payable { 
    return address(0xe3b5b799b1a3877444cdb7ca419d9f594c3565f1);
}

function 0x8f88cbfb(uint256 varg0) public payable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 <= uint64.max);
    require(4 + varg0 + 31 < msg.data.length);
    require(varg0.length <= uint64.max);
    require(4 + varg0 + (varg0.length << 6) + 32 <= msg.data.length);
    v0 = v1 = varg0.data;
    v2, /* uint256 */ v3 = address(0xe3b5b799b1a3877444cdb7ca419d9f594c3565f1).staticcall(uint32(0xd4ad5f38)).gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(_getRoleAdmin[v3].field0[msg.sender], AccessControlUnauthorizedAccount(msg.sender, v3));
    require(0 < varg0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    require(v1 + 32 - v1 >= 32);
    require(varg0[0] == address(varg0[0]));
    require(address(varg0[0]) == address(0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee), InvalidOrder());
    v4 = new uint256[](varg0.length);
    v5 = v6 = 0;
    v7 = v8 = v4.data;
    while (v5 < varg0.length) {
        require(msg.data[v0] == address(msg.data[v0]));
        MEM[v7] = address(msg.data[v0]);
        require(msg.data[v0 + 32] == uint224(msg.data[v0 + 32]));
        MEM[32 + v7] = uint224(msg.data[v0 + 32]);
        v7 += 64;
        v0 += 64;
        v5 += 1;
    }
    require(bool((address(0xe3b5b799b1a3877444cdb7ca419d9f594c3565f1)).code.size));
    v9 = address(0xe3b5b799b1a3877444cdb7ca419d9f594c3565f1).call(0x8f88cbfb, v4).gas(msg.gas);
    require(bool(v9), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    v10 = v11 = 0;
    while (1) {
        if (v10 >= varg0.length) {
            exit;
        } else {
            require(v10 < varg0.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require((v10 << 6) + v1 + 32 - ((v10 << 6) + v1) >= 32);
            require(varg0[v10] == address(varg0[v10]));
            v12, /* uint224 */ v13, /* uint32 */ v14, /* bool */ v15 = address(0xe3b5b799b1a3877444cdb7ca419d9f594c3565f1).getReport(address(varg0[v10])).gas(msg.gas);
            require(bool(v12), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 96);
            v16 = new struct(3);
            require(!((v16 + 96 > uint64.max) | (v16 + 96 < v16)), Panic(65)); // failed memory allocation (too much memory)
            require(v13 == uint224(v13));
            v16.word0 = v13;
            require(v14 == uint32(v14));
            v16.word1 = v14;
            require(v15 == bool(v15));
            v16.word2 = v15;
            _reports[address(varg0[v10])].length += 1;
            _reports[address(varg0[v10])][_reports[address(varg0[v10])].length].field0_0_27 = v16.word0;
            _reports[address(varg0[v10])][_reports[address(varg0[v10])].length].field0_28_31 = v16.word1;
            v17 = v18 = !v16.word2;
            _reports[address(varg0[v10])][_reports[address(varg0[v10])].length].field1_0_0 = v16.word2;
            if (!bool(v16.word2)) {
                v17 = address(varg0[v10]) == address(0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee);
            }
            if (v17) {
                0xba2(v16.word0);
            }
            v10 += 1;
        }
    }
}

function getRoleMember(bytes32 role, uint256 index) public payable { 
    require(msg.data.length - 4 >= 64);
    require(index < _getRoleMemberCount[role].length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    return address(_getRoleMemberCount[role].field0[index]);
}

function hasRole(bytes32 role, address account) public payable { 
    require(msg.data.length - 4 >= 64);
    return _getRoleAdmin[role].field0[account];
}

function DEFAULT_ADMIN_ROLE() public payable { 
    return 0;
}

function getRoleMembers(bytes32 role) public payable { 
    require(msg.data.length - 4 >= 32);
    
    uint256 count = _getRoleMemberCount[role].length;
    address[] memory members = new address[](count);
    
    for (uint256 i = 0; i < count; i++) {
        members[i] = address(uint160(_getRoleMemberCount[role].field0[i]));
    }
    
    return members;
}

function getRoleMemberCount(bytes32 role) public payable { 
    require(msg.data.length - 4 >= 32);
    return _getRoleMemberCount[role].length;
}

function baseAsset() public payable { 
    return address(0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee);
}

function revokeRole(bytes32 role, address account) public payable { 
    require(msg.data.length - 4 >= 64);
    require(_getRoleAdmin[_getRoleAdmin[role].field1].field0[msg.sender], AccessControlUnauthorizedAccount(msg.sender, _getRoleAdmin[role].field1));
    v0 = 0xc12(account, role);
}

function 0xf8403c3d(address varg0, uint256 varg1) public payable { 
    require(msg.data.length - 4 >= 64);
    MEM[MEM[64]] = 0;
    MEM[MEM[64] + 32] = 0;
    MEM[64 + MEM[64]] = 0;
    require(varg1 < _reports[varg0].length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    v0 = new struct(3);
    v0.word0 = _reports[varg0][varg1].field0_0_27;
    v0.word1 = _reports[varg0][varg1].field0_28_31;
    v0.word2 = _reports[varg0][varg1].field1_0_0;
    return uint224(v0.word0), uint32(v0.word1), bool(v0.word2);
}

function latestRoundData() public payable { 
    return 0, _getRate, _updatedAt, _updatedAt, 0;
}

function 0xba2(uint224 varg0) private { 
    require(varg0, Panic(18)); // division by zero
    _getRate = 10 ** 36 / varg0;
    _updatedAt = block.timestamp;
    return ;
}

function 0xc12(uint256 varg0, uint256 varg1) private { 
    v0 = 0xd41(varg0, varg1);
    if (!v0) {
        return v0;
    } else {
        v1 = keccak256(varg1, 1);
        v2 = address(varg0);
        if (_getRoleMemberCount[varg1].field1[v2]) {
            v3 = _SafeSub(_getRoleMemberCount[varg1].field1[v2], 1);
            v4 = _SafeSub(_getRoleMemberCount[varg1].length, 1);
            if (v3 != v4) {
                require(v4 < _getRoleMemberCount[varg1].length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                require(v3 < _getRoleMemberCount[varg1].length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                _getRoleMemberCount[varg1].field0[v3] = _getRoleMemberCount[varg1].field0[v4];
                _getRoleMemberCount[varg1].field1[_getRoleMemberCount[varg1].field0[v4]] = _getRoleMemberCount[varg1].field1[v2];
            }
            require(_getRoleMemberCount[varg1].length, Panic(49)); // attemp to .pop an empty array
            _getRoleMemberCount[varg1].field0[_getRoleMemberCount[varg1].length - 1] = 0;
            _getRoleMemberCount[varg1].length = _getRoleMemberCount[varg1].length - 1;
            _getRoleMemberCount[varg1].field1[v2] = 0;
        }
        return v0;
    }
}

function 0xd41(address varg0, uint256 varg1) private { 
    if (!_getRoleAdmin[varg1].field0[varg0]) {
        return 0;
    } else {
        _getRoleAdmin[varg1].field0[varg0] = 0;
        emit RoleRevoked(varg1, varg0, msg.sender);
        return 1;
    }
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    require(!msg.value);
    if (msg.data.length >= 4) {
        if (0x7dc0d1d0 > function_selector >> 224) {
            if (0x2f2ff15d > function_selector >> 224) {
                if (0x1ffc9a7 == function_selector >> 224) {
                    supportsInterface(bytes4);
                } else if (0x1ad5b19c == function_selector >> 224) {
                    0x1ad5b19c();
                } else if (0x248a9ca3 == function_selector >> 224) {
                    getRoleAdmin(bytes32);
                } else if (0x252210e3 == function_selector >> 224) {
                    reports(address);
                } else if (0x2bde5811 == function_selector >> 224) {
                    0x2bde5811();
                }
            } else if (0x2f2ff15d == function_selector >> 224) {
                grantRole(bytes32,address);
            } else if (0x313ce567 == function_selector >> 224) {
                decimals();
            } else if (0x36568abe == function_selector >> 224) {
                renounceRole(bytes32,address);
            } else if (0x50d25bcd == function_selector >> 224) {
                latestAnswer();
            } else if (0x679aefce == function_selector >> 224) {
                getRate();
            } else {
                require(0x7519ab50 == function_selector >> 224);
                updatedAt();
            }
        } else if (0xa3246ad3 > function_selector >> 224) {
            if (0x7dc0d1d0 == function_selector >> 224) {
                oracle();
            } else if (0x8f88cbfb == function_selector >> 224) {
                0x8f88cbfb();
            } else if (0x9010d07c == function_selector >> 224) {
                getRoleMember(bytes32,uint256);
            } else if (0x91d14854 == function_selector >> 224) {
                hasRole(bytes32,address);
            } else {
                require(0xa217fddf == function_selector >> 224);
                DEFAULT_ADMIN_ROLE();
            }
        } else if (0xa3246ad3 == function_selector >> 224) {
            getRoleMembers(bytes32);
        } else if (0xca15c873 == function_selector >> 224) {
            getRoleMemberCount(bytes32);
        } else if (0xcdf456e1 == function_selector >> 224) {
            baseAsset();
        } else if (0xd547741f == function_selector >> 224) {
            revokeRole(bytes32,address);
        } else if (0xf8403c3d == function_selector >> 224) {
            0xf8403c3d();
        } else {
            require(0xfeaf968c == function_selector >> 224);
            latestRoundData();
        }
    }
    fallback();
}
