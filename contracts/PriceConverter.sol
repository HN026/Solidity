// SPDX-Licennse-Identifier: MIT


pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

Library PriceConverter{

          function getPrice() internal view returns (uint256){
          // Since this is an instance of us interacting with a contract outside of our project
          // hence we will be needing two things: 
          // 1. ABI 
          // 2. ADDRESS OF THE CONTRACT - 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
           AggregatorV3Interface priceFeed = AggregatorV3Interface( 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
           (,int256 price,,,) = priceFeed.latestRoundData();
           // This is going to be price of eth in terms of USD
           // We multiplied by 1e10 because we wanted the price to have in total of 18 decimal places.
           // Solidity doesnt work with decimals hence we are using wei therefore we will need to multiply 
           // the esegements to ease the calculations..

           return uint256(price * 1e10); // 1**10 = 10000000000






      }




        function getVersion() internal view returns (uint256) {
            AggregatorV3Interface priceFeed = AggregatorV3Interface( 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
            return priceFeed.version();
        }




      function getConversionRate(uint256 ethAmount) internal view returns (uint256){
          uint256 ethPrice = getPrice();
          uint256 ethAmountInUsd = (ethPrice * ethAmount)/1e18;
          return ethAmountInUsd;

      }

}
