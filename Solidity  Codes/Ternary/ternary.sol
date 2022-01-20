// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract ter{

    function fun(uint _x) public pure returns(string memory){
        string memory val;
            val=_x>100?"greater":"smaller or equal";
        return val;
    }
}