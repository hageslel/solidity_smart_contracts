pragma solidity ^0.5.0;

// lvl 1: equal split
// Defining three employees addresses as payable accounts of the contract.
contract AssociateProfitSplitter {
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;

// Defining constructor function to accept 3 employees and avoid hardcoding of account addresses.
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

// Function to check the balance.  Should always be 0 due to returning leftover amounts to the sending address.
    function balance() public view returns(uint) {
        return address(this).balance;
    }

// Defining the deposit function to send equal amounts to each employee.  Any remainder is sent back to the sender. 
    function deposit() public payable {
        uint amount = msg.value / 3;
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);
        
        msg.sender.transfer(msg.value - (amount * 3));
    }

// Deining a fallback function to accept deposits from external accounts. 
    function() external payable {
        deposit();
    }
}
