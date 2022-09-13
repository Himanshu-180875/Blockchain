**This smart contract is for storing the user data hashes and these data are linked to the user data, only unique data can be stored this is the functionality of the smart contract and user can view his data by using entering the user address..so, to test this you need**\
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
