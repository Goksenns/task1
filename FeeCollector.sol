pragma solidity ^0.8.7;
//SPDX-License-Identifier:UNLİCENSED

contract FeeCollector{
    address public owner;
    uint256 public balance;

    constructor() {
        owner=msg.sender;

    }
    receive() payable external {
        balance += msg.value;
    }
    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender==owner, "only owner can withdraw");
        require(amount<=balance, "Insufficient funds");

        destAddr.transfer(amount);
        balance-=amount;
    }
}
