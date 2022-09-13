// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Lottery{

    //This will store the address of the manager
    address public manager;

    //making it payable because when any of the participant will win we have to transfer the ether into their account from contract

    address payable[] public participants;


    //This contract will be deployed by the manager 
    constructor()
    {

        //msg is a global variable and when we deploy the contract it will take the address of the manager account 
        manager = msg.sender;

    } 


    //This is a special type of function which we can use only once in contract and we have to use it with the external keyword and 
    //it should be payable and there should be no arguments 
    receive() external payable
    {
        //require -> it is same as if/else if require statement will be true then only the below statement will execute
        //here we are checking whether the amount is equal to 1 ether or not, if not then participant can't participate in lottery
        require(msg.value ==  1 ether );

        //whenever we will receive the ether we will the address of the participant 
        participants.push(payable(msg.sender));

    } 

    //This function is for getting the balance of the contract
    function getBalance() public view returns(uint){

        //here we are giving the authority of viewing balance only to the manager 
        require(msg.sender == manager);
        return address(this).balance;
    }

    //Now, I am generating one randomnumber 
    function random() public view returns(uint){
        //it gives us hexadecimal so we need to convert it into uint
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, participants.length)));
    }

    //from here we are returning the address of the winner 

    function selectWinner() public {

        //we are giving this authorization to only manager
        require(msg.sender == manager);
        require(participants.length >=3);

        //for decalaring the winner we need an index from participants array so that we can pass the address of that index
        //for giving the contract amount or winning amount

        uint r = random();
        //we have now got a random number and now we can perform modulo to get the index
        // as we are using participants length as divisor for  modulo because the characterstic of modulo is it gives remainder 
        // it gives value in remainder less than or equal to divisor ex: 10%3 value we will get is less than or = to 3

        uint index  = r % participants.length;

        //now we will store the address of winner 

        address payable winner;
        winner = participants[index];
        winner.transfer(getBalance()); 

        //after that we are closing the round of lottery and simply means clearing the dynamic array
        participants = new address payable[](0); 
    }
}