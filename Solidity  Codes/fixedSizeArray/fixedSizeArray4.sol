// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract fixesizeArray{
        uint[5]  arr;
        constructor(){
            arr=[10,20,30,40,50];
        }    

        function returnArray() public view returns (uint[5] memory){
            return arr;
        }
}