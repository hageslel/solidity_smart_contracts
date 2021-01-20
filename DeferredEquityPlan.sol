pragma solidity ^0.5.0;

// lvl 3: equity plan
// Defining human_resources as the contract address and implementing fakenow to test the timelock. 
// Fakenow commented out following the test of the contract. 
contract DeferredEquityPlan {
    // uint fakenow = now;
    address human_resources;

// Defining variables of the contract that are set for each employee.  Unlock time of 365 days set. 
    address payable employee; // bob
    bool active = true; // this employee is active at the start of the contract
    uint total_shares = 1000;
    uint annual_distribution = 250;

    uint start_time = now; // permanently store the time this contract was initialized
    
    uint unlock_time = now + 365 days;
    
// Defining fastforward function to test contract. Function commented out after contract has been tested.     
//     function fastforward() public {
//     fakenow += 365 days;
// }

// Defining distributed shares variable and creating a constructor to allow use across multiple employees.
    uint public distributed_shares; // starts at 0

    constructor(address payable _employee) public {
        human_resources = msg.sender;
        employee = _employee;
    }

// Defining a distribute function with requirements on distribution of shares. 
    function distribute() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to execute this contract.");
        require(active == true, "Contract not active.");
        require(unlock_time <= now, "The account is locked.");
        require(distributed_shares < total_shares, "Distributed shares cannot exceed total shares!");
        
        unlock_time += 365 days;
        
        distributed_shares = (now - start_time) / 365 days * annual_distribution;

        // double check in case the employee does not cash out until after 5+ years
        if (distributed_shares > 1000) {
            distributed_shares = 1000;
        }
    }

// Defining deactivate function to allow human_resources and the employee the ability to deactivate this contract at-will.
    function deactivate() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to deactivate this contract.");
        active = false;
    }

// Since we do not need to handle Ether in this contract, revert any Ether sent to the contract directly
    function() external payable {
        revert("Do not send Ether to this contract!");
    }
}