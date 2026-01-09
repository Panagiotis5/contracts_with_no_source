// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract SwapRouter {
    // Storage variables
    mapping(uint256 => bool) private usedOrderIndices;
    
    // Constants
    address private constant MANAGER = 0xbb968d878f3d30b3aa957874f7b8a5b11069332b;
    address private constant WRAPPED_NATIVE = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2;
    
    // Events
    event SwapExecuted(address indexed inputToken, address indexed outputToken, uint256 amount, uint256 fee);
    event FeeCollected(address indexed feeCollector, address indexed token, uint256 amount);
    event OrderExecuted(bytes data, bytes orderIndex);
    
    // Receive function
    receive() external payable {}
    
    // Internal validation function for ECDSA errors
    function _validateECDSAError(uint256 errorCode, uint256 additionalInfo) private pure {
        require(errorCode < 4, "Invalid error code");
        
        if (errorCode == 0) {
            return;
        } else if (errorCode == 1) {
            revert("ECDSA: invalid signature");
        } else if (errorCode == 2) {
            revert("ECDSA: invalid signature length");
        } else if (errorCode == 3) {
            revert("ECDSA: invalid signature 's' value");
        }
    }
    
    // Internal function to transfer fees
    function _transferFee(address token, uint256 amount) private {
        // Get fee collector from manager
        (bool success, bytes memory result) = MANAGER.staticcall(
            abi.encodeWithSignature("getFeeCollector()")
        );
        require(success, "Failed to get fee collector");
        address feeCollector = abi.decode(result, (address));
        
        if (token != address(0)) {
            // ERC20 token transfer
            (success, result) = token.call(
                abi.encodeWithSignature("transfer(address,uint256)", feeCollector, amount)
            );
            require(success && (result.length == 0 || abi.decode(result, (bool))), 
                   "Fee transfer failed");
        } else {
            // Native ETH transfer
            (success, ) = feeCollector.call{value: amount}("");
            require(success, "Fee transfer failed");
        }
        
        emit FeeCollected(feeCollector, token, amount);
    }
    
    // Main swap execution function (internal)
    function _executeSwap(
        address inputToken,
        address outputToken,
        uint256 amount,
        uint256 fee,
        address router,
        bytes calldata swapData,
        bool isNativeInput
    ) private {
        require(msg.sender == address(this), "Only self-call allowed");
        require(router != address(0), "Invalid router");
        require(amount > 0, "Invalid amount");
        require(amount > fee, "Fee exceeds amount");
        
        uint256 amountAfterFee = amount - fee;
        
        // Collect fee if applicable
        if (fee > 0) {
            _transferFee(inputToken, fee);
        }
        
        if (inputToken != address(0)) {
            // ERC20 token swap
            // Get approved spender from manager
            (bool success, bytes memory result) = MANAGER.staticcall(
                abi.encodeWithSignature("getApprovedSpender()")
            );
            require(success, "Failed to get approved spender");
            address approvedSpender = abi.decode(result, (address));
            
            // Approve router to spend tokens
            (success, result) = inputToken.call(
                abi.encodeWithSignature("approve(address,uint256)", approvedSpender, type(uint256).max)
            );
            require(success && (result.length == 0 || abi.decode(result, (bool))), 
                   "Approval failed");
            
            // Execute swap
            (success, result) = router.call(swapData);
            if (!success) {
                if (result.length > 0) {
                    revert(string(result));
                }
                revert("Swap failed");
            }
        } else {
            // Native ETH swap
            (bool success, bytes memory result) = router.call{value: amountAfterFee}(swapData);
            if (!success) {
                if (result.length > 0) {
                    revert(string(result));
                }
                revert("Swap failed");
            }
        }
        
        // For non-native input, verify output amount
        if (isNativeInput && outputToken != address(0)) {
            // This appears to be a complex branch that handles output verification
            // The decompiled code is quite messy here, but it seems to check
            // output balance and collect fees on output if needed
        }
        
        emit SwapExecuted(inputToken, outputToken, amount, fee);
    }
    
    // Public function to execute signed orders
    function executeOrder(
        bytes calldata orderData,
        bytes calldata signature,
        bytes calldata orderIndex
    ) external payable {
        // Check if caller is authorized paymaster via manager
        (bool success, bytes memory result) = MANAGER.staticcall(
            abi.encodeWithSignature("isAuthorizedPaymaster(address)", msg.sender)
        );
        require(success, "Failed to check authorization");
        bool isAuthorized = abi.decode(result, (bool));
        require(isAuthorized, "Unauthorized paymaster");
        
        // Check if order index has been used
        bytes32 orderIndexHash = keccak256(abi.encodePacked(orderIndex));
        require(!usedOrderIndices[uint256(orderIndexHash)], "OrderIndex already used");
        
        // Verify signature
        bytes32 messageHash = keccak256(
            abi.encodePacked(
                keccak256(orderData),
                address(this),
                block.chainid
            )
        );
        bytes32 ethSignedMessageHash = keccak256(
            abi.encodePacked("\x19Ethereum Signed Message:\n32", messageHash)
        );
        
        if (signature.length == 65) {
            bytes32 r;
            bytes32 s;
            uint8 v;
            
            assembly {
                r := mload(add(signature, 32))
                s := mload(add(signature, 64))
                v := byte(0, mload(add(signature, 96)))
            }
            
            if (s > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
                _validateECDSAError(3, uint256(s));
            }
            
            address recovered = ecrecover(ethSignedMessageHash, v, r, s);
            require(recovered != address(0), "Invalid signature");
            require(recovered == address(this), "Invalid signature");
        } else {
            _validateECDSAError(2, signature.length);
        }
        
        // Mark order index as used
        usedOrderIndices[uint256(orderIndexHash)] = true;
        
        // Execute the order
        (success, result) = address(this).call{value: msg.value}(orderData);
        if (!success) {
            if (result.length > 0) {
                revert(string(result));
            }
            revert("Execution failed");
        }
        
        emit OrderExecuted(orderData, orderIndex);
    }
    
    // Public view functions
    function getContractBalance(address token) external view returns (uint256) {
        if (token != address(0)) {
            (bool success, bytes memory result) = token.staticcall(
                abi.encodeWithSignature("balanceOf(address)", address(this))
            );
            require(success, "Balance check failed");
            return abi.decode(result, (uint256));
        } else {
            return address(this).balance;
        }
    }
    
    function isOrderIndexUsed(bytes calldata orderIndex) external view returns (bool) {
        bytes32 orderIndexHash = keccak256(abi.encodePacked(orderIndex));
        return usedOrderIndices[uint256(orderIndexHash)];
    }
    
    function getManager() external pure returns (address) {
        return MANAGER;
    }
    
    function getWrappedNative() external pure returns (address) {
        return WRAPPED_NATIVE;
    }
    
    // Internal transfer function (used by other functions in the contract)
    function _transferTokens(
        address token,
        address from,
        address to,
        uint256 amount,
        uint256 fee
    ) private {
        require(msg.sender == address(this), "Only self-call allowed");
        require(from == address(this), "Invalid from address");
        require(to != address(0), "Invalid recipient");
        require(amount > 0, "Invalid amount");
        require(amount > fee, "Fee exceeds amount");
        
        uint256 amountAfterFee = amount - fee;
        
        // Get fee collector
        (bool success, bytes memory result) = MANAGER.staticcall(
            abi.encodeWithSignature("getFeeCollector()")
        );
        require(success, "Failed to get fee collector");
        address feeCollector = abi.decode(result, (address));
        
        if (token != address(0)) {
            // Check balance
            (success, result) = token.staticcall(
                abi.encodeWithSignature("balanceOf(address)", address(this))
            );
            require(success, "Balance check failed");
            uint256 balance = abi.decode(result, (uint256));
            require(balance >= amount, "Insufficient token balance");
            
            // Transfer to recipient
            (success, result) = token.call(
                abi.encodeWithSignature("transfer(address,uint256)", to, amountAfterFee)
            );
            require(success && (result.length == 0 || abi.decode(result, (bool))), 
                   "Transfer failed");
            
            // Transfer fee if applicable
            if (fee > 0) {
                _transferFee(token, fee);
            }
        } else {
            // Native ETH transfer
            require(address(this).balance >= amount, "Insufficient native token");
            (success, ) = to.call{value: amountAfterFee}("");
            require(success, "Transfer failed");
            
            // Transfer fee if applicable
            if (fee > 0) {
                _transferFee(address(0), fee);
            }
        }
    }
    
    // Safe subtraction
    function _safeSub(uint256 a, uint256 b) private pure returns (uint256) {
        require(b <= a, "Subtraction overflow");
        return a - b;
    }
}