// Decompiled by library.dedaub.com
// 2025.12.17 04:45 UTC
// Compiled using the solidity compiler version 0.8.24


// Data structures and variables inferred from the use of storage instructions
uint256 _totalSupply; // STORAGE[0x0]
mapping (address => uint256) _balanceOf; // STORAGE[0x2]
mapping (address => mapping (address => uint256)) _allowance; // STORAGE[0x3]
mapping (address => bool) _isRouter; // STORAGE[0x4]
address _owner; // STORAGE[0x1] bytes 0 to 19


// Events
Approval(address, address, uint256);
OwnershipTransferred(address, address);
RouterSet(address, bool);
Transfer(address, address, uint256);

function approve(address spender, uint256 amount) public payable { 
    require(msg.data.length - 4 >= 64);
    _allowance[msg.sender][spender] = amount;
    emit Approval(msg.sender, spender, amount);
    return True;
}

function totalSupply() public payable { 
    return _totalSupply;
}

function transferFrom(address sender, address recipient, uint256 amount) public payable { 
    require(msg.data.length - 4 >= 96);
    require(_allowance[sender][msg.sender] >= amount, Error('ALLOWANCE'));
    v0 = _SafeSub(_allowance[sender][msg.sender], amount);
    _allowance[sender][msg.sender] = v0;
    0x570(amount, recipient, sender);
    return True;
}

function decimals() public payable { 
    return uint8(18);
}

function balanceOf(address account) public payable { 
    require(msg.data.length - 4 >= 32);
    return _balanceOf[account];
}

function renounceOwnership() public payable { 
    require(msg.sender == _owner, Error('NOT_OWNER'));
    emit OwnershipTransferred(_owner, 0);
    _owner = 0;
}

function owner() public payable { 
    return _owner;
}

function SELL_TAX_BPS() public payable { 
    return 400;
}

function symbol() public payable { 
    return string(v1);
}

function 0x9e8d94ae() public payable { 
    return address(0xb0f41cf4de6ed2aa63faaf253d0802c695aabf49);
}

function transfer(address recipient, uint256 amount) public payable { 
    require(msg.data.length - 4 >= 64);
    0x570(amount, recipient, msg.sender);
    return True;
}

function setRouter(address account, bool value) public payable { 
    require(msg.data.length - 4 >= 64);
    require(msg.sender == _owner, Error('NOT_OWNER'));
    require(account, Error('ROUTER_0'));
    _isRouter[account] = value;
    emit RouterSet(account, value);
}

function allowance(address owner, address spender) public payable { 
    require(msg.data.length - 4 >= 64);
    return _allowance[owner][spender];
}

function isRouter(address varg0) public payable { 
    require(msg.data.length - 4 >= 32);
    return _isRouter[varg0];
}

function 0x570(uint256 varg0, address varg1, address varg2) private { 
    require(varg0 > 0, Error('ZERO_AMOUNT'));
    require(varg1, Error(0x544f5f30));
    require(varg0 <= _balanceOf[varg2], Error('BALANCE'));
    v0 = _SafeSub(_balanceOf[varg2], varg0);
    _balanceOf[varg2] = v0;
    v1 = v2 = 0;
    v3 = v4 = _isRouter[varg2];
    v5 = v6 = _isRouter[varg1];
    v5 = v7 = !v4;
    if (!v5) {
        if (v4) {
            v3 = v8 = !v6;
        }
        if (v3) {
            v9 = _SafeMul(varg0, 400);
            v1 = v10 = _SafeDiv(v9, 10000);
            v11 = _SafeAdd(_balanceOf[address(0xb0f41cf4de6ed2aa63faaf253d0802c695aabf49)], v10);
            _balanceOf[address(0xb0f41cf4de6ed2aa63faaf253d0802c695aabf49)] = v11;
            emit Transfer(varg2, address(0xb0f41cf4de6ed2aa63faaf253d0802c695aabf49), v10);
        }
    } else {
        v12 = _SafeMul(varg0, 400);
        v1 = v13 = _SafeDiv(v12, 10000);
        v14 = _SafeSub(_totalSupply, v13);
        _totalSupply = v14;
        emit Transfer(varg2, 0, v13);
    }
    v15 = _SafeSub(varg0, v1);
    v16 = _SafeAdd(_balanceOf[varg1], v15);
    _balanceOf[varg1] = v16;
    emit Transfer(varg2, varg1, v15);
    return ;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 - varg1 <= varg0, Panic(17)); // arithmetic overflow or underflow
    return varg0 - varg1;
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require((varg1 == varg1 * varg0 / varg0) | !varg0, Panic(17)); // arithmetic overflow or underflow
    return varg1 * varg0;
}

function _SafeDiv(uint256 varg0, uint256 varg1) private { 
    require(varg1, Panic(18)); // division by zero
    return varg0 / varg1;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= varg1 + varg0, Panic(17)); // arithmetic overflow or underflow
    return varg1 + varg0;
}

function fallback() public payable { 
    revert();
}

function name() public payable { 
    return string(v1);
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    require(!msg.value);
    if (msg.data.length >= 4) {
        if (0x9099bd3f > function_selector >> 224) {
            if (0x313ce567 > function_selector >> 224) {
                if (0x6fdde03 == function_selector >> 224) {
                    name();
                } else if (0x95ea7b3 == function_selector >> 224) {
                    approve(address,uint256);
                } else if (0x18160ddd == function_selector >> 224) {
                    totalSupply();
                } else if (0x23b872dd == function_selector >> 224) {
                    transferFrom(address,address,uint256);
                }
            } else if (0x313ce567 == function_selector >> 224) {
                decimals();
            } else if (0x70a08231 == function_selector >> 224) {
                balanceOf(address);
            } else if (0x715018a6 == function_selector >> 224) {
                renounceOwnership();
            } else {
                require(0x8da5cb5b == function_selector >> 224);
                owner();
            }
        } else {
            if (0xc3c64674 > function_selector >> 224) {
                if (0x9099bd3f != function_selector >> 224) {
                    if (0x95d89b41 == function_selector >> 224) {
                        symbol();
                    } else if (0x9e8d94ae == function_selector >> 224) {
                        0x9e8d94ae();
                    } else {
                        require(0xa9059cbb == function_selector >> 224);
                        transfer(address,uint256);
                    }
                }
            } else if (0xc3c64674 == function_selector >> 224) {
                setRouter(address,bool);
            } else if (0xdd62ed3e == function_selector >> 224) {
                allowance(address,address);
            } else if (0xf3d7d282 == function_selector >> 224) {
                isRouter(address);
            } else {
                require(0xfd657856 == function_selector >> 224);
            }
            BUY_TAX_BPS();
        }
    }
    fallback();
}
