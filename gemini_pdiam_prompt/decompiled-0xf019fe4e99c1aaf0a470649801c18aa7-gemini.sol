// Decompiled by library.dedaub.com
// 2025.12.17 04:55 UTC
// Compiled using the solidity compiler version 0.8.20


// Data structures and variables inferred from the use of storage instructions
mapping (uint256 => struct_1591) _getRoleAdmin; // STORAGE[0x0]
uint256 stor_1; // STORAGE[0x1]
string _name; // STORAGE[0x2]
string _symbol; // STORAGE[0x3]
mapping (uint256 => address) mapping_4; // STORAGE[0x4]
mapping (address => uint256) _balanceOf; // STORAGE[0x5]
mapping (uint256 => address) _getApproved; // STORAGE[0x6]
mapping (address => mapping (address => bool)) _isApprovedForAll; // STORAGE[0x7]
uint256 _feePercent; // STORAGE[0x9]
uint256 _nextProjectId; // STORAGE[0xa]
mapping (uint256 => uint256) mapping_b; // STORAGE[0xb]
mapping (uint256 => struct_1590) _projects; // STORAGE[0xc]
mapping (uint256 => mapping (uint256 => struct_1599)) _batches; // STORAGE[0xd]
mapping (uint256 => mapping (uint256 => mapping (uint256 => uint256))) mapping_e; // STORAGE[0xe]
string _tokenURI; // STORAGE[0xf]
address _feeTo; // STORAGE[0x8] bytes 0 to 19

struct struct_1591 { mapping (address => bool) field0; uint256 field1; };
struct struct_1599 { uint256 field0; uint256 field1; uint256 field2; bool field3; };
struct struct_1590 { address field0; address field1; address field2; uint256 field3; uint256 field4; uint256 field5; uint256 field6; uint256 field7; uint256 field8; address[] field9; uint256[] field10; uint256 field11; };

// Events
BaseURISet(string, string);
FeePercentUpdated(uint256, uint256);
BatchCreated(uint256, uint256);
FeeToUpdated(address, address);
Transfer(address, address, uint256);
RoleGranted(bytes32, address, address);
RoleRevoked(bytes32, address, address);
ApprovalForAll(address, address, bool);
Approval(address, address, uint256);

function 0x1312(bytes varg0, uint256 varg1, uint256 varg2, uint256 varg3) private { 
    0x95e(varg1, varg2, varg3);
    0x217f(varg0, varg1, varg2, varg3, msg.sender);
    return ;
}

function 0x16c4(uint256 varg0) private { 
    require((_feePercent == _feePercent * varg0 / varg0) | !varg0, Panic(17)); // arithmetic overflow or underflow
    v0 = _SafeDiv(_feePercent * varg0, 10000);
    return v0;
}

function 0x1721(uint256 varg0) private { 
    require(mapping_4[varg0], ERC721NonexistentToken(varg0));
    return mapping_4[varg0];
}

function 0x1767() private { 
    require(stor_1 - 2, ReentrancyGuardReentrantCall());
    stor_1 = 2;
    return ;
}

function 0x1967(uint256 varg0, uint256 varg1) private { 
    v0 = 0x26cc(varg1);
    require((uint16(v0) == uint16(v0) * varg0 / varg0) | !varg0, Panic(17)); // arithmetic overflow or underflow
    v1 = _SafeDiv(uint16(v0) * varg0, 10000);
    return v1;
}

function 0x19c5(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) private { 
    v0 = varg3.call(varg1).gas(msg.gas);
    require(v0, MEM[64], RETURNDATASIZE());
    if (!RETURNDATASIZE()) {
        v1 = v2 = !(address(varg3)).code.size;
    } else {
        v1 = v3 = 1 != MEM[0];
    }
    require(!v1, SafeERC20FailedOperation(address(varg3)));
    return ;
}

function 0x19f7(uint256 varg0, uint256 varg1) private { 
    MEM[64] += 32;
    MEM[MEM[64]] = 0;
    0x2939(varg0, varg1);
    0x217f(MEM[64], varg0, varg1, 0, msg.sender);
    return ;
}

function 0x1a11(uint256 varg0, uint256 varg1, address varg2) private { 
    if (address(varg0)) {
        0x27c4(varg1, varg0, mapping_4[varg1]);
    }
    if (mapping_4[varg1]) {
        0x2581(0, 0, varg1, 0);
        _balanceOf[mapping_4[varg1]] += uint256.max;
    }
    if (varg2) {
        _balanceOf[varg2] += 1;
    }
    mapping_4[varg1] = varg2;
    emit Transfer(mapping_4[varg1], varg2, varg1);
    return mapping_4[varg1];
}

function 0x203c(address varg0, uint256 varg1) private { 
    if (!_getRoleAdmin[varg1].field0[varg0]) {
        return 0;
    } else {
        _getRoleAdmin[varg1].field0[varg0] = 0;
        emit RoleRevoked(varg1, varg0, msg.sender);
        return 1;
    }
}

function 0x217f(bytes varg0, uint256 varg1, uint256 varg2, uint256 varg3, address varg4) private { 
    if (!(address(varg2)).code.size) {
        return ;
    } else {
        v0 = varg0;
        v3 = v4, /* uint256 */ v5, /* bytes */ varg0 = address(varg2).onERC721Received(varg4, address(varg3), varg1, v0).gas(msg.gas);
        if (v4) {
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            require(varg0 == bytes4(varg0));
            v3 = v6 = 1;
        }
        if (v3) {
            require(0x150b7a0200000000000000000000000000000000000000000000000000000000 == bytes4(varg0), ERC721InvalidReceiver(address(varg3)));
            return ;
        } else {
            if (!RETURNDATASIZE()) {
                v7 = v8 = 96;
            } else {
                v7 = v9 = new bytes[](RETURNDATASIZE());
                RETURNDATACOPY(v9.data, 0, RETURNDATASIZE());
            }
            require(0 - MEM[v7], ERC721InvalidReceiver(address(varg3)));
            revert(v5, MEM[v7]);
        }
    }
}

function fallback() public payable { 
    revert();
}

