// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract fixesizeArray{
        uint[5] public arr;


        function createArray() public pure returns(uint) {
                uint[] memory arrMem =new uint[](3);
                arrMem[1]=33;

                return arrMem[1];
        }
        
}