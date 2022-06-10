//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
contract SimpleStorage{
    uint256 public favouriteNumber;
    struct People{
        string name;
        uint256 favouriteNumber;
    }
    mapping(string=>uint256) public nameToFavouriteNumber;
    People[] public people;

    function store(uint256 _favouriteNumber) public virtual{
        favouriteNumber = _favouriteNumber;
    }
    function retrieve() public view returns(uint256){
        return favouriteNumber;
    }
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        nameToFavouriteNumber[_name] = _favouriteNumber;
        people.push(People(_name,_favouriteNumber));
    }
}