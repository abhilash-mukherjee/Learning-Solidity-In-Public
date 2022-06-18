//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
library PriceConverter{
    address public constant feedAddress = 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e;
    function convertEthToDollars(uint256 ethValue) public view returns (uint256){
        uint256 priceInUSD = uint256(getLatestPriceOfEthInUSD());
        return (priceInUSD * (10 ** (18 - getDecimalsInReturnedValueByThePriceFeed())) * ethValue) /1e18;
    }
  
    function getLatestPriceOfEthInUSD() public view returns (int256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(feedAddress);
        (,int256 price,,,) = priceFeed.latestRoundData();
        return price;
    }
    function getDecimalsInReturnedValueByThePriceFeed() public view returns (uint8){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(feedAddress);
        return priceFeed.decimals();
    }
}