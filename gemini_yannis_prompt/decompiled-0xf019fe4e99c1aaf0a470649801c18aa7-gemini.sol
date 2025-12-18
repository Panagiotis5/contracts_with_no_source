// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProjectNFT {
    struct Project {
        address creator;
        address token; // Payment token?
        address recipient;
        uint256 budget;
        uint256 paid;
        uint256 scheduled;
        uint256 collected;
        uint256 feesPaid;
        uint256 unknown;
        address[] arrayAddr;
        uint256[] arrayUint;
        uint256 flags; 
    }

    struct Batch {
        uint256 projectId;
        uint256 count;
        uint256 totalAmount;
        bool processed;
    }

    mapping(uint256 => Project) public projects;
    mapping(uint256 => mapping(uint256 => Batch)) public batches;
    uint256 public nextProjectId;
    uint256 public feePercent;
    address public feeTo;

    event ProjectCreated(uint256 projectId, address creator, uint256 budget);
    event BatchCreated(uint256 batchId, uint256 projectId);
    event BatchProcessed(uint256 projectId, uint256 batchId, uint256 amount);

    function createProject(
        address _recipient, 
        address _token, 
        uint256 _budget
    ) public {
        uint256 projectId = ++nextProjectId;
        Project storage p = projects[projectId];
        p.creator = msg.sender;
        p.recipient = _recipient;
        p.token = _token;
        p.budget = _budget;
        emit ProjectCreated(projectId, msg.sender, _budget);
    }

    function createBatch(uint256 projectId) public {
        // Logic to create a payment batch
        emit BatchCreated(0, projectId); // simplified
    }

    function processBatch(uint256 projectId, uint256 batchId) public {
        // Logic to process payments in batch
        // Deduct fee
        // Transfer tokens
    }
}
