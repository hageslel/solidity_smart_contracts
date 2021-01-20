### Project Objective

The objective of this project was to create three separate smart contracts to handle varying equity distributions.  The Associate Profit Splitter contract has been designed to split profits evenly between three employees.  The Tiered Profit Splitter contract splits profits by employee based on a designated percentage.  Finally, the Deferred Equity Plan contract was designed to distribute equity shares equally over a four year vesting period to each employee.  

### Associate Profit Splitter Contract

As mentioned above, this contract distributes profits equally between three defined employees.  Employees may vary, as a constructor function was leveraged in this contract to allow for flexibility and multiple contract use.  This contract is designed to assume that all employees will always be provided an equal share.  In an effort to ensure no remainder profits are lost, any remaining ETH (wei) sent will be transferred back to the sender.  Finally, a fallback function was included to allow for acceptance of any external deposits of ETH.  

The gif below provides an example of how the contract can be interacted with.  It was deployed here to my LocalHost 8545 and tested by sending wei  and ETH to each employee.  ETH was used to allow for a better visual of transactions occuring on all accounts.  To ensure the "balance" function worked correctly by always displaying a value of 0, wei had to be used.  This is due to uint limitations being exceeded (maximum integer values) when transacting with ETH.    

![Local Contract 1 Deploy](Screenshots/contract_one.gif)

This contract was also deployed on Ropsten.  The contract address can be found below, along with a link directly to the contract address on Etherscan. 
  - Contract Address: 0xe64cef5B13A52e21ae4648AF495e06Af2593EFE1
    - Etherscan Link: https://ropsten.etherscan.io/address/0xe64cef5b13a52e21ae4648af495e06af2593efe1

The below gif outlines the deployment of the contract to Ropsten.  

![Ropsten Contract 1 Deploy](Screenshots/contract_one_ropsten.gif)


### Tiered Profit Splitter Contract

This contract was created to distribute profits on a tiered basis to three employees.  Similar to the first contract, a constructor function was utilized to allow for multiple contract uses.  Within the deposit function of this contract, a points variable was defined to equal msg.value / 100.  This calculates rudimentary percentages for ease of use within the contract.  The three employees are assigned various percentages of profit that they will receive (60% / 25% / 15%).  A total running amount of profits distributed was calculated via the "total" variable.  This was then subtracted from the original value and any reamaining profits are distributed to the highest profit earner, being employee one in this contract.  This ensures no balance of wei is leftover.  Finally, a fallback function is included in this contract as well to accept any deposits from external accounts. 
