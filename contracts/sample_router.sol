pragma solidity ^0.8.14;


contract TestRouter {
  

  // Initialize the contract with the Uniswap v3 router address
  constructor() public {
  }

  address internal middleToken = address(0x0);

  // Get the route for a given pair of tokens
  function getPath(address _fromToken, address _toToken) public view returns (address[] memory) {
    // Create an empty array to store the route
    address[] memory route = new address[](3);
    route[0]=_fromToken;
    route[1] = middleToken;
    route[2] = _toToken;

    // Return the `route` array
    return route;
  }

  // Swap one token for another using the Uniswap v3 router
  function swapTokenForToken(
    address _fromToken,
    address _toToken,
    uint256 _amountIn,
    address _to,
    uint256 _maxSlippage
  ) public returns (uint256) {
    // Call the swapExactTokensForTokens function on the Uniswap v3 router and return the amount of tokens received
    return _amountIn;
  }
}
