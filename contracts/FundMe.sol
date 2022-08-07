// Purpose of this contract: 
// 1. Withdraw funds
// 2. Get funds from users
// 3. Set a minimum funding value in USD

// Notes: 
// What is reverting? 
// Undo any action before, and send the remaining gas back.



// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract FundMe{

    uint256 public minimumUsd = 50;


     function fund() public payable {
         // We want to be able to set a minimum fund amount in USD
        //  1. How do we send eth to this contract??
        // The payable keyword makes the function payable.
        require(msg.value >= minimumUsd, "Didn't send enough funds");    //1e18 = 1*10**18  The value of minimum fund is 1eth
     }


    //  function Withdraw(){}


}
