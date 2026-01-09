// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract DecompiledContract {
    uint256 private _totalSupply;
    address private _owner;
    mapping(address => uint256) private _balanceOf;
    mapping(address => mapping(address => uint256)) private _allowance;
    mapping(address => bool) private _isRouter;
    
    // Tax recipient address - hardcoded in the contract
    address private constant TAX_RECIPIENT = 0xb0f41cf4de6ed2aa63faaf253d0802c695aabf49;
    uint256 private constant TAX_BPS = 400; // 4% tax
    uint256 private constant BPS_DENOMINATOR = 10000;
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event RouterSet(address indexed account, bool value);
    
    error NotOwner();
    error ZeroRouter();
    error ZeroAmount();
    error BalanceExceeded();
    error AllowanceExceeded();
    error TransferToZeroAddress();
    
    constructor() {
        _owner = msg.sender;
    }
    
    modifier onlyOwner() {
        if (msg.sender != _owner) revert NotOwner();
        _;
    }
    
    // Safe math functions from the decompiled code
    function _safeSub(uint256 a, uint256 b) private pure returns (uint256) {
        require(a - b <= a, "SafeMath: subtraction overflow");
        return a - b;
    }
    
    function _safeAdd(uint256 a, uint256 b) private pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    
    function _safeMul(uint256 a, uint256 b) private pure returns (uint256) {
        if (a == 0) return 0;
        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    
    function _safeDiv(uint256 a, uint256 b) private pure returns (uint256) {
        require(b > 0, "SafeMath: division by zero");
        return a / b;
    }
    
    // ERC20 functions
    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }
    
    function balanceOf(address account) external view returns (uint256) {
        return _balanceOf[account];
    }
    
    function transfer(address recipient, uint256 amount) external returns (bool) {
        _transfer(amount, recipient, msg.sender);
        return true;
    }
    
    function allowance(address owner, address spender) external view returns (uint256) {
        return _allowance[owner][spender];
    }
    
    function approve(address spender, uint256 amount) external returns (bool) {
        _allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }
    
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool) {
        require(_allowance[sender][msg.sender] >= amount, "ALLOWANCE");
        _allowance[sender][msg.sender] = _safeSub(_allowance[sender][msg.sender], amount);
        _transfer(amount, recipient, sender);
        return true;
    }
    
    // Internal transfer with tax logic
    function _transfer(uint256 amount, address recipient, address sender) private {
        require(amount > 0, "ZERO_AMOUNT");
        require(recipient != address(0), "TO_0");
        require(amount <= _balanceOf[sender], "BALANCE");
        
        _balanceOf[sender] = _safeSub(_balanceOf[sender], amount);
        
        uint256 taxAmount = 0;
        bool senderIsRouter = _isRouter[sender];
        bool recipientIsRouter = _isRouter[recipient];
        
        // Sell tax: sender is router, recipient is not router
        if (senderIsRouter && !recipientIsRouter) {
            taxAmount = _safeDiv(_safeMul(amount, TAX_BPS), BPS_DENOMINATOR);
            _balanceOf[TAX_RECIPIENT] = _safeAdd(_balanceOf[TAX_RECIPIENT], taxAmount);
            emit Transfer(sender, TAX_RECIPIENT, taxAmount);
        } 
        // Buy tax: sender is not router, recipient is router
        else if (!senderIsRouter && recipientIsRouter) {
            taxAmount = _safeDiv(_safeMul(amount, TAX_BPS), BPS_DENOMINATOR);
            _totalSupply = _safeSub(_totalSupply, taxAmount); // Burn the tax
            emit Transfer(sender, address(0), taxAmount);
        }
        
        uint256 netAmount = _safeSub(amount, taxAmount);
        _balanceOf[recipient] = _safeAdd(_balanceOf[recipient], netAmount);
        emit Transfer(sender, recipient, netAmount);
    }
    
    // Token metadata (name/symbol would need to be filled in)
    function name() external pure returns (string memory) {
        // Original decompilation shows empty/placeholder implementation
        return "";
    }
    
    function symbol() external pure returns (string memory) {
        // Original decompilation shows empty/placeholder implementation  
        return "";
    }
    
    function decimals() external pure returns (uint8) {
        return 18;
    }
    
    // Ownership functions
    function owner() external view returns (address) {
        return _owner;
    }
    
    function renounceOwnership() external onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
    
    // Router management
    function setRouter(address account, bool value) external onlyOwner {
        require(account != address(0), "ROUTER_0");
        _isRouter[account] = value;
        emit RouterSet(account, value);
    }
    
    function isRouter(address account) external view returns (bool) {
        return _isRouter[account];
    }
    
    // Tax configuration
    function SELL_TAX_BPS() external pure returns (uint256) {
        return TAX_BPS;
    }
    
    function BUY_TAX_BPS() external pure returns (uint256) {
        return TAX_BPS; // Same as sell tax based on decompilation
    }
    
    function taxRecipient() external pure returns (address) {
        return TAX_RECIPIENT;
    }
    
    // Fallback function
    fallback() external payable {
        revert();
    }
    
    receive() external payable {
        revert();
    }
}