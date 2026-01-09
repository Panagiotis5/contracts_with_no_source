// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/ReentrancyGuardUpgradeable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

interface IUniswapRouter {
    struct ExactInputSingleParams {
        address tokenIn;
        address tokenOut;
        uint24 fee;
        address recipient;
        uint256 amountIn;
        uint256 amountOutMinimum;
        uint160 sqrtPriceLimitX96;
    }
    
    struct ExactInputParams {
        bytes path;
        address recipient;
        uint256 amountIn;
        uint256 amountOutMinimum;
    }
    
    function exactInputSingle(ExactInputSingleParams calldata params) external payable returns (uint256 amountOut);
    function exactInput(ExactInputParams calldata params) external payable returns (uint256 amountOut);
}

interface IEscrowContract {
    function overhead() external view returns (uint256);
}

contract P2PMarketplace is 
    Initializable,
    UUPSUpgradeable,
    OwnableUpgradeable,
    ReentrancyGuardUpgradeable 
{
    using SafeERC20 for IERC20;
    
    // Constants
    address public constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address public constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address public constant USDT = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
    address public constant WBTC = 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599;
    address public constant ROUTER = 0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45;
    address public constant TREASURY = 0x3855D35E3B2E7307fc0A82a64F2173d77CB437ce;
    uint256 public constant TREASURY_CUT = 20; // 20%
    
    // Storage
    mapping(address => bool) public approvedSellers;
    mapping(address => bool) private sellerBlacklist; // mapping_1
    mapping(address => bool) private tokenWhitelist; // mapping_2
    mapping(address => bool) private tokenBlacklist; // mapping_3
    
    struct Product {
        uint256 timestamp;
        bytes publicKey;
        bytes productData;
    }
    
    Product[] private _products;
    
    // Events
    event SellerStatusChanged(address indexed seller, bool approved, bool blacklisted);
    event TokenStatusChanged(address indexed token, bool whitelisted, bool blacklisted);
    event TradeExecuted(
        address indexed buyer,
        address indexed seller,
        address indexed escrow,
        uint256 productId,
        address tokenIn,
        uint256 amountIn,
        uint256 usdtOut,
        bytes data
    );
    
    // Errors
    error InvalidPubKey();
    error NoETHSent();
    error UnsupportedToken();
    error InsufficientOutput();
    error TransferFailed();
    error UnauthorizedSeller();
    error BlacklistedToken();
    
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }
    
    function initialize() public initializer {
        __Ownable_init(msg.sender);
        __UUPSUpgradeable_init();
        __ReentrancyGuard_init();
    }
    
    receive() external payable {}
    
    // Owner functions
    function addSeller(address _seller) external onlyOwner {
        approvedSellers[_seller] = true;
        sellerBlacklist[_seller] = false;
        emit SellerStatusChanged(_seller, true, false);
    }
    
    function blacklistSeller(address _seller) external onlyOwner {
        sellerBlacklist[_seller] = true;
        emit SellerStatusChanged(_seller, approvedSellers[_seller], true);
    }
    
    function whitelistToken(address _token) external onlyOwner {
        tokenWhitelist[_token] = true;
        tokenBlacklist[_token] = false;
        emit TokenStatusChanged(_token, true, false);
    }
    
    function blacklistToken(address _token) external onlyOwner {
        tokenBlacklist[_token] = true;
        emit TokenStatusChanged(_token, tokenWhitelist[_token], true);
    }
    
    function rescueETH() external onlyOwner {
        (bool success, ) = owner().call{value: address(this).balance}("");
        if (!success) revert TransferFailed();
    }
    
    function rescueTokens(address _token) external onlyOwner {
        uint256 balance = IERC20(_token).balanceOf(address(this));
        IERC20(_token).safeTransfer(owner(), balance);
    }
    
    // View functions
    function products(uint256 index) external view returns (
        uint256 timestamp,
        bytes memory publicKey,
        bytes memory productData
    ) {
        require(index < _products.length, "Index out of bounds");
        Product memory p = _products[index];
        return (p.timestamp, p.publicKey, p.productData);
    }
    
    function getProducts() external view returns (
        address[] memory sellers,
        bytes[] memory publicKeys,
        bytes[] memory productDatas,
        uint256[] memory timestamps
    ) {
        uint256 count = 0;
        
        // Count non-blacklisted products
        for (uint256 i = 0; i < _products.length; i++) {
            address seller = _deriveSellerAddress(_products[i].publicKey);
            if (!sellerBlacklist[seller]) {
                count++;
            }
        }
        
        // Allocate arrays
        sellers = new address[](count);
        publicKeys = new bytes[](count);
        productDatas = new bytes[](count);
        timestamps = new uint256[](count);
        
        // Fill arrays
        uint256 index = 0;
        for (uint256 i = 0; i < _products.length; i++) {
            address seller = _deriveSellerAddress(_products[i].publicKey);
            if (!sellerBlacklist[seller]) {
                sellers[index] = seller;
                publicKeys[index] = _products[i].publicKey;
                productDatas[index] = _products[i].productData;
                timestamps[index] = _products[i].timestamp;
                index++;
            }
        }
        
        return (sellers, publicKeys, productDatas, timestamps);
    }
    
    // Product listing
    function listProduct(bytes calldata productData, bytes calldata publicKey) external {
        _validatePublicKey(publicKey);
        
        address seller = _deriveSellerAddress(publicKey);
        if (approvedSellers[seller] && sellerBlacklist[seller]) {
            revert UnauthorizedSeller();
        }
        
        if (approvedSellers[seller] || !sellerBlacklist[seller]) {
            _products.push(Product({
                timestamp: block.timestamp,
                publicKey: publicKey,
                productData: productData
            }));
        } else {
            revert UnauthorizedSeller();
        }
    }
    
    // Trading functions
    function buyWithETH(
        uint256 productId,
        address seller,
        address escrow,
        uint256 minUSDT,
        bytes calldata data
    ) external payable nonReentrant {
        if (msg.value == 0) revert NoETHSent();
        
        _validateTrade(escrow, seller);
        
        // Swap ETH to USDT via Uniswap
        IUniswapRouter.ExactInputSingleParams memory params = IUniswapRouter.ExactInputSingleParams({
            tokenIn: WETH,
            tokenOut: USDT,
            fee: 3000,
            recipient: address(this),
            amountIn: msg.value,
            amountOutMinimum: minUSDT,
            sqrtPriceLimitX96: 0
        });
        
        uint256 usdtAmount = IUniswapRouter(ROUTER).exactInputSingle{value: msg.value}(params);
        
        uint256 overhead = IEscrowContract(escrow).overhead();
        _distributeFunds(overhead, escrow, seller, usdtAmount);
        
        emit TradeExecuted(msg.sender, seller, escrow, productId, address(0), msg.value, usdtAmount, data);
    }
    
    function buyWithToken(
        uint256 productId,
        address tokenIn,
        uint256 amountIn,
        address seller,
        address escrow,
        uint256 minUSDT,
        bytes calldata data
    ) external nonReentrant {
        _validateTrade(escrow, seller);
        
        // Transfer tokens from user
        IERC20(tokenIn).safeTransferFrom(msg.sender, address(this), amountIn);
        
        // Swap to USDT
        uint256 usdtAmount = _swapToUSDT(tokenIn, amountIn, minUSDT);
        
        uint256 overhead = IEscrowContract(escrow).overhead();
        _distributeFunds(overhead, escrow, seller, usdtAmount);
        
        emit TradeExecuted(msg.sender, seller, escrow, productId, tokenIn, amountIn, usdtAmount, data);
    }
    
    function executeCustomCall(
        address target,
        address token,
        bytes calldata callData
    ) external {
        if (approvedSellers[msg.sender] && sellerBlacklist[msg.sender]) {
            revert UnauthorizedSeller();
        }
        
        if (tokenWhitelist[token] && tokenBlacklist[token]) {
            revert BlacklistedToken();
        }
        
        require(IERC20(token).balanceOf(target) > 0, "No balance");
        
        (bool success, ) = target.call(callData);
        if (!success) revert TransferFailed();
    }
    
    // Internal functions
    function _validatePublicKey(bytes calldata pubKey) internal pure {
        if (pubKey.length != 65) revert InvalidPubKey();
        if (pubKey[0] != 0x04) revert InvalidPubKey();
    }
    
    function _deriveSellerAddress(bytes memory pubKey) internal pure returns (address) {
        bytes memory pubKeySlice = new bytes(64);
        for (uint256 i = 0; i < 64; i++) {
            pubKeySlice[i] = pubKey[i + 1];
        }
        return address(uint160(uint256(keccak256(pubKeySlice))));
    }
    
    function _validateTrade(address escrow, address seller) internal view {
        if (approvedSellers[seller] && sellerBlacklist[seller]) {
            revert UnauthorizedSeller();
        }
        
        if (tokenWhitelist[escrow] && tokenBlacklist[escrow]) {
            revert BlacklistedToken();
        }
    }
    
    function _swapToUSDT(
        address tokenIn,
        uint256 amountIn,
        uint256 minUSDT
    ) internal returns (uint256) {
        if (tokenIn == USDT) {
            if (amountIn < minUSDT) revert InsufficientOutput();
            return amountIn;
        }
        
        // Approve router
        _safeApprove(tokenIn, ROUTER, amountIn);
        
        if (tokenIn == USDC) {
            IUniswapRouter.ExactInputSingleParams memory params = IUniswapRouter.ExactInputSingleParams({
                tokenIn: USDC,
                tokenOut: USDT,
                fee: 100,
                recipient: address(this),
                amountIn: amountIn,
                amountOutMinimum: minUSDT,
                sqrtPriceLimitX96: 0
            });
            return IUniswapRouter(ROUTER).exactInputSingle(params);
        } else if (tokenIn == WBTC) {
            // WBTC -> WETH -> USDT path
            bytes memory path = abi.encodePacked(
                WBTC,
                uint24(3000),
                WETH,
                uint24(3000),
                USDT
            );
            
            IUniswapRouter.ExactInputParams memory params = IUniswapRouter.ExactInputParams({
                path: path,
                recipient: address(this),
                amountIn: amountIn,
                amountOutMinimum: minUSDT
            });
            
            return IUniswapRouter(ROUTER).exactInput(params);
        } else {
            revert UnsupportedToken();
        }
    }
    
    function _distributeFunds(
        uint256 overhead,
        address escrow,
        address seller,
        uint256 totalAmount
    ) internal {
        // Calculate escrow fee
        uint256 escrowFee = (totalAmount * overhead) / (100 + overhead);
        uint256 remaining = totalAmount - escrowFee;
        
        // Calculate treasury cut
        uint256 treasuryCut = (remaining * TREASURY_CUT) / (100 + TREASURY_CUT);
        uint256 sellerAmount = remaining - treasuryCut;
        
        // Distribute
        if (escrowFee > 0) {
            IERC20(USDT).safeTransfer(escrow, escrowFee);
        }
        if (treasuryCut > 0) {
            IERC20(USDT).safeTransfer(TREASURY, treasuryCut);
        }
        if (sellerAmount > 0) {
            IERC20(USDT).safeTransfer(seller, sellerAmount);
        }
    }
    
    function _safeApprove(address token, address spender, uint256 amount) internal {
        uint256 currentAllowance = IERC20(token).allowance(address(this), spender);
        
        if (currentAllowance > 0) {
            IERC20(token).safeApprove(spender, 0);
        }
        
        IERC20(token).safeApprove(spender, amount);
    }
    
    // UUPS upgrade authorization
    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}