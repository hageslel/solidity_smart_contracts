### Project Objective

The objective of this project was to create three separate smart contracts to handle varying equity distributions.  The Associate Profit Splitter contract has been designed to split profits evenly between three employees.  The Tiered Profit Splitter contract splits profits by employee based on a designated percentage.  Finally, the Deferred Equity Plan contract was designed to distribute equity shares equally over a four year vesting period to each employee.  

### Associate Profit Splitter
As mentioned above, this contract distributes profits equally between three defined employees.  Employees may vary, as a constructor function was leveraged in this contract to allow for flexibility and multiple contract use.  This contract is designed to assume that all employees will always be provided an equal share.  In an effort to ensure no remainder profits are lost, any remaining ETH (wei) sent will be transferred back to the sender.  Finally, a fallback function was included to allow for acceptance of any external deposits of ETH.  

The gif below provides an example of the contract being compiled and deployed to my LocalHost 8545.  

![Local Contract 1 Deploy](Screenshots/contract_one.gif)

This contract was also deployed on Ropsten.  The contract address can be found below, along with a link directly to the contract address on Etherscan. 
  - Contract Address: 0xe64cef5B13A52e21ae4648AF495e06Af2593EFE1
    - Etherscan Link: https://ropsten.etherscan.io/address/0xe64cef5b13a52e21ae4648af495e06af2593efe1

The below gif outlines the deployment of the contract to Ropsten.  

![Ropsten Contract 1 Deploy](Screenshots/contract_one_ropsten.gif)





Create a README.md that explains how each of the contracts work and what the motivation for each of the contracts is. Also, please provide screenshots to illustrate the functionality (e.g. how you send transactions, how the transferred amount is then distributed by each of the contracts, and how the timelock functionality can be tested with the fastforward function). Alternatively, you can also record your interactions with the contract as a gif (e.g. https://www.screentogif.com/)
Upload the README.md to a Github repository and provide the testnet address for others to interact with the contract.
