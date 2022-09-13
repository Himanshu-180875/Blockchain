**This smart contract is for creating the certificate of student record, and this certificate can only be added by the education institute, and it checks whether the certificate of the student is unique because every student has unique details, any other can also verify the certificate details by just entering the hash of the certificate. To set up this you need**\

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
