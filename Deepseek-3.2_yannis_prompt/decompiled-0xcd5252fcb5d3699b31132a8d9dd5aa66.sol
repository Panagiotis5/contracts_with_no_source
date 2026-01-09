// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";

contract Oracle is AccessControlEnumerable {
    // Storage variables
    uint256 private _rate;
    uint32 private _updatedAt;
    address public constant ORACLE = 0xe3b5b799b1a3877444cdb7ca419d9f594c3565f1;
    address public constant BASE_ASSET = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;
    
    // Struct for storing reports
    struct Report {
        uint224 value;
        uint32 timestamp;
        bool isValid;
    }
    
    // Mappings
    mapping(address => mapping(uint256 => uint32)) private _reportTimestamps;
    mapping(address => Report[]) private _reports;
    
    // Events (in addition to AccessControl events)
    event InvalidOrder();
    
    // Modifiers
    modifier onlyOracleAdmin() {
        bytes32 role = IOracle(ORACLE).getRoleAdmin(0);
        require(hasRole(role, msg.sender), "AccessControlUnauthorizedAccount");
        _;
    }
    
    constructor() {
        // Initialize with default admin role for the deployer
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }
    
    // AccessControl overrides to match storage layout
    // Note: The decompiled code shows custom storage layout for roles
    // We're using AccessControlEnumerable but need to ensure compatibility
    
    // Main functions
    
    /**
     * @dev Submit multiple reports
     * @param addresses Array of token addresses
     * @param values Array of uint224 values
     * @param timestamps Array of uint32 timestamps
     */
    function submitReports(
        address[] calldata addresses,
        uint224[] calldata values,
        uint32[] calldata timestamps
    ) external onlyOracleAdmin {
        require(
            addresses.length == values.length && 
            values.length == timestamps.length,
            "Array length mismatch"
        );
        
        for (uint256 i = 0; i < addresses.length; i++) {
            // Call the oracle contract
            (bool success, ) = ORACLE.call(
                abi.encodeWithSignature(
                    "submitReport(address,uint224,uint32)",
                    addresses[i],
                    values[i],
                    timestamps[i]
                )
            );
            require(success, "Oracle call failed");
            
            // Handle base asset specially
            if (addresses[i] == BASE_ASSET) {
                require(i == 0, "InvalidOrder");
                _updateRate(values[i]);
            }
            
            // Store report timestamp
            uint256 reportIndex = _reports[addresses[i]].length - 1;
            _reportTimestamps[addresses[i]][reportIndex] = block.timestamp;
        }
    }
    
    /**
     * @dev Get the report timestamp for a specific index
     * @param token Address of the token
     * @param index Report index
     * @return timestamp When the report was recorded
     */
    function getReportTimestamp(address token, uint256 index) 
        external 
        view 
        returns (uint32) 
    {
        return _reportTimestamps[token][index];
    }
    
    /**
     * @dev Get a specific report
     * @param token Address of the token
     * @param index Report index
     * @return value The reported value
     * @return timestamp When the value was reported
     * @return isValid Whether the report is valid
     */
    function getReport(address token, uint256 index)
        external
        view
        returns (
            uint224 value,
            uint32 timestamp,
            bool isValid
        )
    {
        require(index < _reports[token].length, "Index out of bounds");
        Report storage report = _reports[token][index];
        return (report.value, report.timestamp, report.isValid);
    }
    
    /**
     * @dev Get the number of reports for a token
     * @param token Address of the token
     * @return count Number of reports
     */
    function getReportCount(address token) external view returns (uint256) {
        return _reports[token].length;
    }
    
    /**
     * @dev Process reports from oracle (function 0x8f88cbfb)
     * @param reportsData Array of report data (address, uint224, uint32)
     */
    function processReports(bytes calldata reportsData) external onlyOracleAdmin {
        // Decode the data - assuming it's an array of (address, uint224, uint32)
        // This is a simplified version - the actual encoding may differ
        require(reportsData.length > 0 && reportsData.length % 64 == 0, 
                "Invalid data length");
        
        // Call oracle contract
        (bool success, ) = ORACLE.call(
            abi.encodeWithSignature("processReports(bytes)", reportsData)
        );
        require(success, "Oracle call failed");
        
        // Process each report
        for (uint256 i = 0; i < reportsData.length; i += 64) {
            address token;
            uint224 value;
            uint32 timestamp;
            
            // Extract data (simplified - actual decoding may be more complex)
            assembly {
                token := calldataload(add(reportsData.offset, i))
                value := calldataload(add(reportsData.offset, add(i, 32)))
                timestamp := calldataload(add(reportsData.offset, add(i, 48)))
            }
            
            // Get report from oracle
            (uint224 oracleValue, uint32 oracleTimestamp, bool isValid) = 
                IOracle(ORACLE).getReport(token);
            
            // Store the report
            _reports[token].push(Report({
                value: oracleValue,
                timestamp: oracleTimestamp,
                isValid: isValid
            }));
            
            // Handle base asset
            if (!isValid && token == BASE_ASSET) {
                _updateRate(oracleValue);
            }
        }
    }
    
    // Rate getters
    
    /**
     * @dev Get the current rate
     * @return Current rate
     */
    function getRate() external view returns (uint256) {
        return _rate;
    }
    
    /**
     * @dev Get the latest answer (Chainlink compatibility)
     * @return Current rate
     */
    function latestAnswer() external view returns (uint256) {
        return _rate;
    }
    
    /**
     * @dev Get the last update timestamp
     * @return Last update timestamp
     */
    function updatedAt() external view returns (uint32) {
        return _updatedAt;
    }
    
    /**
     * @dev Get round data (Chainlink compatibility)
     * @return roundId Round ID (0 for latest)
     * @return answer Current rate
     * @return startedAt When the round started
     * @return updatedAt When the round was updated
     * @return answeredInRound Round ID in which the answer was computed
     */
    function latestRoundData()
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        )
    {
        return (0, int256(_rate), _updatedAt, _updatedAt, 0);
    }
    
    /**
     * @dev Get decimals (Chainlink compatibility)
     * @return 18 (standard decimal places)
     */
    function decimals() external pure returns (uint8) {
        return 18;
    }
    
    // Internal functions
    
    /**
     * @dev Update the rate based on base asset value
     * @param value The base asset value
     */
    function _updateRate(uint224 value) private {
        require(value > 0, "Division by zero");
        _rate = 10**36 / value; // Calculate inverse rate with 18 decimals
        _updatedAt = uint32(block.timestamp);
    }
    
    /**
     * @dev Safe subtraction with underflow check
     */
    function _safeSub(uint256 a, uint256 b) private pure returns (uint256) {
        require(a >= b, "Subtraction underflow");
        return a - b;
    }
    
    // Interface for the oracle contract
    interface IOracle {
        function getRoleAdmin(bytes32 role) external view returns (bytes32);
        function submitReport(address, uint224, uint32) external;
        function getReport(address) external view returns (uint224, uint32, bool);
        function processReports(bytes calldata) external;
    }
}