// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract viewAndPureFunctiion{
    uint public age = 20;

    function viewfunc() public view returns(uint){
        return age;
    }

    function purefun1() public pure returns(uint){
        return 1;
    }

    function purefun2(uint _x) public pure returns(uint){
        return _x;
    }

    function simplefun() public{
        age = age + 10;
    }

}