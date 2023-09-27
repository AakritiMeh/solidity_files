//SPDX-License-Identifier:MIT

pragma solidity ^0.8.8;

import "./simpleStorage.sol";

contract ExtraStorage is simpleStorage{
    //overriding -- keywords used:virtual override

    function store(uint _favNo) public override{
        favNo=_favNo+5;
    }
}