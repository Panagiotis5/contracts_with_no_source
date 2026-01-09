// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ReconstructedContract {
    // Reentrancy guard
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;
    uint256 private _reentrancyStatus;

    // AccessControl
    struct RoleData {
        mapping(address => bool) members;
        bytes32 adminRole;
    }
    mapping(bytes32 => RoleData) private _roles;

    // ERC721
    string private _name;
    string private _symbol;
    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(uint256 => address) private _tokenApprovals;
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    // Fee
    address private _feeTo;
    uint256 private _feePercent; // basis points (10000 = 100%)

    // Projects and batches
    uint256 private _nextProjectId;
    mapping(uint256 => uint256) private _nextBatchId; // projectId -> next batch id

    struct Project {
        address organisation;
        address recipient;
        address token;
        uint256 budget;
        uint256 paid;
        uint256 scheduled;
        uint256 households;
        uint256 fees;
        uint256 completed;
        address[] recipients;
        uint16[] amounts; // in basis points? or actual amounts? Note: the code uses uint16 and multiplies by amounts in some places.
        uint256 flags; // bit0: prefunded, bit8: done
    }
    mapping(uint256 => Project) private _projects;

    struct Batch {
        uint256 projectId;
        uint256 households;
        uint256 amount;
        bool processed;
    }
    mapping(uint256 => mapping(uint256 => Batch)) private _batches;

    // Household payments for a project and batch
    mapping(uint256 => mapping(uint256 => mapping(bytes => uint256))) private _householdPayments;

    // Base URI for tokenURI
    string private _baseURI;

    // Events
    event BaseURISet(string oldBaseURI, string newBaseURI);
    event FeePercentUpdated(uint256 oldFeePercent, uint256 newFeePercent);
    event BatchCreated(uint256 batchId, uint256 projectId);
    event FeeToUpdated(address oldFeeTo, address newFeeTo);
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event RoleGranted(bytes32 indexed role, address indexed account, address indexed sender);
    event RoleRevoked(bytes32 indexed role, address indexed account, address indexed sender);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);
    event ProjectCreated(uint256 projectId, address token, address organisation, address recipient, uint256 budget, bool prefunded, uint256[] recipientAmounts);
    event ProjectRecipientsSet(uint256 projectId, address[] recipients, uint16[] amounts);
    event ProjectCompleted(uint256 projectId, address organisation, uint256 households, uint256 paid, uint256 fees, uint256 completed);
    event ProjectPaid(uint256 projectId, uint256 amount, address[] recipients, uint256[] amounts);
    event BatchProcessed(uint256 projectId, uint256 batchId, uint256 amount, uint256 fee, uint256 households);
    event ProjectPrefunded(uint256 projectId, address prefunder, uint256 budget, uint256 total);

    // Constants
    bytes32 public constant DEFAULT_ADMIN_ROLE = 0x00;
    bytes32 public constant BATCH_MANAGER_ROLE = 0x4be9642d4531f42a36017834f942ed2ca4663fcdec815a5ff90857c83f81d37b;

    // Modifiers
    modifier nonReentrant() {
        require(_reentrancyStatus != _ENTERED, "ReentrancyGuard: reentrant call");
        _reentrancyStatus = _ENTERED;
        _;
        _reentrancyStatus = _NOT_ENTERED;
    }

    modifier onlyRole(bytes32 role) {
        _checkRole(role, msg.sender);
        _;
    }

    // Helper functions for AccessControl (from OpenZeppelin)
    function _checkRole(bytes32 role, address account) internal view {
        if (!hasRole(role, account)) {
            revert(
                string(
                    abi.encodePacked(
                        "AccessControl: account ",
                        Strings.toHexString(account),
                        " is missing role ",
                        Strings.toHexString(uint256(role), 32)
                    )
                )
            );
        }
    }

    // We'll need to implement the AccessControl functions, but we can follow the standard.

    // We'll also need to implement ERC721 functions.

    // We'll also need to implement the custom functions.

    // We note that the contract uses SafeERC20. We can use OpenZeppelin's SafeERC20 library for the token.
    using SafeERC20 for IERC20;

    // We'll define an interface for IERC20.
    interface IERC20 {
        function transferFrom(address from, address to, uint256 value) external returns (bool);
        function transfer(address to, uint256 value) external returns (bool);
    }

    // We'll also need a function to compute the fee for an amount.
    function getFee(uint256 amount) public view returns (uint256) {
        return (amount * _feePercent) / 10000;
    }

    // We'll also need a function to compute the organisation fee for a project (which is stored in the project's amounts as uint16 basis points).
    // We see in the code that the organisation fee is the sum of the uint16 amounts in the project. We have a function `0x26cc` that computes the total.
    // We'll implement a helper function for that.

    // The rest of the functions will be implemented below.

    // However, note that the decompiled code has many private functions. We'll try to inline them in the public functions.

    // We start with the constructor? We don't have the constructor in the decompiled code. We assume it's already deployed.

    // We'll now write the functions in the order they appear in the decompiled code, but we'll group them by functionality.

    // First, the ERC721 functions.

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function balanceOf(address owner) public view returns (uint256) {
        require(owner != address(0), "ERC721: balance query for the zero address");
        return _balances[owner];
    }

    function ownerOf(uint256 tokenId) public view returns (address) {
        address owner = _owners[tokenId];
        require(owner != address(0), "ERC721: owner query for nonexistent token");
        return owner;
    }

    // ... and so on for the other ERC721 functions.

    // We note that the contract also has a function `tokenURI` which uses `_baseURI` and the tokenId.
    // We see that the tokenId is converted to hex and appended to the baseURI.

    // We'll now write the AccessControl functions.

    function getRoleAdmin(bytes32 role) public view returns (bytes32) {
        return _roles[role].adminRole;
    }

    function grantRole(bytes32 role, address account) public onlyRole(getRoleAdmin(role)) {
        _grantRole(role, account);
    }

    function renounceRole(bytes32 role, address account) public {
        require(account == msg.sender, "AccessControl: can only renounce roles for self");
        _revokeRole(role, account);
    }

    function revokeRole(bytes32 role, address account) public onlyRole(getRoleAdmin(role)) {
        _revokeRole(role, account);
    }

    function hasRole(bytes32 role, address account) public view returns (bool) {
        return _roles[role].members[account];
    }

    // Internal functions for AccessControl
    function _grantRole(bytes32 role, address account) internal {
        if (!hasRole(role, account)) {
            _roles[role].members[account] = true;
            emit RoleGranted(role, account, msg.sender);
        }
    }

    function _revokeRole(bytes32 role, address account) internal {
        if (hasRole(role, account)) {
            _roles[role].members[account] = false;
            emit RoleRevoked(role, account, msg.sender);
        }
    }

    // We'll now write the custom functions.

    // However, note that the decompiled code is very low-level and we have to be careful.

    // We'll write the functions one by one, trying to match the decompiled code.

    // We note that the function `0x2836aa64` is the createProject function. We'll rename it to `createProject`.
    // It takes:
    //   address varg0, address varg1, uint256 varg2, address varg3, uint256 varg4, uint256 varg5, uint256 varg6
    // From the call, we see:
    //   varg0: organisation? (address)
    //   varg1: recipient? (address)
    //   varg2: budget (uint256)
    //   varg3: token (address)
    //   varg4: offset for an array of uint16 amounts? (uint256)
    //   varg5: offset for an array of addresses? (uint256)
    //   varg6: offset for an array of uint16 amounts? (uint256) -- wait, we see two arrays: one for recipients and one for amounts.

    // We'll change the function signature to:
    // function createProject(address organisation, address recipient, uint256 budget, address token, uint16[] calldata amounts, address[] calldata recipients) external onlyRole(DEFAULT_ADMIN_ROLE) nonReentrant returns (uint256) {
    // But note: the decompiled code has the parameters in a different order.

    // Let's look at the function `0x9e9` (which is called by `0x2836aa64`). It has parameters:
    //   varg0, varg1, varg2, varg3, varg4, varg5, varg6, varg7, varg8, varg9
    // We see:
    //   varg9: organisation (address)
    //   varg8: recipient (address)
    //   varg7: budget (uint256)
    //   varg6: token (address)
    //   varg5: offset for an array of uint16 amounts? (uint256) -> we'll call it `amounts`
    //   varg4: length of the amounts array? (uint256) -> we'll call it `amountsLength`
    //   varg3: offset for an array of addresses? (uint256) -> we'll call it `recipients`
    //   varg2: length of the recipients array? (uint256) -> we'll call it `recipientsLength`
    //   varg1: offset for an array of uint16 amounts? (uint256) -> wait, we see two arrays: one for the project creation event and one for the recipients? Actually, the first array (at varg5) is for the event, and the second (at varg1) is for the project.

    // We are confused. Let's look at the decompiled code of `0x9e9`:

    // It uses varg5 and varg4 to read an array of uint256 (which is then emitted in the ProjectCreated event) and then uses varg1 and varg0 to read an array of uint16 (which is stored in the project) and also uses varg3 and varg2 to read an array of addresses (which is stored in the project).

    // So we have three arrays:
    //  1. For the event: an array of uint256 (length varg4, data at varg5). We'll call it `recipientAmounts` (in the event).
    //  2. For the project: an array of addresses (length varg2, data at varg3). We'll call it `recipients`.
    //  3. For the project: an array of uint16 (length varg0, data at varg1). We'll call it `amounts`.

    // But note: the function `0x9e9` also checks that the length of the addresses array (varg2) equals the length of the uint16 array (varg0).

    // So we can change the function signature of `0x2836aa64` to:
    //   createProject(address organisation, address recipient, uint256 budget, address token, uint256[] calldata recipientAmounts, address[] calldata recipients, uint16[] calldata amounts)

    // However, note that the event uses `recipientAmounts` (uint256[]) and the project stores `recipients` (address[]) and `amounts` (uint16[]).

    // We'll write the function accordingly.

    // We'll also note that the function `0x9e9` sets the project's flags to 0 (not prefunded and not done).

    // We'll now write the function.

    function createProject(
        address organisation,
        address recipient,
        uint256 budget,
        address token,
        uint256[] calldata recipientAmounts,
        address[] calldata recipients,
        uint16[] calldata amounts
    ) external onlyRole(DEFAULT_ADMIN_ROLE) nonReentrant returns (uint256) {
        require(organisation != address(0), "organisation=0");
        require(budget > 0, "budget=0");
        require(recipients.length == amounts.length, "len mismatch");
        require(recipients.length > 0, "empty");

        uint256 projectId = _nextProjectId;
        _nextProjectId = projectId + 1;

        Project storage project = _projects[projectId];
        project.organisation = organisation;
        project.recipient = recipient;
        project.token = token;
        project.budget = budget;
        project.paid = 0;
        project.scheduled = 0;
        project.households = 0;
        project.fees = 0;
        project.completed = 0;
        project.recipients = recipients;
        project.amounts = amounts;
        project.flags = 0; // not prefunded, not done

        // Check that the sum of amounts (which are in basis points) does not exceed 10000 (100%).
        uint256 totalBasisPoints = 0;
        for (uint256 i = 0; i < amounts.length; i++) {
            totalBasisPoints += amounts[i];
        }
        require(totalBasisPoints <= 10000, "orgFee>100%");

        emit ProjectCreated(projectId, token, organisation, recipient, budget, false, recipientAmounts);
        emit ProjectRecipientsSet(projectId, recipients, amounts);

        return projectId;
    }

    // We'll now write the function `createBatch` (which is called by `createBatch` in the decompiled code).
    function createBatch(uint256 projectId) external onlyRole(BATCH_MANAGER_ROLE) returns (uint256) {
        require(projectId != 0, "invalid project");
        Project storage project = _projects[projectId];
        require(!project.isDone(), "project done"); // We'll need to add a getter for the flags.

        uint256 batchId = _nextBatchId[projectId];
        _nextBatchId[projectId] = batchId + 1;

        _batches[projectId][batchId] = Batch({
            projectId: projectId,
            households: 0,
            amount: 0,
            processed: false
        });

        emit BatchCreated(batchId, projectId);
        return batchId;
    }

    // We'll write the function `0x720127b9` which records household payments for a batch.
    // We'll call it `recordHouseholdPayments`.
    // It takes:
    //   uint256 projectId, uint256 batchId, uint256[] calldata householdIds, uint256[] calldata amounts
    // But note: the householdIds are bytes, not uint256. In the decompiled code, it reads an array of bytes (from calldata) and then each element is a bytes array.

    // We see that the function reads an array of bytes (householdIds) and an array of uint256 (amounts). The length of both arrays must be the same.

    // We'll change the function signature to:
    //   recordHouseholdPayments(uint256 projectId, uint256 batchId, bytes[] calldata householdIds, uint256[] calldata amounts)

    function recordHouseholdPayments(
        uint256 projectId,
        uint256 batchId,
        bytes[] calldata householdIds,
        uint256[] calldata amounts
    ) external onlyRole(BATCH_MANAGER_ROLE) {
        require(householdIds.length == amounts.length, "len mismatch");
        require(householdIds.length > 0, "empty");
        require(!_batches[projectId][batchId].processed, "already processed");
        Project storage project = _projects[projectId];
        require(!project.isDone(), "project done");

        Batch storage batch = _batches[projectId][batchId];
        uint256 totalAmount = 0;
        for (uint256 i = 0; i < householdIds.length; i++) {
            bytes calldata householdId = householdIds[i];
            require(amounts[i] > 0, "amount=0");
            require(_householdPayments[projectId][batchId][householdId] == 0, "household paid");
            _householdPayments[projectId][batchId][householdId] = amounts[i];
            totalAmount += amounts[i];
        }
        batch.amount += totalAmount;
        batch.households += householdIds.length;
        project.scheduled += totalAmount;
        project.households += householdIds.length;
        require(project.paid + project.scheduled <= project.budget, "exceeds budget");
    }

    // We'll write the function `0xec0030f5` which processes a batch.
    // We'll call it `processBatch`.
    function processBatch(uint256 projectId, uint256 batchId) external onlyRole(BATCH_MANAGER_ROLE) nonReentrant {
        Batch storage batch = _batches[projectId][batchId];
        require(!batch.processed, "batch already processed");
        require(batch.amount > 0, "amount=0");
        Project storage project = _projects[projectId];
        require(!project.isDone(), "project done");

        uint256 fee = getFee(batch.amount);
        project.fees += fee;
        project.scheduled -= batch.amount;
        project.paid += batch.amount;

        IERC20 token = IERC20(project.token);
        if (project.isPrefunded()) {
            token.safeTransfer(project.recipient, batch.amount);
            token.safeTransfer(_feeTo, fee);
        } else {
            token.safeTransferFrom(project.organisation, project.recipient, batch.amount);
            token.safeTransferFrom(project.organisation, _feeTo, fee);
        }
        batch.processed = true;

        emit BatchProcessed(projectId, batchId, batch.amount, fee, batch.households);
    }

    // We'll write the function `0xafd5083b` which prefunds a project.
    // We'll call it `prefundProject`.
    function prefundProject(uint256 projectId) external nonReentrant {
        Project storage project = _projects[projectId];
        require(projectId != 0 && !project.isDone(), "invalid project");
        require(project.paid == 0, "already paid");
        require(!project.isPrefunded(), "already prefunded");

        uint256 fee = getFee(project.budget);
        uint256 orgFee = _getOrgFee(projectId); // We'll need to implement _getOrgFee.
        uint256 total = project.budget + fee + orgFee;

        project.setPrefunded(true); // We'll need to set the flag.

        IERC20 token = IERC20(project.token);
        token.safeTransferFrom(msg.sender, address(this), total);

        emit ProjectPrefunded(projectId, msg.sender, project.budget, total);
    }

    // We'll write the function `completeProject`.
    function completeProject(uint256 projectId) external nonReentrant {
        Project storage project = _projects[projectId];
        require(!project.isDone(), "already done");
        require(msg.sender == project.organisation || hasRole(DEFAULT_ADMIN_ROLE, msg.sender), "not authorised");

        project.setDone(true);

        uint256 orgFee = _getOrgFee(projectId);
        if (orgFee > 0 && project.recipients.length > 0) {
            uint256[] memory amounts = new uint256[](project.recipients.length);
            uint256 totalPaid = 0;
            for (uint256 i = 0; i < project.recipients.length; i++) {
                uint256 amount = (project.amounts[i] * orgFee) / 10000;
                if (i == project.recipients.length - 1) {
                    amount = orgFee - totalPaid;
                } else {
                    totalPaid += amount;
                }
                amounts[i] = amount;
                if (amount > 0) {
                    if (project.isPrefunded()) {
                        IERC20(project.token).safeTransfer(project.recipients[i], amount);
                    } else {
                        IERC20(project.token).safeTransferFrom(project.organisation, project.recipients[i], amount);
                    }
                }
            }
            project.completed = orgFee;
            emit ProjectPaid(projectId, orgFee, project.recipients, amounts);
        } else {
            project.completed = 0;
        }

        if (project.isPrefunded()) {
            uint256 remainingBudget = project.budget - project.paid;
            uint256 fee = getFee(project.budget) - project.fees;
            uint256 orgFeeRemaining = orgFee - project.completed;
            uint256 total = remainingBudget + fee + orgFeeRemaining;
            if (total > 0) {
                IERC20(project.token).safeTransfer(project.organisation, total);
            }
        }

        emit ProjectCompleted(projectId, project.organisation, project.households, project.paid, project.fees, project.completed);

        // Mint an NFT for the project? We see in the decompiled code that it calls `0x19f7` which mints an NFT to the organisation.
        _safeMint(project.organisation, projectId);
    }

    // We'll need to implement the ERC721 minting function.
    function _safeMint(address to, uint256 tokenId) internal {
        require(to != address(0), "ERC721: mint to the zero address");
        require(_owners[tokenId] == address(0), "ERC721: token already minted");

        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(address(0), to, tokenId);
    }

    // We'll need to implement the helper function `_getOrgFee` which returns the total of the project's amounts (in basis points) of the budget? Actually, the orgFee is the sum of the amounts (which are in basis points) applied to the budget.
    function _getOrgFee(uint256 projectId) internal view returns (uint256) {
        Project storage project = _projects[projectId];
        uint256 totalBasisPoints = 0;
        for (uint256 i = 0; i < project.amounts.length; i++) {
            totalBasisPoints += project.amounts[i];
        }
        return (project.budget * totalBasisPoints) / 10000;
    }

    // We'll also need to add getter functions for the project and batch.

    function projects(uint256 projectId) public view returns (
        address organisation,
        address recipient,
        address token,
        uint256 budget,
        uint256 paid,
        uint256 scheduled,
        uint256 households,
        uint256 fees,
        uint256 completed,
        address[] memory recipients,
        uint16[] memory amounts,
        bool prefunded,
        bool done
    ) {
        Project storage project = _projects[projectId];
        organisation = project.organisation;
        recipient = project.recipient;
        token = project.token;
        budget = project.budget;
        paid = project.paid;
        scheduled = project.scheduled;
        households = project.households;
        fees = project.fees;
        completed = project.completed;
        recipients = project.recipients;
        amounts = project.amounts;
        prefunded = project.isPrefunded();
        done = project.isDone();
    }

    function batches(uint256 projectId, uint256 batchId) public view returns (
        uint256 _projectId,
        uint256 households,
        uint256 amount,
        bool processed
    ) {
        Batch storage batch = _batches[projectId][batchId];
        _projectId = batch.projectId;
        households = batch.households;
        amount = batch.amount;
        processed = batch.processed;
    }

    // We'll also need to implement the function `0xd4e1d8e3` which returns the payment for a household in a batch.
    function getHouseholdPayment(uint256 projectId, uint256 batchId, bytes calldata householdId) public view returns (uint256) {
        return _householdPayments[projectId][batchId][householdId];
    }

    // We'll also need to implement the function `0xb2946b0c` which returns the next batch id for a project.
    function nextBatchId(uint256 projectId) public view returns (uint256) {
        return _nextBatchId[projectId];
    }

    // We'll also need to implement the function `0xd2137bae` which returns the BATCH_MANAGER_ROLE.
    function getBatchManagerRole() public pure returns (bytes32) {
        return BATCH_MANAGER_ROLE;
    }

    // We'll also need to implement the fee setter and getter.

    function setFeePercent(uint256 newFeePercent) external onlyRole(DEFAULT_ADMIN_ROLE) {
        require(newFeePercent <= 10000, "fee>100%");
        emit FeePercentUpdated(_feePercent, newFeePercent);
        _feePercent = newFeePercent;
    }

    function setFeeTo(address newFeeTo) external onlyRole(DEFAULT_ADMIN_ROLE) {
        require(newFeeTo != address(0), "feeTo=0");
        emit FeeToUpdated(_feeTo, newFeeTo);
        _feeTo = newFeeTo;
    }

    // We'll also need to implement the baseURI setter and getter.

    function setBaseURI(string calldata newBaseURI) external onlyRole(DEFAULT_ADMIN_ROLE) {
        string memory oldBaseURI = _baseURI;
        emit BaseURISet(oldBaseURI, newBaseURI);
        _baseURI = newBaseURI;
    }

    function tokenURI(uint256 tokenId) public view returns (string memory) {
        require(_owners[tokenId] != address(0), "ERC721: URI query for nonexistent token");
        return string(abi.encodePacked(_baseURI, _toHexString(tokenId)));
    }

    // Helper function to convert uint256 to hex string.
    function _toHexString(uint256 value) internal pure returns (string memory) {
        return Strings.toHexString(value);
    }

    // We'll also need to implement the ERC721 transfer functions and approval functions. We'll use the standard OpenZeppelin ERC721 implementation.

    // However, note that the decompiled code has a non-standard ERC721 implementation. We'll try to follow the decompiled code for the transfer functions.

    // We see that the decompiled code has a function `0x95e` which is called by `transferFrom` and `safeTransferFrom`. We'll implement that.

    function transferFrom(address from, address to, uint256 tokenId) public {
        require(to != address(0), "ERC721: transfer to the zero address");
        require(_isApprovedOrOwner(msg.sender, tokenId), "ERC721: transfer caller is not owner nor approved");

        _transfer(from, to, tokenId);
    }

    function _isApprovedOrOwner(address spender, uint256 tokenId) internal view returns (bool) {
        address owner = ownerOf(tokenId);
        return (spender == owner || getApproved(tokenId) == spender || isApprovedForAll(owner, spender));
    }

    function getApproved(uint256 tokenId) public view returns (address) {
        require(_owners[tokenId] != address(0), "ERC721: approved query for nonexistent token");
        return _tokenApprovals[tokenId];
    }

    function isApprovedForAll(address owner, address operator) public view returns (bool) {
        return _operatorApprovals[owner][operator];
    }

    function _transfer(address from, address to, uint256 tokenId) internal {
        require(ownerOf(tokenId) == from, "ERC721: transfer from incorrect owner");
        require(to != address(0), "ERC721: transfer to the zero address");

        // Clear approvals from the previous owner
        _approve(address(0), tokenId);

        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(from, to, tokenId);
    }

    function approve(address to, uint256 tokenId) public {
        address owner = ownerOf(tokenId);
        require(to != owner, "ERC721: approval to current owner");
        require(msg.sender == owner || isApprovedForAll(owner, msg.sender), "ERC721: approve caller is not owner nor approved for all");

        _approve(to, tokenId);
    }

    function _approve(address to, uint256 tokenId) internal {
        _tokenApprovals[tokenId] = to;
        emit Approval(ownerOf(tokenId), to, tokenId);
    }

    function setApprovalForAll(address operator, bool approved) public {
        require(operator != address(0), "ERC721: approve to the zero address");
        _operatorApprovals[msg.sender][operator] = approved;
        emit ApprovalForAll(msg.sender, operator, approved);
    }

    // We'll also need to implement the safeTransferFrom functions (with and without data).

    function safeTransferFrom(address from, address to, uint256 tokenId) public {
        safeTransferFrom(from, to, tokenId, "");
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public {
        require(_isApprovedOrOwner(msg.sender, tokenId), "ERC721: transfer caller is not owner nor approved");
        _safeTransfer(from, to, tokenId, data);
    }

    function _safeTransfer(address from, address to, uint256 tokenId, bytes memory data) internal {
        _transfer(from, to, tokenId);
        require(_checkOnERC721Received(from, to, tokenId, data), "ERC721: transfer to non ERC721Receiver implementer");
    }

    function _checkOnERC721Received(address from, address to, uint256 tokenId, bytes memory data) internal returns (bool) {
        if (to.code.length == 0) {
            return true;
        }
        try IERC721Receiver(to).onERC721Received(msg.sender, from, tokenId, data) returns (bytes4 retval) {
            return retval == IERC721Receiver.onERC721Received.selector;
        } catch (bytes memory reason) {
            if (reason.length == 0) {
                revert("ERC721: transfer to non ERC721Receiver implementer");
            } else {
                assembly {
                    revert(add(32, reason), mload(reason))
                }
            }
        }
    }

    // We'll also need to define the interface for IERC721Receiver.
    interface IERC721Receiver {
        function onERC721Received(address operator, address from, uint256 tokenId, bytes calldata data) external returns (bytes4);
    }

    // We'll also need to use the Strings library for converting uint256 to hex string.
    using Strings for uint256;

    // We'll also need to add the helper functions for the Project struct to check the flags.
    // We'll add them as methods in the struct.

    // We can't add methods to a struct in Solidity, so we'll use functions that take the project as storage.

    function isPrefunded(Project storage project) internal view returns (bool) {
        return (project.flags & 0x01) != 0;
    }

    function isDone(Project storage project) internal view returns (bool) {
        return (project.flags & 0x100) != 0;
    }

    function setPrefunded(Project storage project, bool prefunded) internal {
        if (prefunded) {
            project.flags |= 0x01;
        } else {
            project.flags &= ~0x01;
        }
    }

    function setDone(Project storage project, bool done) internal {
        if (done) {
            project.flags |= 0x100;
        } else {
            project.flags &= ~0x100;
        }
    }

    // We'll also need to initialize the reentrancy status and the roles.

    constructor() {
        _reentrancyStatus = _NOT_ENTERED;
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(BATCH_MANAGER_ROLE, msg.sender);
    }
}