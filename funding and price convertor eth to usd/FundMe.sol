//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "./PriceConvertor.sol";

contract FundMe{
    using PriceConvertor for uint256;

    uint256 public minAmt=50 * 1e18;
    address[] public funders;
    mapping(address => uint256) public addToAmtFunded;

    function fund() public payable{
        
        require(msg.value.getConversionRate()>=minAmt,"not enough");
        funders.push(msg.sender);
        addToAmtFunded[msg.sender] = msg.value;
    }




}