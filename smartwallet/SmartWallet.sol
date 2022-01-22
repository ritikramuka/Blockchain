// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;
import "./Allowance.sol";

contract SimpleWallet is Allowance {
    fallback() external payable{
        emit MoneyReceived (msg.sender, msg.value);
    }

    event MoneySent(address indexed _beneficiary, uint _amount);
    event MoneyReceived(address indexed _from, uint _amount);
    
    function withdrawMoney( address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "There are not enough funds stored in the smart contract");
        if(!isOwner()) {
        reduceAllowance(msg.sender, _amount);
        }
        emit MoneySent(_to, _amount);
        _to.transfer(_amount);
    }
    function renounceOwnership() public override view onlyOwner {
        revert("Can't renouce ownership here");
    }

    function checkBalance() public view  returns(uint) {
        return address(this).balance;
    }
    
}
