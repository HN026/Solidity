// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.7;

// Basically, one way to deploy two contracts through a single contract will be to copy all the code
// of simpleStorage and paste it here and then, here we will have two contracts and before deploying, 
// the EVM will ask us which contract to deploy

// ********Way:1*******

// contract SimpleStorage{
// uint256 public favoriteNumber; // Default initialisation in integers is 0.

// function store(uint256 _favoriteNumber) public{
//     favoriteNumber = _favoriteNumber;
//     favoriteNumber = favoriteNumber + 1234;
// }

// function retrieve() public view returns(uint256)
// {
//     return favoriteNumber;
// }

// // function retrieve() public pure returns(uint256)
// // {
// //     return favoriteNumber;
// // }

// // ****Structure*****

// struct People {
//     uint256 favoriteNumber_;
//     string name;
// }

// // People public person = People({favoriteNumber_: 2, name: 'Huzaifa'});
// // People public person2 = People({favoriteNumber_: 22, name: 'Huzaifa2'});

// // Storing the data of different like this would be a very difficult and hectic way and not clean code, hence we introduce a datastructure called array


// // ******Array********

// // declaring an array
//     //  uint256[] public favoriteNumber;   // Declaring a unit as an array
//      People[] public people;   // Declaring a structure as an array....

//     // This is a dynamically declared array, we can also have an array which is declared in a static way like we usually do in other languages.



//     // function addPerson(string memory _name, uint256 _favoriteNumber) public{
      
//     // Way-1
//     // people.push(People(_favoriteNumber, _name));

//     // Way-2
//     // People memory newPerson = People({favoriteNumber_: _favoriteNumber, name: _name});
//     // people.push(newPerson);

//     // Way-3
//     // People memory newPerson = People(_favoriteNumber, _name);
//     // people.push(newPerson);


//     // }

//     // *******Mapping*********

//     mapping(string => uint256) public nameToFavoriteNumber;

//     function addPerson( string memory _name, uint256 _favoriteNumber) public{
//         people.push(People(_favoriteNumber, _name));
//         nameToFavoriteNumber[_name] = _favoriteNumber;
//     }

//     // EVM - Ethureum Virtual machine
//     // Avalanche, polygon, and fantom are EVM compatible blockchains.


// }

// ******Way-2****** Will be importing the contract becuause it will always be hectic to copy paster

import "./SimpleStorage.sol";





contract StorageFactory{
   SimpleStorage[] public simpleStorageArray;


   function createSimpleStorageContract() public{
    SimpleStorage simpleStorage = new SimpleStorage();
    simpleStorageArray.push(simpleStorage);
   }

//    *****Interacting with other smart contracts*******

function sfstore( uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public{
    // To interact with other smart contracts, we are always going to need 
    // 1. Address of the contract
    // 2. ABI of the contract - Application Binary Interface

    // SimpleStorage simpleStorage = SimpleStorage(simpleStorageArray[_simpleStorageIndex]);
    // or




    // SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
    // simpleStorage.store(_simpleStorageNumber);


    //  ****Simplified code******

    simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);

}

// function sfGet ( uint256 _simpleStorageIndex) public view returns (uint256){
//     SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
//     return simpleStorage.retrieve();

// ***or we can minimize the code*****


function sfGet ( uint256 _simpleStorageIndex) public view returns (uint256){
    return simpleStorageArray[_simpleStorageIndex].retrieve();
    



}



}
