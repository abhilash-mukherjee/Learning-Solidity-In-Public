//SPDX-License-Identifier: MIT
pragma solidity 0.8.8;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    int public favNumber ;
    int public latestPriceOfBTCinETH;
    address public feedAddress = 0xF7904a295A029a3aBDFFB6F12755974a958C7C25;
    AggregatorV3Interface internal priceFeed;
      function fund () public payable{
        favNumber = 5;
        require(msg.value >= 1, "not enough fund");
        latestPriceOfBTCinETH = getLatestPrice();
    }
    
    
    constructor() {
        priceFeed = AggregatorV3Interface(feedAddress);
    }
  
    function getLatestPrice() public view returns (int) {
        (
            /*uint80 roundID*/,
            int price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();
        return price;
    }
}

//1btc = 18.964140602914910000 eth

