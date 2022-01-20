//Solidity program to demonstrate string

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract String{

    string public str = "Krishna"; //State Variable

    function checkString(string memory  _str1) public pure returns(string memory){
        string memory name = _str1 ;

        return name;
    }
}