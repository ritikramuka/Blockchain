// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract functionIntro{
    uint public  age = 20;

    function add(uint x , uint _y) public pure returns(uint){
        return x + _y;
    }

    function changeAge() public{
        age +=1;
    }

    function getage() public view returns(uint){
        return age;
    }

    function fun() internal{ 
      // code;
    }
}

function dummy(uint _x) pure returns(uint){
    return _x * 10;
}