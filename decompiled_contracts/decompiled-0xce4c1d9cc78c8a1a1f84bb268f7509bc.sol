// Decompiled by library.dedaub.com
// 2025.12.17 00:57 UTC
// Compiled using the solidity compiler version 0.8.31


// Data structures and variables inferred from the use of storage instructions
mapping (address => uint256) _balanceOf; // STORAGE[0x0]
mapping (address => mapping (address => uint256)) _allowance; // STORAGE[0x1]
uint256 _totalSupply; // STORAGE[0x2]
string _name; // STORAGE[0x3]
string _symbol; // STORAGE[0x4]


// Events
Approval(address, address, uint256);
Transfer(address, address, uint256);

function decimals() public payable { 
    return 18;
}

function increaseAllowance(address spender, uint256 addedValue) public payable { 
    require(msg.data.length - 4 >= 64);
    v0 = _SafeAdd(_allowance[msg.sender][spender], addedValue);
    0x34d(v0, spender, msg.sender);
    return True;
}

function balanceOf(address account) public payable { 
    require(msg.data.length - 4 >= 32);
    return _balanceOf[account];
}

function symbol() public payable { 
    v0 = 0x78d(_symbol.length);
    v1 = new bytes[](v0);
    v2 = v3 = v1.data;
    v4 = 0x78d(_symbol.length);
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
    v6 = new bytes[](v1.length);
    MCOPY(v6.data, v1.data, v1.length);
    v6[v1.length] = 0;
    return v6;
}

function decreaseAllowance(address spender, uint256 subtractedValue) public payable { 
    require(msg.data.length - 4 >= 64);
    require(_allowance[msg.sender][spender] >= subtractedValue, Error('ERC20: decreased allowance below zero'));
    0x34d(_allowance[msg.sender][spender] - subtractedValue, spender, msg.sender);
    return True;
}

function transfer(address recipient, uint256 amount) public payable { 
    require(msg.data.length - 4 >= 64);
    0x4e8(amount, recipient, msg.sender);
    return True;
}

function allowance(address owner, address spender) public payable { 
    require(msg.data.length - 4 >= 64);
    return _allowance[owner][spender];
}

function 0x34d(uint256 varg0, address varg1, address varg2) private { 
    require(varg2, Error('ERC20: approve from the zero address', 'ERC20: approve from the zero address'));
    require(varg1, Error('ERC20: approve to the zero address'));
    _allowance[varg2][varg1] = varg0;
    emit Approval(varg2, varg1, varg0);
    return ;
}

function 0x470(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    v0 = _allowance[address(varg2)][address(varg1)];
    if (v0 == uint256.max) {
        return ;
    } else {
        require(v0 >= varg0, Error('ERC20: insufficient allowance'));
        0x34d(v0 - varg0, varg1, varg2);
        return ;
    }
}

function 0x4e8(uint256 varg0, address varg1, address varg2) private { 
    require(varg2, Error('ERC20: transfer from the zero address'));
    require(varg1, Error('ERC20: transfer to the zero address'));
    require(_balanceOf[varg2] >= varg0, Error('ERC20: transfer amount exceeds balance'));
    _balanceOf[varg2] = _balanceOf[varg2] - varg0;
    _balanceOf[varg1] += varg0;
    emit Transfer(varg2, varg1, varg0);
    return ;
}

function 0x78d(uint256 varg0) private { 
    v0 = v1 = varg0 >> 1;
    if (!(varg0 & 0x1)) {
        v0 = v2 = v1 & 0x7f;
    }
    require((varg0 & 0x1) - (v0 < 32), Panic(34)); // access to incorrectly encoded storage byte array
    return v0;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= varg1 + varg0, Panic(17)); // arithmetic overflow or underflow
    return varg1 + varg0;
}

function fallback() public payable { 
    revert();
}

function name() public payable { 
    v0 = 0x78d(_name.length);
    v1 = new bytes[](v0);
    v2 = v3 = v1.data;
    v4 = 0x78d(_name.length);
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
    v6 = new bytes[](v1.length);
    MCOPY(v6.data, v1.data, v1.length);
    v6[v1.length] = 0;
    return v6;
}

function approve(address spender, uint256 amount) public payable { 
    require(msg.data.length - 4 >= 64);
    0x34d(amount, spender, msg.sender);
    return True;
}

function totalSupply() public payable { 
    return _totalSupply;
}

function transferFrom(address sender, address recipient, uint256 amount) public payable { 
    require(msg.data.length - 4 >= 96);
    0x470(amount, msg.sender, sender);
    0x4e8(amount, recipient, sender);
    return True;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    require(!msg.value);
    if (msg.data.length >= 4) {
        if (0x39509351 > function_selector >> 224) {
            if (0x6fdde03 == function_selector >> 224) {
                name();
            } else if (0x95ea7b3 == function_selector >> 224) {
                approve(address,uint256);
            } else if (0x18160ddd == function_selector >> 224) {
                totalSupply();
            } else if (0x23b872dd == function_selector >> 224) {
                transferFrom(address,address,uint256);
            } else if (0x313ce567 == function_selector >> 224) {
                decimals();
            }
        } else if (0x39509351 == function_selector >> 224) {
            increaseAllowance(address,uint256);
        } else if (0x70a08231 == function_selector >> 224) {
            balanceOf(address);
        } else if (0x95d89b41 == function_selector >> 224) {
            symbol();
        } else if (0xa457c2d7 == function_selector >> 224) {
            decreaseAllowance(address,uint256);
        } else if (0xa9059cbb == function_selector >> 224) {
            transfer(address,uint256);
        } else {
            require(0xdd62ed3e == function_selector >> 224);
            allowance(address,address);
        }
    }
    fallback();
}
