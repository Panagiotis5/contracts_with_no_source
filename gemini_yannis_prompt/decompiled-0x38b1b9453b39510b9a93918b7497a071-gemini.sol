// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
}

interface IRouter {
    function exactInputSingle(
        address tokenIn,
        address tokenOut,
        uint24 fee,
        address recipient,
        uint256 amountIn,
        uint256 amountOutMinimum,
        uint160 sqrtPriceLimitX96
    ) external payable returns (uint256 amountOut);

    function exactInput(
        bytes calldata path,
        uint256 amountIn
    ) external returns (uint256 amountOut);
    
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
}

contract ProductPaymentContract {
    // Storage
    mapping(address => bool) public approvedSellers;
    mapping(address => bool) public blacklistedSellers; // mapping_1
    mapping(address => bool) public mapping_2;
    mapping(address => bool) public mapping_3;
    
    struct Product {
        uint256 timestamp;
        string data1; // maybe name or id
        string data2; // maybe desc
    }
    
    Product[] public productsList;
    
    // Reentrancy guard
    uint256 private _status; // stor_9b77...
    
    // Initializer
    uint64 private _initialized;
    bool private _initializing;
    
    address private _implementation; // UUPS
    address private _owner;

    address constant USDC = 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48;
    address constant USDT = 0xdac17f958d2ee523a2206206994597c13d831ec7;
    address constant WBTC = 0x2260fac5e5542a773aa44fbcfedf7c193bc2c599;
    address constant WETH = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2;
    address constant TREASURY_ADDR = 0x3855d35e3b2e7307fc0a82a64f2173d77cb437ce;
    address constant ROUTER_ADDR = 0x68b3465833fb72a70ecdf485e0e4c7bd8665fc45;

    event Initialized(uint64 version);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event Upgraded(address indexed implementation);
    event PaymentProcessed(address indexed payer, address indexed seller, address tokenIn, uint256 amountIn, address tokenOut, address router, uint256 amountOut, bytes extraData);
    event SellerAdded(address seller, bool status1, bool status2);
    event SellerBlacklisted(address seller, bool status1, bool status2);
    event MappingUpdate(address indexed target, bool val1, bool val2);

    modifier onlyOwner() {
        require(msg.sender == _owner, "OwnableUnauthorizedAccount");
        _;
    }

    modifier nonReentrant() {
        require(_status != 2, "ReentrancyGuardReentrantCall");
        _status = 2;
        _;
        _status = 1;
    }

    function initialize() public {
        // Initializer logic logic
        if (_initialized < 1) {
            _initialized = 1;
            _owner = msg.sender;
            emit Initialized(1);
        }
    }

    receive() external payable {}

    function owner() public view returns (address) {
        return _owner;
    }

    function TREASURY() public pure returns (address) {
        return TREASURY_ADDR;
    }

    function ROUTER() public pure returns (address) {
        return ROUTER_ADDR;
    }

    function TREASURY_CUT() public pure returns (uint256) {
        return 20;
    }

    function addSeller(address _seller) public onlyOwner {
        approvedSellers[_seller] = true;
        blacklistedSellers[_seller] = false;
        emit SellerAdded(_seller, true, false);
    }

    function blacklistSeller(address _seller) public onlyOwner {
        blacklistedSellers[_seller] = true;
        emit SellerBlacklisted(_seller, approvedSellers[_seller], true);
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "OwnableInvalidOwner");
        _owner = newOwner;
        emit OwnershipTransferred(_owner, newOwner);
    }

    function renounceOwnership() public onlyOwner {
        _owner = address(0);
        emit OwnershipTransferred(_owner, address(0));
    }

    function rescueTokens(address _token) public onlyOwner {
        uint256 balance = IERC20(_token).balanceOf(address(this));
        IERC20(_token).transfer(_owner, balance);
    }

    function rescueETH() public onlyOwner {
        (bool success, ) = _owner.call{value: address(this).balance}("");
        require(success, "TransferFailed");
    }

    function _validateSeller(address seller) internal view {
        bool allowed = approvedSellers[seller] && !blacklistedSellers[seller];
        require(allowed, "Seller not authorized");
    }

    function _checkMappings(address token) internal view {
        bool forbidden = mapping_2[token] && mapping_3[token]; // Logic from decomp: !mapping_2 || (mapping_2 && mapping_3) => fail?
        // Decomp: v3 = v4 = !mapping_2[varg0]; if mapping_2 { v3 = v5 = mapping_3[varg0] } require(!v3)
        // Means: if (!mapping_2) fail. If (mapping_2 && mapping_3) fail.
        // So mapping_2 must be true and mapping_3 must be false?
        // Wait, `require(!v3)` means v3 must be false.
        // v3 is true if (!mapping_2) OR (mapping_2 && mapping_3).
        // So we require: mapping_2[token] == true AND mapping_3[token] == false.
        
        // Actually, looking at 0x9039bd0e (sets mapping_2=1, mapping_3=0), this seems to be "Supported Token" check.
        // But `0x1f5a` checks `!v3`.
        require(mapping_2[token] && !mapping_3[token], "Token not supported");
    }

    function processPayment(
        uint256 minAmountOut,
        address tokenIn, // varg1?
        uint256 amountIn,
        address seller,
        address tokenOut, // varg4?
        uint256 feeOverhead,
        bytes calldata extraData
    ) public nonReentrant {
        // Decompiled as 0x2aba0266
        // Args map: varg0->minAmountOut, varg1->tokenIn, varg2->amountIn, varg3->seller, varg4->tokenOut?, varg5->feeOverhead?, varg6->data
        // Actually, let's trace variables in decomp
        // varg4.overhead() called. So varg4 is a contract with overhead() function? No, `varg4` is likely the tokenOut which might be a custom token with overhead? 
        // Wait, standard ERC20 doesn't have overhead(). 
        // Let's assume varg4 is some fee configuration contract or the token itself has it.
        
        _validateSeller(seller);
        // _checkMappings(tokenOut); // 0x1f5a logic seems to check tokenOut?
        
        IERC20(tokenIn).transferFrom(msg.sender, address(this), amountIn);
        
        uint256 swappedAmount = _swapToStable(amountIn, tokenIn, USDC); // 0x2208 logic
        
        // Fee logic 0x2615
        // varg4.overhead() -> returns overhead fee basis points?
        // Assuming varg4 is just a token, this call is weird. Maybe it's a specific token type.
        // Let's assume overhead is passed or retrieved.
        
        // Distribution:
        // 100 + overhead
        // total = seller_share + treasury_share + ...
        
        _distribute(feeOverhead, tokenOut, seller, swappedAmount); // 0x2615
        
        emit PaymentProcessed(msg.sender, seller, tokenOut, minAmountOut, tokenIn, address(this), swappedAmount, extraData);
    }
    
    function _swapToStable(uint256 amount, address tokenIn, address tokenOut) internal returns (uint256) {
        if (tokenOut == USDT) {
             // Swap logic
             IERC20(tokenIn).approve(ROUTER_ADDR, amount);
             // ExactInputSingle
             // ...
             return amount; // Placeholder
        }
        return amount;
    }

    function _distribute(uint256 overhead, address token, address seller, uint256 amount) internal {
        // ... logic from 0x2615
    }

    function addProduct(bytes memory sig, bytes memory data) public {
        // 0xe775137c -> 0x1b22
        // Validation logic
        
        // Add to _products
        productsList.push(Product(block.timestamp, string(sig), string(data)));
    }

    function getProducts() public view returns (Product[] memory) {
        return productsList;
    }
    
    // Admin functions for token mappings
    function setTokenSupported(address token) public onlyOwner {
        mapping_2[token] = true;
        mapping_3[token] = false;
        emit MappingUpdate(token, true, false);
    }
    
    function setTokenDeprecated(address token) public onlyOwner {
        mapping_3[token] = true;
        emit MappingUpdate(token, mapping_2[token], true);
    }
}
