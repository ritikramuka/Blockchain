// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract fixesizeArray{
        uint[5] public arr=[10,20,30,40,50];


        function Array() public view returns(uint){

            //get value of particular index
            // uint temp;
            // temp=arr[3];

            //update value

            // arr[2]=2000;
            // uint temp2=arr[2];

            //delete index value

            // delete arr[4];

            //length of array

            uint len=arr.length;

            return len;

        }
        
}