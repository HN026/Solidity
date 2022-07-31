// SPDX-License-Identifier: MIT
pragma solidity 0.8.7; // Specifying the version which we are going to use
//  pragma solidity ^0.8.7 // This here means that any version of solidity that is greater or equal to 0.8.7, we are comfortable with working on it.

contract SimpleStorage{
uint256 public favoriteNumber; // Default initialisation in integers is 0.

function store(uint256 _favoriteNumber) public{
    favoriteNumber = _favoriteNumber;
    favoriteNumber = favoriteNumber + 1234;
}

function retrieve() public view returns(uint256)
{
    return favoriteNumber;
}

// function retrieve() public pure returns(uint256)
// {
//     return favoriteNumber;
// }



}

//  0xd9145CCE52D386f254917e481eB44e9943F39138
















