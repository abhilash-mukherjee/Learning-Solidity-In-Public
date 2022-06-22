//SPDX-License-Identifier: MIT
pragma solidity 0.8.8;
import "./PriceConverter.sol";
contract FundMe{
    using PriceConverter for uint256 ;
    int public favNumber ;
    uint256 public MINIMUM_USD = 1 * 1e18;
    address[] public funders;
    address public i_owner;
    mapping(address=>uint256) public funderAddressToAmount;
    
    constructor(){
        i_owner = msg.sender;
    }

    function fund () public payable{
        require(msg.value.convertEthToDollars() >= MINIMUM_USD, "not enough fund");
        funders.push(msg.sender);
        funderAddressToAmount[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner{
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            funderAddressToAmount[funder] = 0;
        }
        funders = new address[](0);
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess,"Call failed");
    }
    
    modifier onlyOwner(){
        require(msg.sender == i_owner, "Sender is not the owner");
        _;
    }
}

//Resources

//https://jeancvllr.medium.com/solidity-tutorial-all-about-libraries-762e5a3692f9