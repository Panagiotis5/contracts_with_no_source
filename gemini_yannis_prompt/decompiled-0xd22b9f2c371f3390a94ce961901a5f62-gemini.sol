// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaxedToken {
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    uint256 public totalSupply;
    address public owner;
    
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    mapping(address => bool) public isRouter;

    address constant TAX_RECIPIENT = 0xb0f41cf4de6ed2aa63faaf253d0802c695aabf49;
    uint256 constant TAX_BPS = 400; // 4%

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event RouterSet(address indexed router, bool status);

    modifier onlyOwner() {
        require(msg.sender == owner, "NOT_OWNER");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function setRouter(address router, bool status) public onlyOwner {
        isRouter[router] = status;
        emit RouterSet(router, status);
    }

    function transfer(address recipient, uint256 amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint256 amount) public returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        require(allowance[sender][msg.sender] >= amount, "ALLOWANCE");
        allowance[sender][msg.sender] -= amount;
        _transfer(sender, recipient, amount);
        return true;
    }

    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(balanceOf[sender] >= amount, "BALANCE");
        balanceOf[sender] -= amount;

        uint256 taxAmount = 0;
        bool senderIsRouter = isRouter[sender];
        bool recipientIsRouter = isRouter[recipient];

        // Buy logic (Router -> User)? or Sell logic (User -> Router)?
        // Decomp logic:
        // if (!senderIsRouter) {
        //    if (senderIsRouter) { ... } // Impossible in this branch
        //    if (recipientIsRouter) { // User -> Router (Sell)
        //        taxAmount = (amount * TAX_BPS) / 10000;
        //        // Send to tax recipient
        //        balanceOf[TAX_RECIPIENT] += taxAmount;
        //        emit Transfer(sender, TAX_RECIPIENT, taxAmount);
        //    }
        // } else {
        //    // Router -> User (Buy)
        //    // Seems to burn the tax?
        //    taxAmount = (amount * TAX_BPS) / 10000;
        //    totalSupply -= taxAmount;
        //    emit Transfer(sender, address(0), taxAmount);
        // }
        // The logic in decomp is a bit convoluted with flags `v3`, `v5`. 
        // Let's implement based on interpretation: Sell = Tax to Wallet, Buy = Tax Burn.
        
        if (!isRouter[sender] && isRouter[recipient]) {
            // Sell
            taxAmount = (amount * TAX_BPS) / 10000;
            balanceOf[TAX_RECIPIENT] += taxAmount;
            emit Transfer(sender, TAX_RECIPIENT, taxAmount);
        } else if (isRouter[sender]) {
            // Buy
            taxAmount = (amount * TAX_BPS) / 10000;
            totalSupply -= taxAmount;
            emit Transfer(sender, address(0), taxAmount);
        }

        uint256 receiveAmount = amount - taxAmount;
        balanceOf[recipient] += receiveAmount;
        emit Transfer(sender, recipient, receiveAmount);
    }
}
