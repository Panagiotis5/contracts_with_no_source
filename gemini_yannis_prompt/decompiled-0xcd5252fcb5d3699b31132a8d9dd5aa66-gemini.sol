// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IOracle {
    function getReport(address token) external view returns (uint224, uint32, bool);
}

contract OracleAdapter {
    address public constant ORACLE = 0xe3b5b799b1a3877444cdb7ca419d9f594c3565f1;
    uint256 public rate;
    uint32 public lastUpdatedAt;

    function latestAnswer() public view returns (uint256) {
        return rate;
    }

    function updatedAt() public view returns (uint32) {
        return lastUpdatedAt;
    }

    function updateRate(uint256 newRate) public {
        // Logic to update rate, likely restricted
        rate = newRate;
        lastUpdatedAt = uint32(block.timestamp);
    }
    
    // 0x1ad5b19c logic
}
