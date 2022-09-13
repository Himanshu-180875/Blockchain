**This smart contract is used to fetch the data from chainlink data feeds, and these data come from various node operators and then aggregated, so I'm consuming the aggregatorInterface, So if you want to test this amazing thing you need**\

Setup Requirement\
We require below services/software on system for project setup.

Node 16.15.0\
GIT


Setup Guide (Command line instructions)
```
git clone <Project_Repo_URL> project cd project
```

make a file ".env" in the root of this package folder

**MNENOMIC='HI THESE ARE FOR DEMONSTRATION BUT NOT  REAL VALUES PLEASE ADD YOUR OWN'**\
**INFURA_API_KEY='0000000000000000'**

and run 
```
npm i
```
and to run in local

```
truffle migrate
```
and to run in testnet

```
truffle migrate --network <network name>
```
For changing the network configurations:
```
sudo vi truffle-config.js
```
change the testnet configuration and after saving\ Run the above network command
