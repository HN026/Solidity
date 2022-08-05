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

// ****Structure*****

struct People {
    uint256 favoriteNumber_;
    string name;
}

// People public person = People({favoriteNumber_: 2, name: 'Huzaifa'});
// People public person2 = People({favoriteNumber_: 22, name: 'Huzaifa2'});

// Storing the data of different like this would be a very difficult and hectic way and not clean code, hence we introduce a datastructure called array


// ******Array********

// declaring an array
    //  uint256[] public favoriteNumber;   // Declaring a unit as an array
     People[] public people;   // Declaring a structure as an array....

    // This is a dynamically declared array, we can also have an array which is declared in a static way like we usually do in other languages.



    // function addPerson(string memory _name, uint256 _favoriteNumber) public{
      
    // Way-1
    // people.push(People(_favoriteNumber, _name));

    // Way-2
    // People memory newPerson = People({favoriteNumber_: _favoriteNumber, name: _name});
    // people.push(newPerson);

    // Way-3
    // People memory newPerson = People(_favoriteNumber, _name);
    // people.push(newPerson);


    // }

    // *******Mapping*********

    mapping(string => uint256) public nameToFavoriteNumber;

    function addPerson( string memory _name, uint256 _favoriteNumber) public{
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }


}

//  0xd9145CCE52D386f254917e481eB44e9943F39138

















