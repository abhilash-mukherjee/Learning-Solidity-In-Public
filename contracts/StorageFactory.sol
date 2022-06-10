//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "./SimpleStorage.sol";
contract StorageFactory{
    SimpleStorage[] public simpleStorageAray;
    function createSimpleStorage() public{
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageAray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        simpleStorageAray[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageNumber) public view returns(uint256){
        return simpleStorageAray[_simpleStorageNumber].retrieve();
    }
    
}