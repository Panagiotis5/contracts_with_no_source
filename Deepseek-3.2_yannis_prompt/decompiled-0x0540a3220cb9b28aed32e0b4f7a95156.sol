// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract PaymasterManager {
    // State variables
    mapping(address => bool) public isPaymaster;  // Originally _addPaymaster
    address[] public paymasters;                 // Originally array_1
    address public secondaryAdmin;               // Originally stor_2_0_19 (function 0xaa212975)
    address public feeCollector;                 // Originally _feeCollector
    
    // Events
    event FeeCollectorUpdated(address indexed oldFeeCollector, address indexed newFeeCollector);
    event SecondaryAdminUpdated(address indexed oldSecondaryAdmin, address indexed newSecondaryAdmin);
    event PaymasterAdded(address indexed paymaster);
    event PaymasterRemoved(address indexed paymaster);
    
    // Hardcoded owner address (0x86295ad2bb85a967d798acc96520ae57d5a7f584)
    address public constant OWNER = 0x86295ad2bb85a967d798acc96520ae57d5a7f584;
    
    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == OWNER, "Only owner");
        _;
    }
    
    modifier validAddress(address addr) {
        require(addr != address(0), "Invalid address");
        _;
    }
    
    // Constructor (not present in decompiled code, but feeCollector needs initialization)
    constructor(address _initialFeeCollector) {
        require(_initialFeeCollector != address(0), "Invalid address");
        feeCollector = _initialFeeCollector;
    }
    
    // Get all paymasters (originally function 0x21f8e427)
    function getAllPaymasters() external view returns (address[] memory) {
        return paymasters;
    }
    
    // Get paymasters count (originally function 0x14b1c401)
    function getPaymastersCount() external view returns (uint256) {
        return paymasters.length;
    }
    
    // Add a single paymaster (originally addPaymaster)
    function addPaymaster(address _paymaster) external onlyOwner validAddress(_paymaster) {
        require(!isPaymaster[_paymaster], "Already exists");
        _addPaymasterInternal(_paymaster);
    }
    
    // Batch add paymasters (originally function 0x108fed0b)
    function batchAddPaymasters(address[] calldata _paymasters) external onlyOwner {
        for (uint256 i = 0; i < _paymasters.length; i++) {
            address paymaster = _paymasters[i];
            if (paymaster != address(0) && !isPaymaster[paymaster]) {
                _addPaymasterInternal(paymaster);
            }
        }
    }
    
    // Internal function to add paymaster (originally function 0x884)
    function _addPaymasterInternal(address _paymaster) private {
        isPaymaster[_paymaster] = true;
        paymasters.push(_paymaster);
        emit PaymasterAdded(_paymaster);
    }
    
    // Remove paymaster
    function removePaymaster(address _paymaster) external onlyOwner {
        require(isPaymaster[_paymaster], "Not exists");
        
        // Remove from mapping
        isPaymaster[_paymaster] = false;
        
        // Remove from array
        for (uint256 i = 0; i < paymasters.length; i++) {
            if (paymasters[i] == _paymaster) {
                // Swap with last element and pop
                paymasters[i] = paymasters[paymasters.length - 1];
                paymasters.pop();
                emit PaymasterRemoved(_paymaster);
                return;
            }
        }
    }
    
    // Update fee collector
    function updateFeeCollector(address _newFeeCollector) external onlyOwner validAddress(_newFeeCollector) {
        address oldFeeCollector = feeCollector;
        feeCollector = _newFeeCollector;
        emit FeeCollectorUpdated(oldFeeCollector, _newFeeCollector);
    }
    
    // Update secondary admin (originally function 0x50779159)
    function updateSecondaryAdmin(address _newSecondaryAdmin) external onlyOwner validAddress(_newSecondaryAdmin) {
        address oldSecondaryAdmin = secondaryAdmin;
        secondaryAdmin = _newSecondaryAdmin;
        emit SecondaryAdminUpdated(oldSecondaryAdmin, _newSecondaryAdmin);
    }
    
    // The following functions match the original decompiled function names/selectors:
    
    // Original function 0x9858d824
    function checkPaymaster(address addr) external view returns (bool) {
        return isPaymaster[addr];
    }
    
    // Original function 0x90567058
    function getPaymasterByIndex(uint256 index) external view returns (address) {
        require(index < paymasters.length, "Index out of bounds");
        return paymasters[index];
    }
}