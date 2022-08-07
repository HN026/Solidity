// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


import "./SimpleStorage.sol";


contract ExtraStorage is SimpleStorage{
     // To override a function we can use two things: 
    //  1. override
    //  2. virtual override

    //  To make a function over-ridable, we need to specify a virtual keyword in parent function
    // and a virtual keyword in the daughter function


    function store ( uint256 _favoriteNumber) public override{
        favoriteNumber = _favoriteNumber + 5;
    }
}
