pragma solidity ^0.5.0;

// lvl 2: tiered split
// Defining three employee addresses as payable accounts of the contract.
contract TieredProfitSplitter {
    address payable employee_one; // ceo
    address payable employee_two; // cto
    address payable employee_three; // bob

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

// Defining the deposit function.  Value divided by 100 to calculate percentages. 
// Percentage split between three employees and the remainder gets sent to employee_one (highest %). 
    function deposit() public payable {
        uint points = msg.value / 100; // Calculates rudimentary percentage by dividing msg.value into 100 units
        uint total;
        uint amount;
        
        amount = points * 60;
        total += amount;
        employee_one.transfer(amount);
        
        amount = points * 25;
        total += amount;
        employee_two.transfer(amount);
        
        amount = points * 15;
        total += amount;
        employee_three.transfer(amount);

        employee_one.transfer(msg.value - total); // ceo gets the remaining wei
    }

// Deining a fallback function to accept deposits from external accounts. 
    function() external payable {
        deposit();
    }
}
