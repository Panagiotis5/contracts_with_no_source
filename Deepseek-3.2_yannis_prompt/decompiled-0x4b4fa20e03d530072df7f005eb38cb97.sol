// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
}

contract CCTPBridge {
    address private _owner;
    
    // Fixed addresses
    address private constant USDC_TOKEN = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address private constant CCTP_FORWARDER = 0x28b5a0e9c621a5badaa536219b3a228c8168cf5d;
    address private constant DESTINATION_ADDRESS = 0xb21d281dEDb17Ae5B501F6AA8256fe38c4E45757;
    
    // Events
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    
    // Modifier for owner-only functions
    modifier onlyOwner() {
        require(msg.sender == _owner, "Ownable: caller is not the owner");
        _;
    }
    
    // No visible constructor in decompilation - owner likely set during deployment
    
    function owner() public view returns (address) {
        return _owner;
    }
    
    // Returns the USDC token address
    function USDC() public pure returns (address) {
        return USDC_TOKEN;
    }
    
    // Returns the CCTP forwarder address
    function cctpForwarder() public pure returns (address) {
        return CCTP_FORWARDER;
    }
    
    // Returns the destination address
    function destination() public pure returns (address) {
        return DESTINATION_ADDRESS;
    }
    
    // Main bridge function
    function bridge(address _token, address _to, uint256 _amount) external onlyOwner {
        // Only USDC token is supported
        require(_token == USDC_TOKEN, "Invalid asset");
        
        // If max uint256 is passed, use the contract's entire USDC balance
        if (_amount == type(uint256).max) {
            _amount = IERC20(USDC_TOKEN).balanceOf(address(this));
        }
        
        // Approve the forwarder to spend USDC
        require(
            IERC20(USDC_TOKEN).approve(CCTP_FORWARDER, _amount),
            "USDC approval failed"
        );
        
        // Prepare hook data (CCTP forward message)
        bytes memory hookData = _formatHookData(_to);
        
        // Call the CCTP forwarder contract
        (bool success, ) = CCTP_FORWARDER.call(
            abi.encodeWithSignature(
                "forward(uint256,uint256,address,uint256,uint256,(string,address))",
                _amount,       // amount
                19,            // chainId (likely Arbitrum Nova = 42170, but decomp shows 19)
                0,             // fee (appears to be 0 from decomp)
                USDC_TOKEN,    // token
                0,             // fee again? (decomp shows same value twice)
                500000,        // gas limit (0x7A120 = 500,000)
                2000,          // gas price
                hookData       // hook data struct
            )
        );
        require(success, "CCTP forward failed");
    }
    
    // Format hook data for CCTP forwarder
    function formatHookData(address recipient) public view returns (bytes memory) {
        return _formatHookData(recipient);
    }
    
    // Internal function to format hook data
    function _formatHookData(address recipient) private pure returns (bytes memory) {
        // Create a struct with hook type and recipient
        // The struct appears to be: (string hook, address recipient)
        // where hook is "cctp-forward"
        bytes memory data = abi.encode(
            "cctp-forward",  // hook type
            recipient        // recipient address
        );
        return data;
    }
    
    // Standard ownership functions
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
    
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
    
    // Fallback
    fallback() external {
        revert();
    }
}