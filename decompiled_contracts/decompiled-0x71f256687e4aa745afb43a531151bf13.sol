// Decompiled by library.dedaub.com
// 2025.12.17 04:55 UTC
// Compiled using the solidity compiler version 0.8.31


// Data structures and variables inferred from the use of storage instructions
address stor_1_0_19; // STORAGE[0x1] bytes 0 to 19
address stor_4_0_19; // STORAGE[0x4] bytes 0 to 19
address _approve; // STORAGE[0x5] bytes 0 to 19



function fallback() public payable { 
}

function approve(address spender, uint256 amount) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 64);
    require(msg.sender == address(0x4bd44ab605d3e88579a1cf5a18c1a805e648f5e8));
    require(bool(_approve.code.size));
    v0 = _approve.mint(amount).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function 0x107b401f(address varg0) public nonPayable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    require(msg.sender == address(0x4bd44ab605d3e88579a1cf5a18c1a805e648f5e8));
    v0, /* uint256 */ v1 = varg0.balanceOf(address(this)).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(bool(varg0.code.size));
    v2 = varg0.transfer(address(0x4bd44ab605d3e88579a1cf5a18c1a805e648f5e8), v1).gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function 0x112ad327() public nonPayable { 
    require(msg.sender == address(0x4bd44ab605d3e88579a1cf5a18c1a805e648f5e8));
    v0, /* uint256 */ v1 = stor_1_0_19.balanceOf(address(this)).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(bool(stor_1_0_19.code.size));
    v2 = stor_1_0_19.transfer(address(0x4bd44ab605d3e88579a1cf5a18c1a805e648f5e8), v1).gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

function transfer(address wallet) public payable { 
    require(4 + (msg.data.length - 4) - 4 >= 32);
    require(msg.sender == address(0x4bd44ab605d3e88579a1cf5a18c1a805e648f5e8));
    v0, /* uint256 */ v1 = stor_4_0_19.balanceOf(address(this)).gas(msg.gas);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v2, /* uint256 */ v3 = _approve.exchangeRateStored().gas(msg.gas);
    require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    v4 = _SafeMul(v3, 199);
    v5 = _SafeDiv(v4, 10 ** 20);
    v6 = _SafeMul(v5, 101);
    v7 = _SafeMul(v6, 0x7c8683448);
    v8 = _SafeDiv(v7, 10 ** 18);
    v9 = _SafeMul(msg.gas, 0x5265c0);
    v10 = _SafeMul(v9, 3000);
    v11 = _SafeDiv(v10, 10 ** 16);
    require(v8 > v11);
    v12, /* uint256 */ v13 = _approve.balanceOf(address(this)).gas(msg.gas);
    require(bool(v12), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    if (v13 < 100) {
        v14 = _SafeMul(v5, 101);
        require(bool(_approve.code.size));
        v15 = _approve.mint(v14).gas(msg.gas);
        require(bool(v15), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    }
    v16 = v17 = 0;
    while (v16 < 200) {
        require(bool(_approve.code.size));
        v18 = _approve.redeemUnderlying(v5).gas(msg.gas);
        require(bool(v18), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        v16 += 1;
    }
    v19, /* uint256 */ v20 = stor_4_0_19.balanceOf(address(this)).gas(msg.gas);
    require(bool(v19), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    MEM[64] = MEM[64] + (RETURNDATASIZE() + 31 & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0);
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v20 > v1);
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require(!varg0 | (varg1 == varg0 * varg1 / varg0), Panic(17)); // arithmetic overflow or underflow
    return varg0 * varg1;
}

function _SafeDiv(uint256 varg0, uint256 varg1) private { 
    require(varg1, Panic(18)); // division by zero
    return varg0 / varg1;
}

function refund() public nonPayable { 
    require(msg.sender == address(0x4bd44ab605d3e88579a1cf5a18c1a805e648f5e8));
    v0 = address(0x4bd44ab605d3e88579a1cf5a18c1a805e648f5e8).call().value(this.balance).gas(!this.balance * 2300);
    require(bool(v0), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length < 4) {
        fallback();
    } else if (0x95ea7b3 == function_selector >> 224) {
        approve(address,uint256);
    } else if (0x107b401f == function_selector >> 224) {
        0x107b401f();
    } else if (0x112ad327 == function_selector >> 224) {
        0x112ad327();
    } else if (0x1a695230 == function_selector >> 224) {
        transfer(address);
    } else if (0x590e1ae3 == function_selector >> 224) {
        refund();
    } else {
        exit;
    }
}
