// Purpose of this contract: 
// 1. Withdraw funds
// 2. Get funds from users
// 3. Set a minimum funding value in USD

// Notes: 
// What is reverting? 
// Undo any action before, and send the remaining gas back.
// Smart contracts can hold funds just like wallets.
// 1e18 is 1eth or this much wei.
//  The require keyword is a checker
// When a function gets reverted, the remaining function gets undone and the remaining fund
// gets paid back but the gas does get spent in executing the function for the first time.
// Blockchains are deterministic systems so that they are able to reach consensus.

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{

    uint256 public minimumUsd = 50 * 1e18;

    address[] public payable;
    mapping(address => uint256) public addressToAmountFunded;


     function fund() public payable {
         // We want to be able to set a minimum fund amount in USD
        //  1. How do we send eth to this contract??
        // The payable keyword makes the function payable.
        require(getConversionRate(msg.value) >= minimumUsd, "Didn't send enough funds");    //1e18 = 1*10**18  The value of minimum fund is 1eth

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;



     }

      function getPrice() public view returns (uint256){
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




        function getVersion() public view returns (uint256) {
            AggregatorV3Interface priceFeed = AggregatorV3Interface( 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
            return priceFeed.version();
        }




      function getConversionRate(uint256 ethAmount) public view returns (uint256){
          uint256 ethPrice = getPrice();
          uint256 ethAmountInUsd = (ethPrice * ethAmount)/1e18;
          return ethAmountInUsd;

      }


    //  function Withdraw(){}




}
