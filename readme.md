**This is a monorepo of smart contracts where you will find the bunch of contracts with different purpose. Description of each contract are below**



Link to contracts readme.md are:

[ApiConsumerChainlink](packages/ApiConsumerChainlink/readme.md)\
[CallExample](packages/CallExample/readme.md)\
[DelegateCallExample](packages/DelegateCallExample/readme.md)\
[Lottery](packages/Lottery/readme.md)\
[Oracle](packages/Oracle/readme.md)\
[PriceFeedChainlink](packages/PriceFeedChainlink/readme.md)\
[Publish_Hashes](packages/Publish_Hashes/readme.md)\
[StudentDetails](packages/StudentDetails/readme.md)


For testing this monorepo you just need:

**Setup Requirement**\
We require below services/software on system for project setup.

Node 16.15.0\
GIT


Setup Guide (Command line instructions)
```
git clone <Project_Repo_URL> project cd project
```

and run 
```
npm install
```
make a file ".env" in the packages/'your_selected_contract' folder

**MNENOMIC='HI THESE ARE FOR DEMONSTRATION BUT NOT  REAL VALUES PLEASE ADD YOUR OWN'**\
**INFURA_API_KEY='0000000000000000'**

and to run in local
come back to root directory

```
sudo vi package.json
```
If you want to deploy all contract then remove --scope flag in scripts section of package.json\
If you want to deploy only one then change the contract name in --scope flag of scripts section\
if you want to add more than one contract then add by using --scope={contract_one,contract_two} 
```
npm run start
```
and to run in goerli testnet

```
npm run goerli
```

if you want to run it in different testnet then change configuration\
```
cd packages/'your selected contract'

```

```
sudo vi truffle-config.js
```
change the testnet configuration

```
sudo vi package.json
```
change the testnet name in scripts section

and you are good to go !!