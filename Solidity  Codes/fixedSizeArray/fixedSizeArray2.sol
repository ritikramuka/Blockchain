// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract fixesizeArray{
        uint[5] public arr;


        function arraywithLoop(uint _x) public {
                for(uint i=0;i<arr.length;i++){
                    arr[i]=_x+i;
                }
            
        }
        
}