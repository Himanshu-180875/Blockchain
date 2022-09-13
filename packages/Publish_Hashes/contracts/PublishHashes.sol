// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;


contract PublishVerifyHash {
    
    //mapping from address to array of hashes which user stores
    mapping(address=>string[]) Hash;
    //checking whether the hash is taken or not 
    mapping(string => bool) public isTaken;

    //function for viewing all the stored hashes
    function viewHashes(address add) public view returns(string[] memory){
        return (Hash[add]);
    }
    
    //function for verifying the hash whether it is taken or not
    function verify(string memory inputHash) private view returns (bool) {
        return (isTaken[inputHash]);
    }

    //function for taking the hash and verfying and then storing 
    function takeInput(string memory _hash) public returns(bool){
        require(!verify(_hash));
        Hash[msg.sender].push(_hash);
        isTaken[_hash] = true;
        return true;
    }
  
}
