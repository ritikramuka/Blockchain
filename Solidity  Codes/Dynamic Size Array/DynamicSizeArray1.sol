// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract dynamicsizedArray{
        uint[] public arr=[10,20,30,40,50,60,70,80];
    
    function fun() public {
        //get
        uint temp=arr[3];

        //update
        arr[4]=21;

        //delete 
        delete arr[0];

        //length of array
        uint len=arr.length;

        //push new value;

        arr.push(100);

        //pop one value/delete last value
        arr.pop();
    }
}