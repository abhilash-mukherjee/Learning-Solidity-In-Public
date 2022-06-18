//SPDX-License-Identifier: MIT
pragma solidity 0.8.8;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    int public favNumber ;
    uint256 public minimumUSDToSend = 1 * 1e18;
    address public feedAddress = 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e;
    AggregatorV3Interface internal priceFeed;
    function fund () public payable{
        require(convertEthToDollars(msg.value) >= minimumUSDToSend, "not enough fund");
    }
    
    constructor() {
        priceFeed = AggregatorV3Interface(feedAddress);
    }

    function convertEthToDollars(uint256 ethValue) public view returns (uint256){
        uint256 priceInUSD = uint256(getLatestPriceOfEthInUSD());
        return (priceInUSD * (10 ** (18 - getDecimalsInReturnedValueByThePriceFeed())) * ethValue) /1e18;
    }
  
    function getLatestPriceOfEthInUSD() public view returns (int256) {
        (,int256 price,,,) = priceFeed.latestRoundData();
        return price;
    }
    function getDecimalsInReturnedValueByThePriceFeed() public view returns (uint8){
        return priceFeed.decimals();
    }
}

//1095_25000000

