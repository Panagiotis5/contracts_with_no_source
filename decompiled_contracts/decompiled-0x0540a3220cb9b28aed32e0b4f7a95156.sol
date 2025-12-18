// Decompiled by library.dedaub.com
// 2025.12.17 04:27 UTC
// Compiled using the solidity compiler version 0.8.30


// Data structures and variables inferred from the use of storage instructions
mapping (address => bool) _addPaymaster; // STORAGE[0x0]
address[] array_1; // STORAGE[0x1]
address stor_2_0_19; // STORAGE[0x2] bytes 0 to 19
address _feeCollector; // STORAGE[0x3] bytes 0 to 19


// Events
FeeCollectorUpdated(address, address);

function feeCollector() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return _feeCollector;
}

function 0xaa212975() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return stor_2_0_19;
}

function 0x9858d824(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    return _addPaymaster[varg0];
}

function 0x90567058(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 < array_1.length);
    require(varg0 < array_1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    return array_1[varg0];
}

function 0x50779159(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(address(0x86295ad2bb85a967d798acc96520ae57d5a7f584) == msg.sender, Error('Only owner'));
    require(!bool(!varg0), Error('Invalid address'));
    stor_2_0_19 = varg0;
    emit 0x7f08a0fff0011090470bbf7133dfa7a3cc22bb77e3fd9a2ea5a89262b82a8c79(stor_2_0_19, varg0);
}

function removePaymaster(address _paymaster) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(address(0x86295ad2bb85a967d798acc96520ae57d5a7f584) == msg.sender, Error('Only owner'));
    require(_addPaymaster[_paymaster], Error('Not exists'));
    _addPaymaster[_paymaster] = 0;
    v0 = v1 = 0;
    while (v0 < array_1.length) {
        require(v0 < array_1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        if (array_1[v0] == _paymaster) {
            require(array_1.length - 1 <= array_1.length, Panic(17)); // arithmetic overflow or underflow
            require(array_1.length - 1 < array_1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            require(v0 < array_1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            array_1[v0] = array_1[array_1.length - 1];
            require(array_1.length, Panic(49)); // attemp to .pop an empty array
            require(uint256.max + array_1.length < array_1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
            array_1[uint256.max + array_1.length] = 0;
            array_1.length += uint256.max;
        } else {
            v0 = v0 + 1;
        }
        emit 0x6d9bc3c0db8b77f351b32d824a2917349aea67db80bd786749eb005868064ab7(_paymaster);
        exit;
    }
}

function 0x21f8e427() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    v0 = v1 = MEM[64] + 32;
    MEM[0] = 1;
    v2 = v3 = array_1.data;
    v4 = v5 = 0;
    while (v4 < array_1.length) {
        MEM[v0] = address(STORAGE[v2]);
        v0 = v0 + 32;
        v2 += 1;
        v4 += 1;
    }
    v6 = MEM[64] + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + (v0 - MEM[64]));
    require(!((v6 < MEM[64]) | (v6 > uint64.max)), Panic(65)); // failed memory allocation (too much memory)
    MEM[64] = v6;
    MEM[v6] = 32;
    MEM[v6 + 32] = array_1.length;
    v7 = v8 = v6 + 64;
    v9 = v10 = 0;
    while (v9 < array_1.length) {
        MEM[v7] = address(MEM[v0]);
        v7 += 32;
        v0 = v0 + 32;
        v9 += 1;
    }
    return MEM[v505:v505 + v543_0x3 - v505];
}

function addPaymaster(address _paymaster) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(address(0x86295ad2bb85a967d798acc96520ae57d5a7f584) == msg.sender, Error('Only owner'));
    require(!bool(!_paymaster), Error('Invalid address'));
    require(!_addPaymaster[_paymaster], Error('Already exists'));
    0x884(_paymaster);
}

function 0x14b1c401() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return array_1.length;
}

function OWNER() public nonPayable { 
    require(msg.data.length - 4 >= 0);
    return address(0x86295ad2bb85a967d798acc96520ae57d5a7f584);
}

function 0x108fed0b(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 <= uint64.max);
    require(varg0 + 35 < msg.data.length);
    require(varg0.length <= uint64.max);
    require((varg0.length << 5) + varg0 + 36 <= msg.data.length);
    require(address(0x86295ad2bb85a967d798acc96520ae57d5a7f584) == msg.sender, Error('Only owner'));
    v0 = v1 = 0;
    while (1) {
        if (v0 < varg0.length) {
            v2 = 0x822(varg0.data, varg0.length, v0);
            require(!(msg.data[v2] - address(msg.data[v2])));
            v3 = v4 = bool(address(msg.data[v2]));
            if (v4) {
                v5 = 0x822(varg0.data, varg0.length, v0);
                require(!(msg.data[v5] - address(msg.data[v5])));
                v3 = v6 = !_addPaymaster[address(msg.data[v5])];
            }
            if (v3) {
                v7 = 0x822(varg0.data, varg0.length, v0);
                require(!(msg.data[v7] - address(msg.data[v7])));
                0x884(msg.data[v7]);
            }
            v0 = v0 + 1;
        } else {
            exit;
        }
    }
}

function 0x822(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    require(varg2 < varg1, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    return (varg2 << 5) + varg0;
}

function 0x884(address varg0) private { 
    _addPaymaster[varg0] = 1;
    require(array_1.length < uint64.max + 1, Panic(65)); // failed memory allocation (too much memory)
    array_1.length = array_1.length + 1;
    require(array_1.length < array_1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    array_1[array_1.length] = varg0;
    emit 0xb8ab41dd510e6df3dda12093c101eb301df9f9a38cabc1122447390204d55de8(varg0);
    return ;
}

function updateFeeCollector(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(address(0x86295ad2bb85a967d798acc96520ae57d5a7f584) == msg.sender, Error('Only owner'));
    require(!bool(!varg0), Error('Invalid address'));
    _feeCollector = varg0;
    emit FeeCollectorUpdated(_feeCollector, varg0);
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    require(msg.data.length >= 4);
    if (0x108fed0b == function_selector >> 224) {
        0x108fed0b();
    } else if (0x117803e3 == function_selector >> 224) {
        OWNER();
    } else {
        if (0x12fde4b7 != function_selector >> 224) {
            if (0x14b1c401 == function_selector >> 224) {
                0x14b1c401();
            } else {
                if (0x16107a31 != function_selector >> 224) {
                    if (0x1717c328 == function_selector >> 224) {
                        addPaymaster(address);
                    } else if (0x21f8e427 == function_selector >> 224) {
                        0x21f8e427();
                    } else if (0x4a089281 == function_selector >> 224) {
                        removePaymaster(address);
                    } else if (0x50779159 == function_selector >> 224) {
                        0x50779159();
                    } else {
                        if (0x847b6bcd != function_selector >> 224) {
                            if (0x90567058 == function_selector >> 224) {
                                0x90567058();
                            } else if (0x9858d824 != function_selector >> 224) {
                                if (0xaa212975 != function_selector >> 224) {
                                    if (0xc415b95c != function_selector >> 224) {
                                        require(0xd2c35ce8 == function_selector >> 224);
                                        updateFeeCollector(address);
                                    }
                                }
                            }
                        }
                        0x9858d824();
                    }
                }
                0xaa212975();
            }
        }
        feeCollector();
    }
}
