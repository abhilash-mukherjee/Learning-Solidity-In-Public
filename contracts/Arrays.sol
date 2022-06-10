//SPDX-License-Identifier: MIT
pragma solidity 0.8.8;
contract Arrays{
    struct People{
        uint256 favouriteNumber;
        string name;
    }
    People[] public people;
    mapping(string=>uint256) public nameToFavouriteNumber;
    function AddPerson(string memory _name, uint256 _favouriteNumber) public{
        People memory _person = People(_favouriteNumber,_name);
        people.push(_person);
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
    
}