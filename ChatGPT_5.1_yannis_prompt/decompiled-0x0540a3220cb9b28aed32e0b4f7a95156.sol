// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

/// @notice High-level reconstruction of a simple paymaster registry.
/// Owner is hardcoded to 0x86295ad2bb85a967d798acc96520ae57d5a7f584.
contract PaymasterRegistry {
    address public constant OWNER = 0x86295ad2bb85a967d798acc96520ae57d5a7f584;

    mapping(address => bool) private addedPaymaster;
    address[] private paymasters;

    // Unnamed storage slot in the bytecode. The contract only lets the owner set and read it.
    address private singleton;

    address private feeCollector_;

    event PaymasterAdded(address indexed paymaster); // selector 0xb8ab41dd…
    event PaymasterRemoved(address indexed paymaster); // selector 0x6d9bc3c0…
    event SingletonUpdated(address indexed previous, address indexed current); // selector 0x7f08a0ff…
    event FeeCollectorUpdated(address indexed previous, address indexed current);

    modifier onlyOwner() {
        require(msg.sender == OWNER, "Only owner");
        _;
    }

    // --- Views ---

    function feeCollector() external view returns (address) {
        return feeCollector_;
    }

    function singletonAddress() external view returns (address) {
        return singleton;
    }

    function isPaymaster(address paymaster) external view returns (bool) {
        return addedPaymaster[paymaster];
    }

    function paymasterAt(uint256 index) external view returns (address) {
        require(index < paymasters.length, "Index out of bounds");
        return paymasters[index];
    }

    function paymastersCount() external view returns (uint256) {
        return paymasters.length;
    }

    function getPaymasters() external view returns (address[] memory) {
        return paymasters;
    }

    function OWNER_ADDRESS() external pure returns (address) {
        return OWNER;
    }

    // --- Mutations ---

    function updateSingleton(address newSingleton) external onlyOwner {
        require(newSingleton != address(0), "Invalid address");
        address prev = singleton;
        singleton = newSingleton;
        emit SingletonUpdated(prev, newSingleton);
    }

    function addPaymaster(address paymaster) external onlyOwner {
        require(paymaster != address(0), "Invalid address");
        require(!addedPaymaster[paymaster], "Already exists");
        _add(paymaster);
    }

    /// @dev Batch add; ignores items that are zero or already present (matching the original logic).
    function addPaymasters(address[] calldata paymasterList) external onlyOwner {
        for (uint256 i = 0; i < paymasterList.length; i++) {
            address paymaster = paymasterList[i];
            if (paymaster != address(0) && !addedPaymaster[paymaster]) {
                _add(paymaster);
            }
        }
    }

    function removePaymaster(address paymaster) external onlyOwner {
        require(addedPaymaster[paymaster], "Not exists");

        // The original bytecode cleared the mapping first, then only touched the first array slot before exiting.
        // This preserves that quirky behavior: it will only remove if the first slot matches.
        addedPaymaster[paymaster] = false;
        if (paymasters.length > 0) {
            if (paymasters[0] == paymaster) {
                paymasters[0] = paymasters[paymasters.length - 1];
                paymasters.pop();
            }
        }

        emit PaymasterRemoved(paymaster);
    }

    function updateFeeCollector(address newCollector) external onlyOwner {
        require(newCollector != address(0), "Invalid address");
        address prev = feeCollector_;
        feeCollector_ = newCollector;
        emit FeeCollectorUpdated(prev, newCollector);
    }

    // --- Internal helpers ---

    function _add(address paymaster) private {
        addedPaymaster[paymaster] = true;
        paymasters.push(paymaster);
        emit PaymasterAdded(paymaster);
    }
}
