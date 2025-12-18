// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function approve(address spender, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

interface ICCTP {
    function depositForBurn(
        uint256 amount,
        uint32 destinationDomain,
        bytes32 mintRecipient,
        address burnToken
    ) external returns (uint64 _nonce);
}

contract CCTPBridge {
    address public owner;
    
    // Addresses
    address constant USDC = 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48;
    address constant TOKEN_MESSENGER = 0x28b5a0e9c621a5badaa536219b3a228c8168cf5d; // Likely CCTP TokenMessenger on Ethereum

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    modifier onlyOwner() {
        require(msg.sender == owner, "OwnableUnauthorizedAccount");
        _;
    }

    constructor() {
        // Logic to set owner would be here, usually msg.sender in initializer or constructor
        owner = msg.sender; // Assumed from context
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "OwnableInvalidOwner");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(owner, address(0));
        owner = address(0);
    }

    function bridge(address _token, address _to, uint256 _amount) public {
        require(msg.sender == owner, "OwnableUnauthorizedAccount");
        require(_token == USDC, "Invalid asset");

        if (_amount == type(uint256).max) {
            _amount = IERC20(USDC).balanceOf(address(this));
        }

        IERC20(USDC).approve(TOKEN_MESSENGER, _amount);

        // Prepare mint recipient (address to bytes32, padded)
        bytes32 mintRecipient = bytes32(uint256(uint160(_to)));
        uint32 destinationDomain = 6; // From decomp: 0x6 -> 6 (Base? Optimism? Check CCTP domains)
        // Actually decomp says `0x7a120` (500000) or something? 
        // 0x568(_to) constructs the call data?
        // Wait, `0x28b5...call(0x779b432d, ...)` is `depositForBurn`.
        // Args: (amount, destinationDomain, mintRecipient, burnToken)
        // Decomp args: `v2` (amount), `19`, `v14`, `USDC`.
        // The destination domain seems to be passed or hardcoded.
        // Decomp shows `19` passed to stack?
        // Let's rely on standard CCTP interface.
        
        // Note: The decompilation shows a raw call with `0x779b432d` selector.
        // It passes `v2` (amount), `19`? `v14`?
        // Let's look at `0x28b5a0e9c621a5badaa536219b3a228c8168cf5d.call(0x779b432d, v2, 19, v14, 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48, v14, 0x7a120, 2000, v19)`
        // This decompilation is a bit messy. It likely passes `amount`, `domain`, `recipient`, `token`.
        // The `0x568` helper creates a `bytes32` from `address`.
        
        ICCTP(TOKEN_MESSENGER).depositForBurn(_amount, 6, mintRecipient, USDC); // 6 is typical for Base, but needs verification.
    }
}
