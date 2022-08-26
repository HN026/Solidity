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
import "./PriceConverter.sol";

contract FundMe{

    using PriceConverter for uint256;

    uint256 public minimumUsd = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;


     function fund() public payable {
         // We want to be able to set a minimum fund amount in USD
        //  1. How do we send eth to this contract??
        // The payable keyword makes the function payable.
        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send enough funds");    //1e18 = 1*10**18  The value of minimum fund is 1eth
        // Above, msg.value get considered to be the first parameter hence we don't need to put the value in brackets

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
     }




     function Withdraw() public{
         for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++)
         {
             address funder = funders[funderIndex];
             addressToAmountFunded[funder] = 0;
         }


     // Resetting an Array: 
     funders = new address[](0):
     // The line above means a brand new array of addresses with zero elements in it to
     // begin with.

     
      // Withdrawing the funds from this contract, i.e sending eth from this contract.

      // There are three different ways: 
    // 1. transfer
    // 2. Send 
    // 3. call

     
    //  msg.sender = address 
    // payable(msg.sender) = payable address
    // In solidity, to send a native blockchain token like ethureum, we need to work with
    // payable addresses

    // Here the this keyword means the whole contract.
    // Method-1: Transfer

    payable(msg.sender).transfer(address(this).balance);

    // Method-2 Send

    bool sendSuccess = payable(msg.sender).send(address(this).balance);
    require(sendSuccess, "Send failed");

    // Method-3 Call

    // 4:45


     }
