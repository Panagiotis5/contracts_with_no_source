// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

/// @notice High-level reconstruction of a UUPS-upgradeable marketplace/bridge router.
/// - Maintains an allowlist/blacklist of sellers.
/// - Maintains a blocklist for tokens with optional override.
/// - Stores product records (timestamp, pubkey, metadata).
/// - Processes purchases paid in ERC20 or ETH, swaps to USDT via a Uniswap-style router, then
///   splits USDT: a variable "overhead" cut to a partner, 20% of the remainder to a treasury,
///   and the rest to the seller.
/// - Includes admin rescue functions and upgrade hooks.
contract MarketplaceRouter {
    // --- Constants ---
    address public constant TREASURY = 0x3855d35e3b2e7307fc0a82a64f2173d77cb437ce;
    address public constant ROUTER = 0x68b3465833fb72a70ecdf485e0e4c7bd8665fc45; // Uniswap-style
    address public constant USDC = 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48;
    address public constant USDT = 0xdac17f958d2ee523a2206206994597c13d831ec7;
    address public constant WBTC = 0x2260fac5e5542a773aa44fbcfedf7c193bc2c599;
    address public constant WETH = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2;

    // --- Storage ---
    mapping(address => bool) private approvedSellers;
    mapping(address => bool) private sellerBlacklisted;

    // Token blocklist with override flag.
    mapping(address => bool) private tokenBlocked;
    mapping(address => bool) private tokenOverride;

    struct Product {
        uint256 createdAt;
        bytes pubKey;   // 65-byte uncompressed pubkey (0x04...)
        bytes data;     // opaque metadata blob
    }
    Product[] private products;

    // Reentrancy status: 1 = unlocked, 2 = entered
    uint256 private _status;

    // Initializable flags
    uint8 private _initialized; // 0 = uninitialized, 1 = initialized
    bool private _initializing;

    // UUPS implementation slot (ERC1967)
    address private _implementation;

    // Ownership
    address private _owner;

    // --- Events ---
    event Initialized(uint64 version);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event Upgraded(address indexed implementation);

    // Seller events (selectors from bytecode)
    event SellerStatusUpdated(address indexed seller, bool approved, bool blacklisted); // 0x464e5dc3...
    event TokenStatusUpdated(address indexed token, bool blocked, bool overrideFlag);   // 0x9bb0ffc6...

    // Purchase event (selector 0xe36154de...)
    event Purchased(
        address indexed buyer,
        address indexed seller,
        address indexed partner,
        uint256 productId,
        address paymentToken,
        uint256 amountIn,
        uint256 amountUsdtOut,
        bytes data
    );

    // --- Errors (aligned with decompilation intent) ---
    error Unauthorized();
    error InvalidPubKey();
    error TransferFailed();
    error SafeERC20FailedOperation(address token);
    error UnsupportedToken();
    error InsufficientOutput();
    error ReentrancyGuardReentrantCall();
    error InvalidInitialization();
    error UUPSUnauthorizedCallContext();
    error ERC1967InvalidImplementation(address impl);
    error UUPSUnsupportedProxiableUUID(bytes32 uuid);
    error OwnableInvalidOwner(address owner);
    error OwnableUnauthorizedAccount(address caller);
    error NoETHSent();
    error ERC1967NonPayable();

    // --- Modifiers ---
    modifier onlyOwner() {
        if (msg.sender != _owner) revert OwnableUnauthorizedAccount(msg.sender);
        _;
    }

    modifier nonReentrant() {
        if (_status == 2) revert ReentrancyGuardReentrantCall();
        _status = 2;
        _;
        _status = 1;
    }

    modifier initializer() {
        bool isTopLevelCall = !_initializing;
        if (_initialized != 0) revert InvalidInitialization();
        _initialized = 1;
        if (isTopLevelCall) {
            _initializing = true;
        }
        _;
        if (isTopLevelCall) {
            _initializing = false;
            emit Initialized(1);
        }
    }

    // --- Initializer ---
    function initialize() external initializer {
        if (msg.sender == address(0)) revert OwnableInvalidOwner(address(0));
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), msg.sender);
        _status = 1; // unlock reentrancy guard
    }

    // --- Ownership ---
    function owner() public view returns (address) {
        return _owner;
    }

    function transferOwnership(address newOwner) external onlyOwner {
        if (newOwner == address(0)) revert OwnableInvalidOwner(address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

    function renounceOwnership() external onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    // --- Seller management ---
    function addSeller(address seller) external onlyOwner {
        approvedSellers[seller] = true;
        sellerBlacklisted[seller] = false;
        emit SellerStatusUpdated(seller, true, false);
    }

    function blacklistSeller(address seller) external onlyOwner {
        approvedSellers[seller] = approvedSellers[seller];
        sellerBlacklisted[seller] = true;
        emit SellerStatusUpdated(seller, approvedSellers[seller], true);
    }

    function approvedSellersView(address seller) external view returns (bool) {
        return approvedSellers[seller];
    }

    function sellerBlacklist(address seller) external view returns (bool) {
        return sellerBlacklisted[seller];
    }

    // --- Token blocklist management ---
    /// @notice Block a token (cannot be used unless later overridden).
    function blockToken(address token) external onlyOwner {
        tokenBlocked[token] = true;
        tokenOverride[token] = false;
        emit TokenStatusUpdated(token, true, false);
    }

    /// @notice Override a blocked token (allow use even if blocked flag set).
    function overrideBlockedToken(address token) external onlyOwner {
        tokenOverride[token] = true;
        emit TokenStatusUpdated(token, tokenBlocked[token], true);
    }

    function tokenBlockedView(address token) external view returns (bool) {
        return tokenBlocked[token];
    }

    function tokenOverrideView(address token) external view returns (bool) {
        return tokenOverride[token];
    }

    // --- Product management ---
    /// @dev Adds a product. pubKey must be 65-byte uncompressed (0x04 prefix).
    /// seller is derived as address(keccak256(pubKey[1:65])).
    function addProduct(bytes calldata pubKey, bytes calldata data) external {
        if (pubKey.length != 65 || pubKey[0] != 0x04) revert InvalidPubKey();

        address seller = _pubKeyToAddress(pubKey);
        _requireSellerAllowed(seller);

        products.push(Product({
            createdAt: block.timestamp,
            pubKey: pubKey,
            data: data
        }));
    }

    function productsLength() external view returns (uint256) {
        return products.length;
    }

    function productsAt(uint256 index) external view returns (uint256 createdAt, bytes memory pubKey, bytes memory data) {
        Product storage p = products[index];
        return (p.createdAt, p.pubKey, p.data);
    }

    /// @notice Returns all products whose seller is not blacklisted.
    function getProducts() external view returns (ProductView[] memory list) {
        uint256 count;
        for (uint256 i = 0; i < products.length; i++) {
            if (!sellerBlacklisted[_pubKeyToAddress(products[i].pubKey)]) {
                count++;
            }
        }

        list = new ProductView[](count);
        uint256 idx;
        for (uint256 i = 0; i < products.length; i++) {
            address seller = _pubKeyToAddress(products[i].pubKey);
            if (!sellerBlacklisted[seller]) {
                Product storage p = products[i];
                list[idx] = ProductView({
                    seller: seller,
                    pubKey: p.pubKey,
                    data: p.data,
                    createdAt: p.createdAt
                });
                idx++;
            }
        }
    }

    struct ProductView {
        address seller;
        bytes pubKey;
        bytes data;
        uint256 createdAt;
    }

    // --- Purchases (ERC20) ---
    /// @param productId Arbitrary identifier (emitted).
    /// @param paymentToken Token user pays with.
    /// @param amountIn Amount of paymentToken to spend.
    /// @param seller Seller address (must be approved & not blacklisted).
    /// @param partner Partner contract that exposes overhead() percent fee.
    /// @param minOut Minimum USDT output expected.
    /// @param data Extra data emitted with the event.
    function buyWithToken(
        uint256 productId,
        address paymentToken,
        uint256 amountIn,
        address seller,
        address partner,
        uint256 minOut,
        bytes calldata data
    ) external nonReentrant {
        _requireSellerAllowed(seller);
        _requireTokenAllowed(partner);

        // Pull payment token
        _safeTransferFrom(paymentToken, msg.sender, address(this), amountIn);

        // Swap to USDT
        uint256 usdtReceived = _swapToUsdt(paymentToken, amountIn, minOut);

        // Partner overhead percentage
        uint256 overheadPct = _partnerOverhead(partner);

        // Split and payout in USDT
        _distribute(usdtReceived, overheadPct, partner, seller);

        emit Purchased(msg.sender, seller, partner, productId, paymentToken, amountIn, usdtReceived, data);
    }

    // --- Purchases (ETH) ---
    /// @notice Swaps ETH to USDT then splits payouts.
    function buyWithETH(
        uint256 productId,
        address seller,
        address partner,
        uint256 minOut,
        bytes calldata data
    ) external payable nonReentrant {
        if (msg.value == 0) revert NoETHSent();
        _requireSellerAllowed(seller);
        _requireTokenAllowed(partner);

        // Swap ETH->USDT via router
        uint256 usdtReceived = _swapEthToUsdt(minOut);

        uint256 overheadPct = _partnerOverhead(partner);
        _distribute(usdtReceived, overheadPct, partner, seller);

        emit Purchased(msg.sender, seller, partner, productId, address(0), msg.value, usdtReceived, data);
    }

    // --- Direct call helper (keeps behavior of 0x0a33e9be) ---
    /// @notice Executes an arbitrary call on `target` after validating caller is an approved seller
    ///         and `token` is allowed, and that `target` holds a positive balance of `token`.
    function executeForSeller(address target, address token, bytes calldata payload) external {
        _requireSellerAllowed(msg.sender);
        _requireTokenAllowed(token);

        // Require target has some balance of token
        if (_balanceOf(token, target) == 0) revert TransferFailed();

        (bool ok, bytes memory ret) = target.call(payload);
        if (!ok) _revertWith(ret);
    }

    // --- Rescue ---
    function rescueTokens(address token) external onlyOwner {
        uint256 bal = _balanceOf(token, address(this));
        _safeTransfer(token, _owner, bal);
    }

    function rescueETH() external onlyOwner {
        (bool ok, bytes memory ret) = _owner.call{value: address(this).balance}("");
        if (!ok) _revertWith(ret);
    }

    // --- Upgradeability (UUPS-like) ---
    bytes32 public constant PROXIABLE_UUID = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;
    string public constant UPGRADE_INTERFACE_VERSION = "5.0.0";

    function proxiableUUID() external view returns (bytes32) {
        if (address(this) != address(0xffcbdccde6c498a9135b79a2388ea2e21ec5e5df)) {
            revert UUPSUnauthorizedCallContext();
        }
        return PROXIABLE_UUID;
    }

    function upgradeToAndCall(address newImplementation, bytes calldata data) external payable onlyOwner {
        _authorizeUpgrade();
        _upgradeToAndCallUUPS(newImplementation, data);
    }

    function _authorizeUpgrade() internal view {
        if (msg.sender != _owner) revert OwnableUnauthorizedAccount(msg.sender);
    }

    function _upgradeToAndCallUUPS(address newImplementation, bytes memory data) private {
        // Ensure proxiable UUID matches
        try IProxiable(newImplementation).proxiableUUID() returns (bytes32 uuid) {
            if (uuid != PROXIABLE_UUID) revert UUPSUnsupportedProxiableUUID(uuid);
        } catch {
            revert ERC1967InvalidImplementation(newImplementation);
        }

        _implementation = newImplementation;
        emit Upgraded(newImplementation);

        if (data.length > 0) {
            (bool ok, bytes memory ret) = newImplementation.delegatecall(data);
            if (!ok) _revertWith(ret);
        } else {
            if (msg.value > 0) revert ERC1967NonPayable();
        }
    }

    // --- Internal helpers ---
    function _requireSellerAllowed(address seller) private view {
        bool rejected = !approvedSellers[seller] || sellerBlacklisted[seller];
        if (rejected) revert Unauthorized();
    }

    function _requireTokenAllowed(address token) private view {
        if (tokenBlocked[token] && !tokenOverride[token]) revert UnsupportedToken();
    }

    function _pubKeyToAddress(bytes memory pubKey) private pure returns (address) {
        // Drop the 0x04 prefix, hash x||y, then take the lower 20 bytes.
        bytes memory trimmed = new bytes(64);
        for (uint256 i = 0; i < 64; i++) {
            trimmed[i] = pubKey[i + 1];
        }
        return address(uint160(uint256(keccak256(trimmed))));
    }

    function _balanceOf(address token, address account) private view returns (uint256 bal) {
        (bool ok, bytes memory ret) = token.staticcall(abi.encodeWithSignature("balanceOf(address)", account));
        if (!ok || ret.length < 32) return 0;
        bal = abi.decode(ret, (uint256));
    }

    function _safeTransfer(address token, address to, uint256 amount) private {
        (bool ok, bytes memory ret) = token.call(abi.encodeWithSignature("transfer(address,uint256)", to, amount));
        if (!(ok && (ret.length == 0 || abi.decode(ret, (bool))))) {
            revert SafeERC20FailedOperation(token);
        }
    }

    function _safeTransferFrom(address token, address from, address to, uint256 amount) private {
        (bool ok, bytes memory ret) = token.call(
            abi.encodeWithSignature("transferFrom(address,address,uint256)", from, to, amount)
        );
        if (!(ok && (ret.length == 0 || abi.decode(ret, (bool))))) {
            revert SafeERC20FailedOperation(token);
        }
    }

    function _partnerOverhead(address partner) private returns (uint256) {
        (bool ok, bytes memory ret) = partner.call(abi.encodeWithSignature("overhead()"));
        if (!ok || ret.length < 32) _revertWith(ret);
        return abi.decode(ret, (uint256));
    }

    function _swapToUsdt(address tokenIn, uint256 amountIn, uint256 minOut) private returns (uint256 amountOut) {
        if (tokenIn == USDT) {
            if (amountIn < minOut) revert InsufficientOutput();
            return amountIn;
        }

        // Approve router
        _safeApprove(tokenIn, ROUTER, amountIn);

        if (tokenIn == USDC) {
            amountOut = _exactInputSingle(USDC, USDT, 100, amountIn, minOut);
            return amountOut;
        }

        if (tokenIn == WBTC) {
            // Route WBTC -> WETH -> USDT via exactInput path
            bytes memory path = abi.encodePacked(
                WBTC, uint24(3000), WETH, uint24(3000), USDT
            );
            amountOut = _exactInput(path, amountIn, minOut);
            return amountOut;
        }

        // For any other token, try exactInputSingle then fallback to exactInputSingle with max approval
        amountOut = _exactInputSingle(tokenIn, USDT, 3000, amountIn, minOut);
        return amountOut;
    }

    function _swapEthToUsdt(uint256 minOut) private returns (uint256 amountOut) {
        (bool ok, bytes memory ret) = ROUTER.call{value: msg.value}(
            abi.encodeWithSignature(
                "exactInputSingle(address,address,uint24,address,uint256,uint256,uint256,address)",
                WETH,
                USDT,
                uint24(3000),
                address(this),
                msg.value,
                minOut,
                0,
                address(0)
            )
        );
        if (!ok || ret.length < 32) _revertWith(ret);
        amountOut = abi.decode(ret, (uint256));
    }

    function _exactInputSingle(
        address tokenIn,
        address tokenOut,
        uint24 fee,
        uint256 amountIn,
        uint256 minOut
    ) private returns (uint256 amountOut) {
        (bool ok, bytes memory ret) = ROUTER.call(
            abi.encodeWithSignature(
                "exactInputSingle(address,address,uint24,address,uint256,uint256,uint256,address)",
                tokenIn,
                tokenOut,
                fee,
                address(this),
                amountIn,
                minOut,
                0,
                address(0)
            )
        );
        if (!ok || ret.length < 32) _revertWith(ret);
        amountOut = abi.decode(ret, (uint256));
    }

    function _exactInput(bytes memory path, uint256 amountIn, uint256 minOut) private returns (uint256 amountOut) {
        // Approve already done by caller
        (bool ok, bytes memory ret) = ROUTER.call(
            abi.encodeWithSignature(
                "exactInput(bytes,address,uint256,uint256)",
                path,
                address(this),
                amountIn,
                minOut
            )
        );
        if (!ok || ret.length < 32) _revertWith(ret);
        amountOut = abi.decode(ret, (uint256));
    }

    function _safeApprove(address token, address spender, uint256 value) private {
        (bool ok, bytes memory ret) = token.call(abi.encodeWithSignature("approve(address,uint256)", spender, value));
        if (!(ok && (ret.length == 0 || abi.decode(ret, (bool))))) {
            revert SafeERC20FailedOperation(token);
        }
    }

    /// @dev Distributes USDT: partner overhead percentage, 20% of remaining to treasury, rest to seller.
    function _distribute(uint256 amount, uint256 overheadPct, address partner, address seller) private {
        uint256 feeBase = overheadPct + 100;
        uint256 partnerCut = (amount * overheadPct) / feeBase;
        uint256 remaining = amount - partnerCut;

        uint256 treasuryCut = (remaining * 20) / 120; // 20% of (remaining / 1.2)
        uint256 sellerAmount = remaining - treasuryCut;

        if (partnerCut > 0) _safeTransfer(USDT, partner, partnerCut);
        if (treasuryCut > 0) _safeTransfer(USDT, TREASURY, treasuryCut);
        if (sellerAmount > 0) _safeTransfer(USDT, seller, sellerAmount);
    }

    function _revertWith(bytes memory ret) private pure {
        if (ret.length == 0) revert TransferFailed();
        assembly {
            revert(add(ret, 32), mload(ret))
        }
    }

    // --- Receive ---
    receive() external payable {}
}

// Minimal interface for UUPS check
interface IProxiable {
    function proxiableUUID() external view returns (bytes32);
}
