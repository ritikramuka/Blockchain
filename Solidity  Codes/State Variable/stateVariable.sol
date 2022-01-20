//Solidity program to demonstrate state variables

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract statevariable{
    // Declaring a state variable
    uint public salary = 100;

    // Defining a constructor
    constructor(){
        salary = 1000;

    }
    function setSalary() public{
        salary = 2000;  
    }
    
}