// Decompiled by library.dedaub.com
// 2025.12.12 11:55 UTC
// Compiled using the solidity compiler version 0.8.23


// Data structures and variables inferred from the use of storage instructions
string _signature; // STORAGE[0x1]
address _transferFrom; // STORAGE[0x0] bytes 0 to 19


// Events
Transfer(address, address, uint256);

function decimals() public payable { 
    return uint8(6);
}

function _decimals() public payable { 
    return uint8(6);
}

function _totalSupply() public payable { 
    return 0xbb1f8ee23737ec;
}

function signature() public payable { 
    v0 = 0x426(_signature.length);
    v1 = new bytes[](v0);
    v2 = v3 = v1.data;
    v4 = 0x426(_signature.length);
    if (v4) {
        if (31 < v4) {
            v5 = v6 = _signature.data;
            while (v3 + v4 > v2) {
                MEM[v2] = STORAGE[v5];
                v5 += 1;
                v2 += 32;
            }
        } else {
            MEM[v3] = _signature.length >> 8 << 8;
        }
    }
    v7 = new bytes[](v1.length);
    v8 = v9 = 0;
    while (v8 < v1.length) {
        v7[v8] = v1[v8];
        v8 += 32;
    }
    v7[v1.length] = 0;
    return v7;
}

function balanceOf(address account) public payable { 
    require(msg.data.length - 4 >= 32);
    return 0;
}

function symbol() public payable { 
    v0 = new bytes[](v1.length);
    v2 = v3 = 0;
    while (v2 < v1.length) {
        v0[v2] = v1[v2];
        v2 += 32;
    }
    v0[v1.length] = 0;
    return v0;
}

function transfer(address recipient, uint256 amount) public payable { 
    require(msg.data.length - 4 >= 64);
    emit Transfer(address(tx.origin), recipient, amount);
    return True;
}

function _symbol() public payable { 
    v0 = new bytes[](v1.length);
    v2 = v3 = 0;
    while (v2 < v1.length) {
        v0[v2] = v1[v2];
        v2 += 32;
    }
    v0[v1.length] = 0;
    return v0;
}

function _name() public payable { 
    v0 = new bytes[](v1.length);
    v2 = v3 = 0;
    while (v2 < v1.length) {
        v0[v2] = v1[v2];
        v2 += 32;
    }
    v0[v1.length] = 0;
    return v0;
}

function 0x426(uint256 varg0) private { 
    v0 = v1 = varg0 >> 1;
    if (!(varg0 & 0x1)) {
        v0 = v2 = v1 & 0x7f;
    }
    require((varg0 & 0x1) - (v0 < 32), Panic(34)); // access to incorrectly encoded storage byte array
    return v0;
}

function fallback() public payable { 
    revert();
}

function name() public payable { 
    v0 = new bytes[](v1.length);
    v2 = v3 = 0;
    while (v2 < v1.length) {
        v0[v2] = v1[v2];
        v2 += 32;
    }
    v0[v1.length] = 0;
    return v0;
}

function totalSupply() public payable { 
    return 0xbb1f8ee23737ec;
}

function transferFrom(address sender, address recipient, uint256 amount) public payable { 
    require(msg.data.length - 4 >= 96);
    require(tx.origin == _transferFrom);
    emit Transfer(sender, recipient, amount);
    return True;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    require(!msg.value);
    if (msg.data.length >= 4) {
        if (0x6fdde03 == function_selector >> 224) {
            name();
        } else if (0x18160ddd == function_selector >> 224) {
            totalSupply();
        } else if (0x23b872dd == function_selector >> 224) {
            transferFrom(address,address,uint256);
        } else if (0x313ce567 == function_selector >> 224) {
            decimals();
        } else if (0x32424aa3 == function_selector >> 224) {
            _decimals();
        } else if (0x3eaaf86b == function_selector >> 224) {
            _totalSupply();
        } else if (0x51ff4847 == function_selector >> 224) {
            signature();
        } else if (0x70a08231 == function_selector >> 224) {
            balanceOf(address);
        } else if (0x95d89b41 == function_selector >> 224) {
            symbol();
        } else if (0xa9059cbb == function_selector >> 224) {
            transfer(address,uint256);
        } else if (0xb09f1266 == function_selector >> 224) {
            _symbol();
        } else if (0xd28d8852 == function_selector >> 224) {
            _name();
        }
    }
    fallback();
}
