// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract loops{

    function loop() public pure returns(uint) {
        uint count=0;

        uint j=0;
        do{
            count =count+5;

            j=j+2;
        }
        while(j<10);

        return count;
        
        
    }
}