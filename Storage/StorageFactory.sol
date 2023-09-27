//SPDX-License-Identifier:MIT

pragma solidity ^0.8.8;

import "./simpleStorage.sol";

contract StorageFactory{

    simpleStorage[] public simpStArray;

    function createSimpleStorageContract() public{
        simpleStorage simpSt=new simpleStorage();
        simpStArray.push(simpSt);
    }

    function sfStore(uint _simpStorageIndex,uint _simpStorageNo) public{
        simpleStorage s =simpStArray[_simpStorageIndex];
        s.store (_simpStorageNo);
    }

    function sfGet(uint _simpStorageIndex) public view returns(uint256){
        return simpStArray[_simpStorageIndex].get();
    }
    
}