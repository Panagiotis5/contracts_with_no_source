// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract Marketplace is Initializable, UUPSUpgradeable, OwnableUpgradeable, ReentrancyGuardUpgradeable {
    using SafeERC20 for IERC20;
    
    // Storage variables matching decompiled code
    mapping(address => bool) private _approvedSellers;
    mapping(address => bool) private _blacklistedSellers; // mapping_1
    mapping(address => bool) private _allowedTokens; // mapping_2
    mapping(address => bool) private _tokenBlacklist; // mapping_3
    
    struct Product {
        uint256 timestamp;
        string publicKey; // field1
        string data; // field2
    }
    Product[] private _products;
    
    // Constants
    address public constant TREASURY = 0x3855d35e3b2e7307fc0a82a64f2173d77cb437ce;
    address public constant ROUTER = 0x68b3465833fb72a70ecdf485e0e4c7bd8665fc45;
    address public constant USDT = 0xdac17f958d2ee523a2206206994597c13d831ec7;
    address public constant USDC = 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48;
    address public constant WBTC = 0x2260fac5e5542a773aa44fbcfedf7c193bc2c599;
    address public constant WETH = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2;
    uint256 public constant TREASURY_CUT = 20;
    
    // Custom errors
    error InvalidPubKey();
    error InvalidSeller();
    error InvalidToken();
    error InsufficientOutput();
    error UnsupportedToken();
    error NoETHSent();
    error TransferFailed();
    
    // Events
    event SellerUpdated(address indexed seller, bool approved, bool blacklisted);
    event TokenUpdated(address indexed token, bool allowed, bool blacklisted);
    event ProductAdded(uint256 indexed productId, address indexed seller, uint256 timestamp);
    event SwapExecuted(
        address indexed user,
        address indexed seller,
        address indexed token,
        uint256 productId,
        address inputToken,
        uint256 inputAmount,
        uint256 outputAmount,
        bytes data
    );
    
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }
    
    function initialize() public initializer {
        __Ownable_init(msg.sender);
        __ReentrancyGuard_init();
    }
    
    // Seller management
    function addSeller(address seller) external onlyOwner {
        _approvedSellers[seller] = true;
        _blacklistedSellers[seller] = false;
        emit SellerUpdated(seller, true, false);
    }
    
    function blacklistSeller(address seller) external onlyOwner {
        _blacklistedSellers[seller] = true;
        emit SellerUpdated(seller, _approvedSellers[seller], true);
    }
    
    function approvedSellers(address seller) external view returns (bool) {
        return _approvedSellers[seller];
    }
    
    // Token management
    function allowToken(address token) external onlyOwner {
        _allowedTokens[token] = true;
        _tokenBlacklist[token] = false;
        emit TokenUpdated(token, true, false);
    }
    
    function blacklistToken(address token) external onlyOwner {
        _tokenBlacklist[token] = true;
        emit TokenUpdated(token, _allowedTokens[token], true);
    }
    
    // Product management
    function addProduct(bytes memory publicKey, bytes memory productData) external {
        require(_approvedSellers[msg.sender] && !_blacklistedSellers[msg.sender], "Invalid seller");
        require(publicKey.length == 65 && publicKey[0] == 0x04, "Invalid public key");
        
        _products.push(Product({
            timestamp: block.timestamp,
            publicKey: string(publicKey),
            data: string(productData)
        }));
        
        emit ProductAdded(_products.length - 1, msg.sender, block.timestamp);
    }
    
    function products(uint256 index) external view returns (uint256 timestamp, string memory publicKey, string memory data) {
        require(index < _products.length, "Index out of bounds");
        Product memory product = _products[index];
        return (product.timestamp, product.publicKey, product.data);
    }
    
    function getProducts() external view returns (Product[] memory) {
        uint256 productCount = _products.length;
        Product[] memory filteredProducts = new Product[](productCount);
        uint256 count = 0;
        
        for (uint256 i = 0; i < productCount; i++) {
            // Filter out products from blacklisted sellers (derived from public key)
            // This matches the decompiled logic
            address seller = address(uint160(uint256(keccak256(bytes(_products[i].publicKey)))));
            if (!_blacklistedSellers[seller]) {
                filteredProducts[count] = _products[i];
                count++;
            }
        }
        
        // Resize array
        assembly {
            mstore(filteredProducts, count)
        }
        return filteredProducts;
    }
    
    // Swap functions
    function swapWithToken(
        uint256 productId,
        address token,
        uint256 amount,
        address seller,
        uint256 minOutput,
        bytes memory data
    ) external nonReentrant {
        // Validate seller
        require(_approvedSellers[seller] && !_blacklistedSellers[seller], "Invalid seller");
        require(!_blacklistedSellers[msg.sender], "Caller blacklisted");
        
        // Validate token
        require(_allowedTokens[token] && !_tokenBlacklist[token], "Invalid token");
        require(IERC20(token).balanceOf(msg.sender) >= amount, "Insufficient balance");
        
        // Transfer tokens
        IERC20(token).safeTransferFrom(msg.sender, address(this), amount);
        
        // Swap to USDT via Uniswap V3
        uint256 usdtAmount = _swapTokenToUSDT(token, amount, minOutput);
        
        // Distribute fees
        _distributeFees(seller, usdtAmount);
        
        emit SwapExecuted(msg.sender, seller, token, productId, token, amount, usdtAmount, data);
    }
    
    function swapWithETH(
        uint256 productId,
        address seller,
        uint256 minOutput,
        bytes memory data
    ) external payable nonReentrant {
        require(msg.value > 0, "No ETH sent");
        require(_approvedSellers[seller] && !_blacklistedSellers[seller], "Invalid seller");
        require(!_blacklistedSellers[msg.sender], "Caller blacklisted");
        
        // Swap ETH to USDT via Uniswap V3
        uint256 usdtAmount = _swapETHToUSDT(msg.value, minOutput);
        
        // Distribute fees
        _distributeFees(seller, usdtAmount);
        
        emit SwapExecuted(msg.sender, seller, address(0), productId, address(0), msg.value, usdtAmount, data);
    }
    
    // Internal swap logic
    function _swapTokenToUSDT(address token, uint256 amount, uint256 minOutput) internal returns (uint256) {
        if (token == USDT) {
            require(amount >= minOutput, "Insufficient output");
            return amount;
        }
        
        // Approve router
        IERC20(token).safeApprove(ROUTER, amount);
        
        if (token == USDC) {
            // Direct swap USDC->USDT with 0.01% fee
            ISwapRouter.ExactInputSingleParams memory params = ISwapRouter.ExactInputSingleParams({
                tokenIn: token,
                tokenOut: USDT,
                fee: 100,
                recipient: address(this),
                deadline: block.timestamp,
                amountIn: amount,
                amountOutMinimum: minOutput,
                sqrtPriceLimitX96: 0
            });
            return ISwapRouter(ROUTER).exactInputSingle(params);
        } else if (token == WBTC) {
            // Multi-hop swap: WBTC -> WETH -> USDT
            bytes memory path = abi.encodePacked(WBTC, uint24(3000), WETH, uint24(3000), USDT);
            ISwapRouter.ExactInputParams memory params = ISwapRouter.ExactInputParams({
                path: path,
                recipient: address(this),
                deadline: block.timestamp,
                amountIn: amount,
                amountOutMinimum: minOutput
            });
            return ISwapRouter(ROUTER).exactInput(params);
        } else {
            revert("Unsupported token");
        }
    }
    
    function _swapETHToUSDT(uint256 amount, uint256 minOutput) internal returns (uint256) {
        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter.ExactInputSingleParams({
            tokenIn: WETH,
            tokenOut: USDT,
            fee: 3000,
            recipient: address(this),
            deadline: block.timestamp,
            amountIn: amount,
            amountOutMinimum: minOutput,
            sqrtPriceLimitX96: 0
        });
        return ISwapRouter(ROUTER).exactInputSingle{value: amount}(params);
    }
    
    // Fee distribution (matching decompiled calculations)
    function _distributeFees(address seller, uint256 amount) internal {
        // Get seller's overhead percentage (simplified - actual logic may vary)
        uint256 overhead = 100; // Default 1%
        
        uint256 totalFee = 100 + overhead;
        uint256 contractShare = (amount * overhead) / totalFee;
        uint256 remaining = amount - contractShare;
        
        uint256 treasuryShare = (remaining * TREASURY_CUT) / (100 + TREASURY_CUT);
        uint256 sellerShare = remaining - treasuryShare;
        
        // Distribute
        if (contractShare > 0) {
            IERC20(USDT).safeTransfer(seller, contractShare);
        }
        if (treasuryShare > 0) {
            IERC20(USDT).safeTransfer(TREASURY, treasuryShare);
        }
        if (sellerShare > 0) {
            IERC20(USDT).safeTransfer(seller, sellerShare);
        }
    }
    
    // Rescue functions
    function rescueTokens(address token) external onlyOwner {
        uint256 balance = IERC20(token).balanceOf(address(this));
        IERC20(token).safeTransfer(owner(), balance);
    }
    
    function rescueETH() external onlyOwner {
        (bool success, ) = owner().call{value: address(this).balance}("");
        require(success, "Transfer failed");
    }
    
    // UUPS upgrade
    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
    
    // Interface for Uniswap V3 Router
    interface ISwapRouter {
        struct ExactInputSingleParams {
            address tokenIn;
            address tokenOut;
            uint24 fee;
            address recipient;
            uint256 deadline;
            uint256 amountIn;
            uint256 amountOutMinimum;
            uint160 sqrtPriceLimitX96;
        }
        
        struct ExactInputParams {
            bytes path;
            address recipient;
            uint256 deadline;
            uint256 amountIn;
            uint256 amountOutMinimum;
        }
        
        function exactInputSingle(ExactInputSingleParams calldata params) external payable returns (uint256 amountOut);
        function exactInput(ExactInputParams calldata params) external payable returns (uint256 amountOut);
    }
}