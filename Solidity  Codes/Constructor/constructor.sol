
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Constructor{
    uint public age;
    address public owner;
    string public name;
    constructor(uint _age,address _adr,string memory _name){
        age=_age;
        owner=_adr;
        name=_name;
    }
}