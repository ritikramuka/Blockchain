//Solidity program to demonstrate local variables
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract localvariable{
    uint public age; //State variable
    bool public b;
    address public newAdd;



   // Defining function to show the declaration and
   // scope of local variables
    function fun(uint _x , bool _y , address _z) public returns(uint , bool){
        
        // Initializing local variables
        uint i = 29; 
        bool b1 = true;

        i+=29;
        b1 = false;

        age = _x;
        b = _y;
        newAdd = _z;

        // Access the local variable
        return (i , b1);
    } 
    
}