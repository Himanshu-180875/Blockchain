// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;


contract storeDetails{
    //Student Data type for storing the student records 
    struct Student{
        uint registrationNumber;
        string studentName;
        string instituteName;
        bool exists;
    }
    //only educational institute can add
    address public owner;
    event certificateGenerated(bytes32 _certificateId);

    //This contract will be deployed by the manager 
    constructor()
    {

        //msg is a global variable and when we deploy the contract it will take the address of the manager account 
        owner = msg.sender;

    } 

    //mapping from hash to student record 
    mapping (bytes32 => Student) documents;
    function viewDocuments(bytes32 hash) public view returns(uint registrationNumber, string memory studentName, string memory instituteName){
        require(verifyHash(hash), "document id is invalid");
        return (documents[hash].registrationNumber, documents[hash].studentName, documents[hash].instituteName);
    }
    
    //verifying the hash of the student record 
    function verifyHash(bytes32 inputHash) public view returns (bool) {
        return (documents[inputHash].exists);
    }

    //Adding student record
    function createStudentRecord(bytes32 hash, uint _registrationNumber, string memory studentName, string memory instituteName) public{
        //only educational institute can add
        require(msg.sender == owner);

        require(!verifyHash(hash), "Record already exists");
        Student memory newStudent = Student(_registrationNumber, studentName, instituteName, true);
        documents[hash] = newStudent;
        emit certificateGenerated(hash);

       
    } 
}