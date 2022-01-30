//SPDX-License-Identifier: MIT

pragma solidity >0.8.0;

contract ZombieFactory {

/**/
Events are a way for your contract to communicate that something happened on the blockchain to your app 
front-end, which can be 'listening' for certain events and take action when they happen.
/**/

event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10**dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

/**/ 
Array with a fixed length of 2 elements:
uint[2] fixedArray;
another fixed Array, can contain 5 strings:
string[5] stringArray;

// a dynamic Array - has no fixed size, can keep growing:
        uint[] dynamicArray;   

        You can also create an array of structs. Using the previous chapter's Person struct:
        for eg.
        struct Person {
            uint age;
            string name;
        }
        Person[] people;  -- this is an array of persons named people. It is a dynamic array. You can keep adding
                                persons to the 'people' struct
/**/ 

    Zombie[] public zombies;

//For Functions, we're also providing instructions about where the _name variable should be stored- in memory. 

//This is required for all reference types such as arrays, structs, mappings, and strings. 
   
/**/   There are 2 ways in which you can pass argument in a function. By value, and by reference.
   by value - original value does not get changed
   by reference - original value gets changed.
/**/

    function _createZombie (string memory _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        emit NewZombie(id, _name, _dna);
    }

//In Solidity, functions are public by default. Better to make all private and then set up public when needed
//And as with function parameters, it's convention to start private function names with an underscore (_).

/**/ 
Also important, keccak256 expects a single parameter of type bytes. 
This means that we have to "pack" any parameters before calling keccak256
/**/

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }



}
