//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConvertor{


    function getPrice() internal view returns(uint256){

        // address 0x694AA1769357215DE4FAC081bf1f309aDC325306  
        //sepolia testnet eth/usd
        //ABI    

        AggregatorV3Interface priceFeed=AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);   
        (,int256 price,,,)=priceFeed.latestRoundData();

        return uint256(price *1e10);
        //price of eth in terms of usd
    }

    function getVersion() internal view returns (uint256){
        AggregatorV3Interface priceFeed=AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice=getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/1e18;  // dividing bu 10^18 otherwise it will have 
                                                                //extra 18 zeros in the end
        return ethAmountInUsd;
    }
}