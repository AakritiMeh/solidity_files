//SPDX-License-Identifier:MIT

pragma solidity ^0.8.8;

contract simpleStorage{
    uint256 favNo;

    struct People{
        uint256 favNo;
        string name;
    }

    People[] public peeps;

    mapping(string=>uint256) public map;

    function store(uint _favNo) public virtual{
        //added virtual to make it overridable
        favNo=_favNo;
    }

    function get() public view returns(uint256){
        return favNo;
    }

    function addPerson(string memory _name,uint _favNo) public{
        peeps.push(People(_favNo,_name));
        map[_name]=_favNo;
    }
}