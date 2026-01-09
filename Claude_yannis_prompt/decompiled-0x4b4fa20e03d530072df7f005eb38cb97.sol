// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

/**
 * @title USDC Bridge Contract
 * @notice Bridges USDC to other chains using CCTP (Cross-Chain Transfer Protocol)
 */
contract USDBridge {
    // State variables
    address private _owner;
    
    // Constants
    address public constant HYPERLANE_MAILBOX = 0x28b5a0e9c621a5badaa536219b3a228c8168cf5d;
    address public constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address public constant NOBLE_RECIPIENT = 0xb21d281dEdb17aE5B501F6aA8256fE38C4E45757;
    
    // Events
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    
    // Errors
    error OwnableUnauthorizedAccount(address account);
    error OwnableInvalidOwner(address owner);
    
    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == _owner, OwnableUnauthorizedAccount(msg.sender));
        _;
    }
    
    /**
     * @notice Returns the owner address
     */
    function owner() public view returns (address) {
        return _owner;
    }
    
    /**
     * @notice Returns the Hyperlane mailbox address
     */
    function hyperlaneMailbox() public pure returns (address) {
        return HYPERLANE_MAILBOX;
    }
    
    /**
     * @notice Returns the Noble recipient address
     */
    function nobleRecipient() public pure returns (address) {
        return NOBLE_RECIPIENT;
    }
    
    /**
     * @notice Generates hook data for CCTP transfer
     * @param recipient The recipient address on the destination chain
     */
    function generateHookData(address recipient) public pure returns (bytes memory) {
        bytes memory hookData = new bytes(56);
        
        // Build the hook data structure
        // Format: "cctp-forward" (12 bytes) + padding + recipient address (20 bytes)
        assembly {
            // Store "cctp-forward" at offset 32 (after length)
            mstore(add(hookData, 32), "cctp-forward")
            // Store recipient address at offset 56 (32 + 12 + 12 padding)
            mstore(add(hookData, 56), shl(96, recipient))
        }
        
        return hookData;
    }
    
    /**
     * @notice Bridges USDC to another chain using CCTP
     * @param token The token address (must be USDC)
     * @param to The recipient address on the destination chain
     * @param amount The amount to bridge (use type(uint256).max for full balance)
     */
    function bridge(address token, address to, uint256 amount) public onlyOwner {
        require(token == USDC, "Invalid asset");
        
        uint256 bridgeAmount = amount;
        
        // If amount is max uint256, use the contract's full USDC balance
        if (amount == type(uint256).max) {
            bridgeAmount = IERC20(USDC).balanceOf(address(this));
        }
        
        // Approve Hyperlane mailbox to spend USDC
        IERC20(USDC).approve(HYPERLANE_MAILBOX, bridgeAmount);
        
        // Generate hook data with recipient address
        bytes memory hookData = generateHookData(to);
        
        // Call Hyperlane mailbox to dispatch the message
        // Function signature: dispatch(uint256,uint32,bytes32,bytes,bytes)
        (bool success, ) = HYPERLANE_MAILBOX.call(
            abi.encodeWithSelector(
                0x779b432d, // dispatch function selector
                bridgeAmount,
                19, // destination domain (Noble chain)
                bytes32(uint256(uint160(USDC))), // recipient as bytes32
                bytes32(uint256(uint160(NOBLE_RECIPIENT))), // hook address
                500000, // gas limit (0x7a120)
                2000, // gas overhead
                hookData
            )
        );
        
        require(success, "Bridge call failed");
    }
    
    /**
     * @notice Transfers ownership to a new owner
     * @param newOwner The address of the new owner
     */
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), OwnableInvalidOwner(address(0)));
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
    
    /**
     * @notice Renounces ownership, leaving the contract without an owner
     */
    function renounceOwnership() public onlyOwner {
        address oldOwner = _owner;
        _owner = address(0);
        emit OwnershipTransferred(oldOwner, address(0));
    }
}

// Minimal ERC20 interface for the contract's needs
interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
}