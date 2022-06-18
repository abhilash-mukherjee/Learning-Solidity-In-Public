//SPDX-License-Identifier: MIT
pragma solidity 0.8.8;
import "./PriceConverter.sol";
contract FundMe{
    using PriceConverter for uint256 ;
    int public favNumber ;
    uint256 public minimumUSDToSend = 1 * 1e18;
    function fund () public payable{
        require(msg.value.convertEthToDollars() >= minimumUSDToSend, "not enough fund");
    }
    
}