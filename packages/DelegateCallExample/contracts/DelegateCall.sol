// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

//we will use this contract for testing the delegate call
contract TestDelegateCall {
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) external payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

// DELEGATECALL basically says that I'm a contract and I'm allowing (delegating) 
// you to do whatever you want to my storage
contract DelegateCall {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _addr, uint _num) external payable {
        (bool success, ) =_addr.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
            );

           
        require(success, "delegate failed");
    }
}