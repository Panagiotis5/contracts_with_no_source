// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymasterRegistry {
    // Storage 0
    mapping(address => bool) public isPaymaster;
    // Storage 1
    address[] public paymasters;
    // Storage 2
    address public pendingOwnerOrRole;
    // Storage 3
    address public feeCollector;

    // Hardcoded owner from the decompiled code
    address constant OWNER_ADDRESS = 0x86295ad2bb85a967d798acc96520ae57d5a7f584;

    event FeeCollectorUpdated(address oldCollector, address newCollector);
    event PaymasterAdded(address paymaster);
    event PaymasterRemoved(address paymaster);
    event RoleUpdated(address oldRole, address newRole); // Event for 0x50779159

    modifier onlyOwner() {
        require(msg.sender == OWNER_ADDRESS, "Only owner");
        _;
    }

    function feeCollectorAddress() public view returns (address) {
        return feeCollector;
    }

    function getRole() public view returns (address) {
        return pendingOwnerOrRole;
    }

    function isPaymasterAddress(address _paymaster) public view returns (bool) {
        return isPaymaster[_paymaster];
    }

    function getPaymasterAt(uint256 index) public view returns (address) {
        require(index < paymasters.length, "Index out of bounds");
        return paymasters[index];
    }

    function setRole(address _addr) public onlyOwner {
        require(_addr != address(0), "Invalid address");
        emit RoleUpdated(pendingOwnerOrRole, _addr);
        pendingOwnerOrRole = _addr;
    }

    function removePaymaster(address _paymaster) public onlyOwner {
        require(isPaymaster[_paymaster], "Not exists");
        
        isPaymaster[_paymaster] = false;
        
        // Remove from array (swap and pop)
        for (uint256 i = 0; i < paymasters.length; i++) {
            if (paymasters[i] == _paymaster) {
                paymasters[i] = paymasters[paymasters.length - 1];
                paymasters.pop();
                break;
            }
        }
        
        emit PaymasterRemoved(_paymaster);
    }

    function getPaymasters() public view returns (address[] memory) {
        return paymasters;
    }

    function addPaymaster(address _paymaster) public onlyOwner {
        require(_paymaster != address(0), "Invalid address");
        require(!isPaymaster[_paymaster], "Already exists");
        _addPaymasterInternal(_paymaster);
    }

    function _addPaymasterInternal(address _paymaster) private {
        isPaymaster[_paymaster] = true;
        paymasters.push(_paymaster);
        emit PaymasterAdded(_paymaster);
    }

    function getPaymasterCount() public view returns (uint256) {
        return paymasters.length;
    }

    function OWNER() public pure returns (address) {
        return OWNER_ADDRESS;
    }

    // Batch add paymasters
    function batchAddPaymasters(address[] calldata _newPaymasters) public onlyOwner {
        for (uint256 i = 0; i < _newPaymasters.length; i++) {
            address pm = _newPaymasters[i];
            if (pm != address(0) && !isPaymaster[pm]) {
                _addPaymasterInternal(pm);
            }
        }
    }

    function updateFeeCollector(address _newCollector) public onlyOwner {
        require(_newCollector != address(0), "Invalid address");
        address oldCollector = feeCollector;
        feeCollector = _newCollector;
        emit FeeCollectorUpdated(oldCollector, _newCollector);
    }
}