function 0x22aa(uint256 varg0, uint256 varg1) private { 
    require((varg0 == varg0 << 1 >> 1) | !0x2, Panic(17)); // arithmetic overflow or underflow
    v0 = (varg0 << 1) + 2;
    require(2 <= v0, Panic(17)); // arithmetic overflow or underflow
    require(v0 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v1 = new bytes[](v0);
    if (v0) {
        CALLDATACOPY(v1.data, msg.data.length, v0);
    }
    require(0 < v1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    MEM8[v1.data] = (byte(bytes1(0x3000000000000000000000000000000000000000000000000000000000000000), 0x0)) & 0xFF;
    require(1 < v1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    MEM8[33 + v1] = (byte(bytes1(0x7800000000000000000000000000000000000000000000000000000000000000), 0x0)) & 0xFF;
    require((varg0 == varg0 << 1 >> 1) | !0x2, Panic(17)); // arithmetic overflow or underflow
    v2 = (varg0 << 1) + 1;
    require(1 <= v2, Panic(17)); // arithmetic overflow or underflow
    while (v2 > 1) {
        require(bool(varg1) < 16, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require(v2 < v1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        MEM8[32 + v2 + v1] = (byte(bytes1((byte('0123456789abcdef', bool(varg1))) << 248), 0x0)) & 0xFF;
        varg1 = varg1 >> 4;
        require(v2, Panic(17)); // arithmetic overflow or underflow
        v2 += uint256.max;
    }
    require(!varg1, StringsInsufficientHexLength(varg1, varg0));
    return v1;
}

function feeTo() public payable { 
    return _feeTo;
}

function 0x2421(uint256 varg0) private { 
    v0 = v1 = 0;
    if (varg0 >= 10 ** 64) {
        varg0 = v2 = varg0 / 10 ** 64;
        v0 = v3 = 64;
    }
    if (varg0 >= 10 ** 32) {
        varg0 = v4 = varg0 / 10 ** 32;
        v0 = v5 = 32 + v0;
    }
    if (varg0 >= 10 ** 16) {
        varg0 = v6 = varg0 / 10 ** 16;
        v0 = v7 = 16 + v0;
    }
    if (varg0 >= 10 ** 8) {
        varg0 = v8 = varg0 / 10 ** 8;
        v0 = v9 = 8 + v0;
    }
    if (varg0 >= 10000) {
        varg0 = v10 = varg0 / 10000;
        v0 = v11 = 4 + v0;
    }
    if (varg0 >= 100) {
        varg0 = v12 = varg0 / 100;
        v0 = v13 = 2 + v0;
    }
    if (varg0 >= 10) {
        v0 = v14 = 1 + v0;
    }
    require(1 + v0 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v15 = new bytes[](1 + v0);
    if (1 + v0) {
        CALLDATACOPY(v15.data, msg.data.length, 1 + v0);
    }
    v16 = v17 = 32 + (v15 + (1 + v0));
    while (varg0) {
        v16 += uint256.max;
        MEM8[v16] = (byte('0123456789abcdef', varg0 % 10)) & 0xFF;
        varg0 = varg0 / 10;
    }
    return v15;
}

function 0x2581(uint256 varg0, address varg1, uint256 varg2, address varg3) private { 
    if (!varg0) {
        varg0 = v0 = bool(varg1);
    }
    if (varg0) {
        v1 = 0x1721(varg2);
        v2 = v3 = bool(varg1);
        if (varg1) {
            v2 = v4 = address(v1) != varg1;
        }
        if (v2) {
            v2 = v5 = !_isApprovedForAll[address(v1)][varg1];
        }
        require(!v2, ERC721InvalidApprover(varg1));
        if (varg0) {
            emit Approval(address(v1), varg3, varg2);
        }
    }
    _getApproved[varg2] = varg3;
    return ;
}

function supportsInterface(bytes4 interfaceId) public payable { 
    require(msg.data.length - 4 >= 32);
    v0 = v1 = 0x80ac58cd00000000000000000000000000000000000000000000000000000000 == interfaceId;
    if (0x80ac58cd00000000000000000000000000000000000000000000000000000000 != interfaceId) {
        v0 = v2 = 0x5b5e139f00000000000000000000000000000000000000000000000000000000 == interfaceId;
    }
    if (!v0) {
        v0 = v3 = 0x7965db0b00000000000000000000000000000000000000000000000000000000 == interfaceId;
        if (0x7965db0b00000000000000000000000000000000000000000000000000000000 != interfaceId) {
            v0 = interfaceId == 0x1ffc9a700000000000000000000000000000000000000000000000000000000;
        }
    }
    return bool(v0);
}

function 0x26cc(uint256 varg0) private { 
    v0 = v1 = 0;
    while (v0 < STORAGE[varg0 + 10]) {
        require(v0 < STORAGE[10 + varg0], Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v0 = 0x3642(v0, uint16(STORAGE[(v0 >> 4) + keccak256(10 + varg0)] / (uint8.max + 1) ** (v0 % 16 << 1)));
        v0 = 0x3387(v0);
    }
    return v0;
}

function 0x27c4(uint256 varg0, address varg1, address varg2) private { 
    v0 = v1 = bool(varg1);
    if (varg1) {
        v0 = v2 = varg2 == varg1;
        if (varg2 != varg1) {
            v0 = v3 = _isApprovedForAll[varg2][varg1];
        }
        if (!v0) {
            v0 = v4 = varg1 == _getApproved[varg0];
        }
    }
    if (v0) {
        return ;
    } else {
        require(varg2, ERC721NonexistentToken(varg0));
        revert(ERC721InsufficientApproval(varg1, varg0));
    }
}

function name() public payable { 
    v0 = 0x30ca(_name.length);
    v1 = new bytes[](v0);
    v2 = v3 = v1.data;
    v4 = 0x30ca(_name.length);
    if (v4) {
        if (31 < v4) {
            v5 = _name.data;
            while (v3 + v4 > v2) {
                MEM[v2] = STORAGE[v5];
                v5 += 1;
                v2 += 32;
            }
        } else {
            MEM[v3] = _name.length >> 8 << 8;
        }
    }
    return v1;
}

function 0x2939(uint256 varg0, uint256 varg1) private { 
    require(address(varg1), ERC721InvalidReceiver(0));
    v0 = 0x1a11(0, varg0, varg1);
    require(!address(v0), ERC721InvalidSender(0));
    return ;
}

function getApproved(uint256 tokenId) public payable { 
    require(msg.data.length - 4 >= 32);
    v0 = 0x1721(tokenId);
    return _getApproved[tokenId];
}

function approve(address spender, uint256 amount) public payable { 
    require(msg.data.length - 4 >= 64);
    0x2581(1, msg.sender, amount, spender);
}

function projects(uint256 varg0) public payable { 
    require(msg.data.length - 4 >= 32);
    return _projects[varg0].field0_0_19, _projects[varg0].field1_0_19, _projects[varg0].field2_0_19, _projects[varg0].field3, _projects[varg0].field4, _projects[varg0].field5, _projects[varg0].field6, _projects[varg0].field7, _projects[varg0].field8, bool(_projects[varg0].field11), bool(_projects[varg0].field11 >> 8);
}

function 0x30ca(uint256 varg0) private { 
    v0 = v1 = varg0 >> 1;
    if (!(varg0 & 0x1)) {
        v0 = v2 = v1 & 0x7f;
    }
    require((varg0 & 0x1) - (v0 < 32), Panic(34)); // access to incorrectly encoded storage byte array
    return v0;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function 0x3387(uint256 varg0) private { 
    require(varg0 + 1, Panic(17)); // arithmetic overflow or underflow
    return 1 + varg0;
}

function _SafeDiv(uint256 varg0, uint256 varg1) private { 
    require(varg1, Panic(18)); // division by zero
    return varg0 / varg1;
}

function 0x3642(uint16 varg0, uint16 varg1) private { 
    require(varg1 + varg0 <= uint16.max, Panic(17)); // arithmetic overflow or underflow
    return varg1 + varg0;
}

function completeProject(uint256 projectId) public payable { 
    require(msg.data.length - 4 >= 32);
    0x1767();
    v0 = keccak256(projectId, 12);
    require(!uint8(_projects[projectId].field11 >> 8), Error('already done'));
    v1 = v2 = msg.sender == _projects[projectId].field0_0_19;
    if (msg.sender != _projects[projectId].field0_0_19) {
        v1 = _getRoleAdmin[0].field0[msg.sender];
    }
    require(v1, Error('not authorised'));
    _projects[projectId].field11 = 0x100 | 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00ff & _projects[projectId].field11;
    v3 = 0x1967(_projects[projectId].field4, v0);
    v4 = v5 = !v3;
    if (v3) {
        v4 = !_projects[projectId].length;
    }
    if (!v4) {
        require(_projects[projectId].length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
        v6 = new uint256[](_projects[projectId].length);
        if (_projects[projectId].length) {
            CALLDATACOPY(v6.data, msg.data.length, _projects[projectId].length << 5);
        }
        v7 = v8 = 0;
        while (v7 < _projects[projectId].length) {
            v9 = _SafeSub(_projects[projectId].length, 1);
            if (v7 - v9) {
                require(v7 < _projects[projectId].length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                require((uint16(_projects[projectId].field10[v7 >> 4] / (uint8.max + 1) ** (bool(v7) << 1)) == uint16(_projects[projectId].field10[v7 >> 4] / (uint8.max + 1) ** (bool(v7) << 1)) * v3 / v3) | !v3, Panic(17)); // arithmetic overflow or underflow
                v10 = v11 = _SafeDiv(uint16(_projects[projectId].field10[v7 >> 4] / (uint8.max + 1) ** (bool(v7) << 1)) * v3, 10000);
                v7 += v11;
                require(v7 <= v7, Panic(17)); // arithmetic overflow or underflow
                break;
            } else {
                v10 = v12 = _SafeSub(v3, v7);
            }
            require(v7 < v6.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            v6[v7] = v10;
            if (0 - v10) {
                require(v7 < _projects[projectId].length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
                if (!uint8(_projects[projectId].field11)) {
                    MEM[MEM[64] + 36] = _projects[projectId].field0_0_19;
                    MEM[MEM[64] + 68] = _projects[projectId].field9[v7];
                    MEM[MEM[64] + 100] = v10;
                    0x19c5(132 + MEM[64], 0x23b872dd, _projects[projectId].field2_0_19, _projects[projectId].field2_0_19);
                } else {
                    MEM[MEM[64] + 36] = _projects[projectId].field9[v7];
                    MEM[MEM[64] + 68] = v10;
                    0x19c5(100 + MEM[64], 0xa9059cbb, _projects[projectId].field2_0_19, _projects[projectId].field2_0_19);
                }
            } else {
                break;
            }
            v7 = 0x3387(v7);
        }
        _projects[projectId].field8 = v3;
        v13 = new uint256[](_projects[projectId].length);
        v14 = v15 = v13.data;
        v16 = v17 = _projects[projectId].data;
        v18 = v19 = 0;
        while (v18 < _projects[projectId].length) {
            MEM[v14] = address(STORAGE[v16]);
            v16 += 1;
            v14 += 32;
            v18 += 1;
        }
        v14 = new uint256[](v6.length);
        v13 = v6;
        emit 0x90a5190939188bb9dbf6146f5ca4da9b8b1134a33573bf7d51637cfd2381ee3b(projectId, v3, v13, v14);
    } else {
        _projects[projectId].field8 = 0;
    }
    if (uint8(_projects[projectId].field11)) {
        v26 = _SafeSub(_projects[projectId].field3, _projects[projectId].field4);
        v27 = 0x16c4(_projects[projectId].field3);
        v28 = _SafeSub(v27, _projects[projectId].field7);
        v29 = 0x1967(_projects[projectId].field3, v0);
        v30 = _SafeSub(v29, _projects[projectId].field8);
        require(v26 <= v28 + v26, Panic(17)); // arithmetic overflow or underflow
        require(v28 + v26 <= v30 + (v28 + v26), Panic(17)); // arithmetic overflow or underflow
        if (v30 + (v28 + v26)) {
            MEM[MEM[64] + 36] = _projects[projectId].field0_0_19;
            MEM[MEM[64] + 68] = v30 + (v28 + v26);
            0x19c5(100 + MEM[64], 0xa9059cbb, _projects[projectId].field2_0_19, _projects[projectId].field2_0_19);
        }
    }
    0x19f7(projectId, _projects[projectId].field0_0_19);
    emit 0xc23e22469861e322fe9849aa44a4bd1d675de79dd0849b1d1089d9080e28685d(projectId, _projects[projectId].field0_0_19, _projects[projectId].field6, _projects[projectId].field4, _projects[projectId].field7, _projects[projectId].field8);
    stor_1 = 1;
}

function transferFrom(address sender, address recipient, uint256 amount) public payable { 
    require(msg.data.length - 4 >= 96);
    0x95e(amount, recipient, sender);
}

function getRoleAdmin(bytes32 role) public payable { 
    require(msg.data.length - 4 >= 32);
    return _getRoleAdmin[role].field1;
}

function 0x2836aa64(address varg0, address varg1, uint256 varg2, address varg3, uint256 varg4, uint256 varg5, uint256 varg6) public payable { 
    require(msg.data.length - 4 >= 224);
    require(varg4 <= uint64.max);
    require(4 + varg4 + 31 < msg.data.length);
    require(varg4.length <= uint64.max);
    require(4 + varg4 + varg4.length + 32 <= msg.data.length);
    require(varg5 <= uint64.max);
    require(4 + varg5 + 31 < msg.data.length);
    require(varg5.length <= uint64.max);
    require(4 + varg5 + (varg5.length << 5) + 32 <= msg.data.length);
    require(varg6 <= uint64.max);
    require(4 + varg6 + 31 < msg.data.length);
    require(varg6.length <= uint64.max);
    require(4 + varg6 + (varg6.length << 5) + 32 <= msg.data.length);
    v0 = 0x9e9(varg6.length, varg6.data, varg5.length, varg5.data, varg4.length, varg4.data, varg3, varg2, varg1, varg0);
    return v0;
}

function grantRole(bytes32 role, address account) public payable { 
    require(msg.data.length - 4 >= 64);
    require(_getRoleAdmin[_getRoleAdmin[role].field1].field0[msg.sender], AccessControlUnauthorizedAccount(msg.sender, _getRoleAdmin[role].field1));
    if (!_getRoleAdmin[role].field0[account]) {
        _getRoleAdmin[role].field0[account] = 1;
        emit RoleGranted(role, account, msg.sender);
    }
}

function renounceRole(bytes32 role, address account) public payable { 
    require(msg.data.length - 4 >= 64);
    require(msg.sender == account, AccessControlBadConfirmation());
    v0 = 0x203c(account, role);
}

function safeTransferFrom(address from, address to, uint256 tokenId) public payable { 
    require(msg.data.length - 4 >= 96);
    MEM[64] += 32;
    MEM[MEM[64]] = 0;
    0x1312(MEM[64], tokenId, to, from);
}

function setBaseURI(string _newBaseURI) public payable { 
    require(msg.data.length - 4 >= 32);
    require(_newBaseURI <= uint64.max);
    require(4 + _newBaseURI + 31 < msg.data.length);
    require(_newBaseURI.length <= uint64.max);
    require(4 + _newBaseURI + _newBaseURI.length + 32 <= msg.data.length);
    require(_getRoleAdmin[0].field0[msg.sender], AccessControlUnauthorizedAccount(msg.sender, 0));
    
    emit BaseURISet(_tokenURI, _newBaseURI);
    _tokenURI = _newBaseURI;
}

function batches(uint256 varg0, uint256 varg1) public payable { 
    require(msg.data.length - 4 >= 64);
    return _batches[varg0][varg1].field0, _batches[varg0][varg1].field1, _batches[varg0][varg1].field2, _batches[varg0][varg1].field3_0_0;
}

function ownerOf(uint256 tokenId) public payable { 
    require(msg.data.length - 4 >= 32);
    v0 = 0x1721(tokenId);
    return address(v0);
}

function balanceOf(address account) public payable { 
    require(msg.data.length - 4 >= 32);
    require(account, ERC721InvalidOwner(0));
    return _balanceOf[account];
}

function 0x720127b9(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) public payable { 
    require(msg.data.length - 4 >= 128);
    require(varg2 <= uint64.max);
    require(4 + varg2 + 31 < msg.data.length);
    require(varg2.length <= uint64.max);
    require(4 + varg2 + (varg2.length << 5) + 32 <= msg.data.length);
    require(varg3 <= uint64.max);
    require(4 + varg3 + 31 < msg.data.length);
    require(varg3.length <= uint64.max);
    require(4 + varg3 + (varg3.length << 5) + 32 <= msg.data.length);
    require(_getRoleAdmin[0x4be9642d4531f42a36017834f942ed2ca4663fcdec815a5ff90857c83f81d37b].field0[msg.sender], AccessControlUnauthorizedAccount(msg.sender, 0x4be9642d4531f42a36017834f942ed2ca4663fcdec815a5ff90857c83f81d37b));
    require(varg3.length == varg2.length, Error('len mismatch'));
    require(varg2.length, Error('empty'));
    require(!_batches[varg0][varg1].field3_0_0, Error('already processed'));
    require(!uint8(_projects[varg0].field11 >> 8), Error('project done'));
    v0 = v1 = 0;
    while (v0 < varg2.length) {
        require(v0 < varg2.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require(varg2[v0] < msg.data.length - varg2.data - 31);
        require(msg.data[varg2.data + varg2[v0]] <= uint64.max);
        require(32 + (varg2.data + varg2[v0]) <= msg.data.length - msg.data[varg2.data + varg2[v0]]);
        v2 = new bytes[](msg.data[varg2.data + varg2[v0]]);
        CALLDATACOPY(v2.data, 32 + (varg2.data + varg2[v0]), msg.data[varg2.data + varg2[v0]]);
        v2[msg.data[varg2.data + varg2[v0]]] = 0;
        require(v0 < varg3.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require(varg3[v0] > 0, Error('amount=0'));
        v3 = v4 = 0;
        while (v3 < v2.length) {
            MEM[v3 + v5.data] = v2[v3];
            v3 += 32;
        }
        MEM[v2.length + v5.data] = 0;
        MEM[v2.length + v5.data] = keccak256(varg1, keccak256(varg0, 14));
        require(0 == mapping_e[varg0][varg1][v2], Error('household paid'));
        v6 = v7 = 0;
        while (v6 < v2.length) {
            MEM[v6 + v8.data] = v2[v6];
            v6 += 32;
        }
        MEM[v2.length + v8.data] = 0;
        MEM[v2.length + v8.data] = keccak256(varg1, keccak256(varg0, 14));
        mapping_e[varg0][varg1][v2] = varg3[v0];
        v0 += varg3[v0];
        require(v0 <= v0, Panic(17)); // arithmetic overflow or underflow
        v0 = 0x3387(v0);
    }
    require(_batches[varg0][varg1].field2 <= v0 + _batches[varg0][varg1].field2, Panic(17)); // arithmetic overflow or underflow
    _batches[varg0][varg1].field2 += v0;
    require(_batches[varg0][varg1].field1 <= varg2.length + _batches[varg0][varg1].field1, Panic(17)); // arithmetic overflow or underflow
    _batches[varg0][varg1].field1 += varg2.length;
    require(_projects[varg0].field5 <= v0 + _projects[varg0].field5, Panic(17)); // arithmetic overflow or underflow
    _projects[varg0].field5 += v0;
    require(_projects[varg0].field6 <= varg2.length + _projects[varg0].field6, Panic(17)); // arithmetic overflow or underflow
    _projects[varg0].field6 += varg2.length;
    require(_projects[varg0].field4 <= _projects[varg0].field5 + _projects[varg0].field4, Panic(17)); // arithmetic overflow or underflow
    require(_projects[varg0].field5 + _projects[varg0].field4 <= _projects[varg0].field3, Error('exceeds budget'));
}

function setFeePercent(uint256 varg0) public payable { 
    require(msg.data.length - 4 >= 32);
    require(_getRoleAdmin[0].field0[msg.sender], AccessControlUnauthorizedAccount(msg.sender, 0));
    require(varg0 <= 10000, Error('fee>100%'));
    emit FeePercentUpdated(_feePercent, varg0);
    _feePercent = varg0;
}

function feePercent() public payable { 
    return _feePercent;
}

function hasRole(bytes32 role, address account) public payable { 
    require(msg.data.length - 4 >= 64);
    return _getRoleAdmin[role].field0[account];
}

function createBatch(uint256 __amount) public payable { 
    require(msg.data.length - 4 >= 32);
    require(_getRoleAdmin[0x4be9642d4531f42a36017834f942ed2ca4663fcdec815a5ff90857c83f81d37b].field0[msg.sender], AccessControlUnauthorizedAccount(msg.sender, 0x4be9642d4531f42a36017834f942ed2ca4663fcdec815a5ff90857c83f81d37b));
    v0 = v1 = bool(__amount);
    if (__amount) {
        v0 = v2 = !uint8(_projects[__amount].field11 >> 8);
    }
    require(v0, Error('invalid project'));
    v3 = 0x3387(mapping_b[__amount]);
    mapping_b[__amount] = v3;
    _batches[__amount][v3].field0 = __amount;
    _batches[__amount][v3].field1 = 0;
    _batches[__amount][v3].field2 = 0;
    _batches[__amount][v3].field3_0_0 = 0;
    emit BatchCreated(v3, __amount);
    return v3;
}

function symbol() public payable { 
    v0 = 0x30ca(_symbol.length);
    v1 = new bytes[](v0);
    v2 = v3 = v1.data;
    v4 = 0x30ca(_symbol.length);
    if (v4) {
        if (31 < v4) {
            v5 = _symbol.data;
            while (v3 + v4 > v2) {
                MEM[v2] = STORAGE[v5];
                v5 += 1;
                v2 += 32;
            }
        } else {
            MEM[v3] = _symbol.length >> 8 << 8;
        }
    }
    return v1;
}

function DEFAULT_ADMIN_ROLE() public payable { 
    return 0;
}

function setApprovalForAll(address operator, bool approved) public payable { 
    require(msg.data.length - 4 >= 64);
    require(operator, ERC721InvalidOperator(operator));
    _isApprovedForAll[msg.sender][operator] = approved;
    emit ApprovalForAll(msg.sender, operator, approved);
}

function 0xafd5083b(uint256 varg0) public payable { 
    require(msg.data.length - 4 >= 32);
    0x1767();
    v0 = v1 = bool(varg0);
    if (varg0) {
        v0 = !uint8(_projects[varg0].field11 >> 8);
    }
    require(v0, Error('invalid project'));
    require(!_projects[varg0].field4, Error('already paid'));
    require(!uint8(_projects[varg0].field11), Error('already prefunded'));
    v2 = 0x16c4(_projects[varg0].field3);
    v3 = 0x1967(_projects[varg0].field3, keccak256(varg0, 12));
    require(_projects[varg0].field3 <= v2 + _projects[varg0].field3, Panic(17)); // arithmetic overflow or underflow
    require(v2 + _projects[varg0].field3 <= v3 + (v2 + _projects[varg0].field3), Panic(17)); // arithmetic overflow or underflow
    _projects[varg0].field11 = 0x1 | bytes31(_projects[varg0].field11);
    MEM[MEM[64] + 36] = msg.sender;
    MEM[MEM[64] + 68] = address(this);
    MEM[MEM[64] + 100] = v3 + (v2 + _projects[varg0].field3);
    0x19c5(132 + MEM[64], 0x23b872dd, _projects[varg0].field2_0_19, _projects[varg0].field2_0_19);
    require(v2 <= v3 + v2, Panic(17)); // arithmetic overflow or underflow
    emit 0x1e802df9902b2ff18308cd40dc87741061bca04a626d5cb74ac1b7a9a9b3c638(varg0, msg.sender, _projects[varg0].field3, v3 + v2);
    stor_1 = 1;
}

function 0xb2946b0c(uint256 varg0) public payable { 
    require(msg.data.length - 4 >= 32);
    return mapping_b[varg0];
}

function safeTransferFrom(address from, address to, uint256 tokenId, bytes _data) public payable { 
    require(msg.data.length - 4 >= 128);
    require(_data <= uint64.max);
    require(msg.data.length > 4 + _data + 31);
    require(_data.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    
    v0 = _data;
    
    0x1312(v0, tokenId, to, from);
}

function tokenURI(uint256 tokenId) public payable { 
    require(msg.data.length - 4 >= 32);
    v0 = 0x22aa(20, this);
    v1 = 0x2421(tokenId);
    v2 = v3 = 0;
    v4 = 0x30ca(_tokenURI.length);
    if (!(0x1 & _tokenURI.length)) {
        MEM[32 + MEM[64]] = bytes31(_tokenURI.length);
        v2 = v5 = 32 + MEM[64] + v4 * bool(v4);
    } else if (0x1 & _tokenURI.length == 1) {
        v6 = v7 = _tokenURI.data;
        v8 = v9 = 0;
        while (v8 < v4) {
            MEM[v8 + (32 + MEM[64])] = STORAGE[v6];
            v6 += 1;
            v8 += 32;
        }
        v2 = v10 = 32 + MEM[64] + v4;
    }
    v11 = v12 = 0;
    while (v11 < v0.length) {
        MEM[v11 + v2] = v0[v11];
        v11 += 32;
    }
    MEM[v0.length + v2] = 0;
    MEM[v0.length + v2] = 0x2f00000000000000000000000000000000000000000000000000000000000000;
    v13 = v14 = 0;
    while (v13 < v1.length) {
        MEM[v13 + (v0.length + v2 + 1)] = v1[v13];
        v13 += 32;
    }
    MEM[v1.length + (v0.length + v2 + 1)] = 0;
    v15 = new uint256[](v0.length + v2 + v1.length + 1 - MEM[64] - 32);
    v16 = v17 = 0;
    while (v16 < v0.length + v2 + v1.length + 1 - MEM[64] - 32) {
        MEM[v16 + v15.data] = MEM[v16 + (MEM[64] + 32)];
        v16 += 32;
    }
    MEM[v0.length + v2 + v1.length + 1 - MEM[64] - 32 + v15.data] = 0;
    return v15;
}

function 0xd2137bae() public payable { 
    return 0x4be9642d4531f42a36017834f942ed2ca4663fcdec815a5ff90857c83f81d37b;
}

function 0xd4e1d8e3(uint256 varg0, uint256 varg1, bytes varg2) public payable { 
    require(msg.data.length - 4 >= 96);
    require(varg2 <= uint64.max);
    require(msg.data.length > 4 + varg2 + 31);
    require(varg2.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v0 = new bytes[](varg2.length);
    require(!((v0 + (63 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & varg2.length + 31) & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v0) | (v0 + (63 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & varg2.length + 31) & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max)), Panic(65)); // failed memory allocation (too much memory)
    require(varg2.data + varg2.length <= msg.data.length);
    CALLDATACOPY(v0.data, varg2.data, varg2.length);
    v0[varg2.length] = 0;
    v0[v0.length] = keccak256(varg1, keccak256(varg0, 14));
    v0[v0.length] = v0[v0.length];
    return STORAGE[keccak256(MEM[v2f62V0x3083V0x5c2.data:v2f62V0x3083V0x5c2.data + 32 + v2f62V0x3083V0x5c2.length])];
}

function revokeRole(bytes32 role, address account) public payable { 
    require(msg.data.length - 4 >= 64);
    require(_getRoleAdmin[_getRoleAdmin[role].field1].field0[msg.sender], AccessControlUnauthorizedAccount(msg.sender, _getRoleAdmin[role].field1));
    v0 = 0x203c(account, role);
}

function nextProjectId() public payable { 
    return _nextProjectId;
}

function isApprovedForAll(address owner, address operator) public payable { 
    require(msg.data.length - 4 >= 64);
    return _isApprovedForAll[owner][operator];
}

function 0xec0030f5(uint256 varg0, uint256 varg1) public payable { 
    require(msg.data.length - 4 >= 64);
    0x1767();
    require(_getRoleAdmin[0x4be9642d4531f42a36017834f942ed2ca4663fcdec815a5ff90857c83f81d37b].field0[msg.sender], AccessControlUnauthorizedAccount(msg.sender, 0x4be9642d4531f42a36017834f942ed2ca4663fcdec815a5ff90857c83f81d37b));
    v0 = keccak256(varg1, keccak256(varg0, 13));
    require(!_batches[varg0][varg1].field3_0_0, Error('batch already processed'));
    require(_batches[varg0][varg1].field2 > 0, Error('amount=0'));
    require(!uint8(_projects[varg0].field11 >> 8), Error('project done'));
    v1 = 0x16c4(_batches[varg0][varg1].field2);
    require(_projects[varg0].field7 <= v1 + _projects[varg0].field7, Panic(17)); // arithmetic overflow or underflow
    _projects[varg0].field7 += v1;
    require(_projects[varg0].field5 >= _batches[varg0][varg1].field2, Error('scheduled underflow'));
    v2 = _SafeSub(_projects[varg0].field5, _batches[varg0][varg1].field2);
    _projects[varg0].field5 = v2;
    require(_projects[varg0].field4 <= _batches[varg0][varg1].field2 + _projects[varg0].field4, Panic(17)); // arithmetic overflow or underflow
    _projects[varg0].field4 += _batches[varg0][varg1].field2;
    if (!uint8(_projects[varg0].field11)) {
        MEM[MEM[64] + 36] = _projects[varg0].field0_0_19;
        MEM[MEM[64] + 68] = _projects[varg0].field1_0_19;
        MEM[MEM[64] + 100] = _batches[varg0][varg1].field2;
        0x19c5(132 + MEM[64], 0x23b872dd, _projects[varg0].field2_0_19, _projects[varg0].field2_0_19);
        MEM[MEM[64] + 36] = _projects[varg0].field0_0_19;
        MEM[MEM[64] + 68] = _feeTo;
        MEM[MEM[64] + 100] = v1;
        0x19c5(132 + MEM[64], 0x23b872dd, _projects[varg0].field2_0_19, _projects[varg0].field2_0_19);
    } else {
        MEM[MEM[64] + 36] = _projects[varg0].field1_0_19;
        MEM[MEM[64] + 68] = _batches[varg0][varg1].field2;
        0x19c5(100 + MEM[64], 0xa9059cbb, _projects[varg0].field2_0_19, _projects[varg0].field2_0_19);
        MEM[MEM[64] + 36] = _feeTo;
        MEM[MEM[64] + 68] = v1;
        0x19c5(100 + MEM[64], 0xa9059cbb, _projects[varg0].field2_0_19, _projects[varg0].field2_0_19);
    }
    _batches[varg0][varg1].field3_0_0 = 1;
    emit 0x7f650deab7059dc9449a05a653bb55f3f09b932ffa174823fd773e27642a59ce(varg0, varg1, _batches[varg0][varg1].field2, v1, _batches[varg0][varg1].field1);
    stor_1 = 1;
}

function setFeeTo(address varg0) public payable { 
    require(msg.data.length - 4 >= 32);
    require(_getRoleAdmin[0].field0[msg.sender], AccessControlUnauthorizedAccount(msg.sender, 0));
    require(varg0, Error('feeTo=0'));
    emit FeeToUpdated(_feeTo, varg0);
    _feeTo = varg0;
}

function getFee(uint256 amount) public payable { 
    require(msg.data.length - 4 >= 32);
    v0 = 0x16c4(amount);
    return v0;
}

function 0x95e(uint256 varg0, uint256 varg1, address varg2) private { 
    require(address(varg1), ERC721InvalidReceiver(0));
    v0 = 0x1a11(msg.sender, varg0, varg1);
    require(address(v0) == varg2, ERC721IncorrectOwner(varg2, varg0, address(v0)));
    return ;
}

function 0x9e9(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, address varg6, uint256 varg7, address varg8, address varg9) private { 
    0x1767();
    require(_getRoleAdmin[0].field0[msg.sender], AccessControlUnauthorizedAccount(msg.sender, 0));
    require(varg9, Error('organisation=0'));
    require(varg7 > 0, Error('budget=0'));
    v0 = _nextProjectId;
    v1 = 0x3387(v0);
    _nextProjectId = v1;
    v2 = new struct(13);
    v2.word0 = varg6;
    v2.word1 = varg9;
    v2.word2 = varg8;
    v2.word3 = varg7;
    v2.word4 = 0;
    v2.word5 = 0;
    v2.word6 = 0;
    v2.word7 = 0;
    v2.word8 = 0;
    require(0 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v3 = new struct(1);
    v3.word0 = 0;
    if (0) {
        CALLDATACOPY(v3.data, msg.data.length, 0);
        v4 = v3.data;
    }
    v2.word9 = v3;
    v5 = new struct(1);
    v5.word0 = 0;
    if (0) {
        CALLDATACOPY(v5.data, msg.data.length, 0);
        v6 = v5.data;
    }
    v2.word10 = v5;
    v2.word11 = 0;
    v2.word12 = 0;
    _projects[v0].field0_0_19 = v2.word0;
    _projects[v0].field1_0_19 = v2.word1;
    _projects[v0].field2_0_19 = v2.word2;
    _projects[v0].field3 = v2.word3;
    _projects[v0].field4 = v2.word4;
    _projects[v0].field5 = v2.word5;
    _projects[v0].field6 = v2.word6;
    _projects[v0].field7 = v2.word7;
    _projects[v0].field8 = v2.word8;
    v7 = v8 = v9.data;
    _projects[v0].length = v9.length;
    v10 = v11 = _projects[v0].data;
    if (v9.length) {
        while (v8 + (v9.length << 5) > v7) {
            STORAGE[v10] = address(MEM[v7]) | bytes12(STORAGE[v10]);
            v7 = v7 + 32;
            v10 = v10 + 1;
        }
    }
    while (v11 + _projects[v0].length > v10) {
        STORAGE[v10] = 0;
        v10 += 1;
    }
    v12 = v13 = v14.data;
    _projects[v0].length = v14.length;
    v15 = v16 = _projects[v0].data;
    if (!v14.length) {
        while (v16 + (15 + _projects[v0].length >> 4) > v15) {
            STORAGE[v15] = 0;
            v15 += 1;
        }
    } else {
        v17 = v18 = 0;
        while (v13 + (v14.length << 5) > v12) {
            STORAGE[v15] = uint16(MEM[v12]) * (uint8.max + 1) ** v17 | ~(uint16.max * (uint8.max + 1) ** v17) & STORAGE[v15];
            v12 += 32;
            v15 += 3 + v17 >> 5;
            v17 = (1 - (3 + v17 >> 5)) * (2 + v17);
        }
        while (v17) {
            STORAGE[v15] = ~(uint16.max * (uint8.max + 1) ** v17) & STORAGE[v15];
            v15 += 3 + v17 >> 5;
            v17 = (1 - (3 + v17 >> 5)) * (2 + v17);
        }
        while (v16 + (15 + _projects[v0].length >> 4) > v15) {
            STORAGE[v15] = 0;
            v15 += 1;
        }
    }
    _projects[v0].field11 = bytes30(_projects[v0].field11) | bool(v2.word11) & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00ff | bool(v2.word12) << 8;
    v19 = new uint256[](varg4);
    CALLDATACOPY(v19.data, varg5, varg4);
    MEM[32 + (varg4 + v19)] = 0;
    emit 0x7f9e750bb79b282342d9bb507503157b95278fa57fd62e22b30e29f0ca0982ad(v0, varg6, varg9, varg8, varg7, False, v19);
    v20 = new address[](varg2);
    CALLDATACOPY(v20.data, varg3, varg2 << 5);
    v20[varg2] = 0;
    CALLDATACOPY(MEM[64] + 32, varg1, varg0 << 5);
    MEM[MEM[64] + 32 + (varg0 << 5)] = 0;
    require(v20.length == varg0, Error('len mismatch'));
    v21 = v22 = 0;
    while (v21 < v20.length) {
        require(v21 < v20.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require(address(v20[v21]) - address(0x0), Error('recipient=0'));
        v21 = 0x3387(v21);
    }
    v23 = v24 = 0;
    while (v23 < varg0) {
        require(v23 < varg0, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v23 += uint16(MEM[32 + (v23 << 5) + MEM[64]]);
        require(v23 <= v23, Panic(17)); // arithmetic overflow or underflow
        v23 = 0x3387(v23);
    }
    require(v23 <= 10000, Error('orgFee>100%'));
    v25 = v26 = v20.data;
    _projects[v0].length = v20.length;
    v27 = v28 = _projects[v0].data;
    if (v20.length) {
        while (v26 + (v20.length << 5) > v25) {
            STORAGE[v27] = address(MEM[v25]) | bytes12(STORAGE[v27]);
            v25 = v25 + 32;
            v27 = v27 + 1;
        }
    }
    while (v28 + _projects[v0].length > v27) {
        STORAGE[v27] = 0;
        v27 += 1;
    }
    v29 = v30 = MEM[64] + 32;
    _projects[v0].length = varg0;
    v31 = v32 = _projects[v0].data;
    if (!varg0) {
        while (v32 + (15 + _projects[v0].length >> 4) > v31) {
            STORAGE[v31] = 0;
            v31 += 1;
        }
    } else {
        v33 = v34 = 0;
        while (v30 + (varg0 << 5) > v29) {
            STORAGE[v31] = uint16(MEM[v29]) * (uint8.max + 1) ** v33 | ~(uint16.max * (uint8.max + 1) ** v33) & STORAGE[v31];
            v29 += 32;
            v31 += 3 + v33 >> 5;
            v33 = (1 - (3 + v33 >> 5)) * (2 + v33);
        }
        while (v33) {
            STORAGE[v31] = ~(uint16.max * (uint8.max + 1) ** v33) & STORAGE[v31];
            v31 += 3 + v33 >> 5;
            v33 = (1 - (3 + v33 >> 5)) * (2 + v33);
        }
        while (v32 + (15 + _projects[v0].length >> 4) > v31) {
            STORAGE[v31] = 0;
            v31 += 1;
        }
    }
    v35 = v20;
    v42 = v43 = 32 + MEM[64];
    v46 = v47 = 0;
    v38 = new uint256[](varg0);
    while (v46 < varg0) {
        MEM[v38 + 32 * v46 + 32] = uint16(MEM[v42]);
        v42 += 32;
        v46 += 1;
    }
    emit 0xdb4c4a18c41b67fc45b230af0b2c751c4486bd43c769f16ea5247549e07c2a81(v0, v35, v38);
    stor_1 = 1;
    return v0;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    require(!msg.value);
    if (msg.data.length >= 4) {
        v0 = function_selector >> 224;
        if (0x7ce3489b > v0) {
            if (0x2836aa64 > v0) {
                if (0x95ea7b3 > v0) {
                    if (0x17e7e58 == v0) {
                        feeTo();
                    } else if (0x1ffc9a7 == v0) {
                        supportsInterface(bytes4);
                    } else if (0x6fdde03 == v0) {
                        name();
                    } else if (0x81812fc == v0) {
                        getApproved(uint256);
                    }
                } else if (0x95ea7b3 == v0) {
                    approve(address,uint256);
                } else if (0x107046bd == v0) {
                    projects(uint256);
                } else if (0x2245f152 == v0) {
                    completeProject(uint256);
                } else if (0x23b872dd == v0) {
                    transferFrom(address,address,uint256);
                } else {
                    require(0x248a9ca3 == v0);
                    getRoleAdmin(bytes32);
                }
            } else if (0x55f804b3 > v0) {
                if (0x2836aa64 == v0) {
                    0x2836aa64();
                } else if (0x2f2ff15d == v0) {
                    grantRole(bytes32,address);
                } else if (0x36568abe == v0) {
                    renounceRole(bytes32,address);
                } else {
                    require(0x42842e0e == v0);
                    safeTransferFrom(address,address,uint256);
                }
            } else if (0x55f804b3 == v0) {
                setBaseURI(string);
            } else if (0x5d47964b == v0) {
                batches(uint256,uint256);
            } else if (0x6352211e == v0) {
                ownerOf(uint256);
            } else if (0x70a08231 == v0) {
                balanceOf(address);
            } else {
                require(0x720127b9 == v0);
                0x720127b9();
            }
        } else if (0xb88d4fde > v0) {
            if (0x95d89b41 > v0) {
                if (0x7ce3489b == v0) {
                    setFeePercent(uint256);
                } else if (0x7fd6f15c == v0) {
                    feePercent();
                } else if (0x91d14854 == v0) {
                    hasRole(bytes32,address);
                } else {
                    require(0x95bd63d6 == v0);
                    createBatch(uint256);
                }
            } else if (0x95d89b41 == v0) {
                symbol();
            } else if (0xa217fddf == v0) {
                DEFAULT_ADMIN_ROLE();
            } else if (0xa22cb465 == v0) {
                setApprovalForAll(address,bool);
            } else if (0xafd5083b == v0) {
                0xafd5083b();
            } else {
                require(0xb2946b0c == v0);
                0xb2946b0c();
            }
        } else if (0xe935b7b1 > v0) {
            if (0xb88d4fde == v0) {
                safeTransferFrom(address,address,uint256,bytes);
            } else if (0xc87b56dd == v0) {
                tokenURI(uint256);
            } else if (0xd2137bae == v0) {
                0xd2137bae();
            } else if (0xd4e1d8e3 == v0) {
                0xd4e1d8e3();
            } else {
                require(0xd547741f == v0);
                revokeRole(bytes32,address);
            }
        } else if (0xe935b7b1 == v0) {
            nextProjectId();
        } else if (0xe985e9c5 == v0) {
            isApprovedForAll(address,address);
        } else if (0xec0030f5 == v0) {
            0xec0030f5();
        } else if (0xf46901ed == v0) {
            setFeeTo(address);
        } else {
            require(0xfcee45f4 == v0);
            getFee(uint256);
        }
    }
    fallback();
}
