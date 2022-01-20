// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract dynamicsizedArray{
        uint[] public arr=[10,20,30,40,50,60,70,80];
    
    function returnArray() public view returns(uint[] memory){
        return arr;
    }
}