// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract Receiver {
    string public message;
    uint256 public x;
    event Received(address caller, uint256 amount, string message);

    // receive() external payable {}

    //this fallback function can receive ether and emit event when received
    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    //function for initializaing the values
    function foo(string memory _message, uint256 _x)
        external
        payable
        returns (uint256)
    {
        message = _message;
        x = _x;
        return x;
    }
}

contract Caller {
    event Response(bool success);

    // Let's imagine that contract B does not have the source code for
    // contract A, but we do know the address of A and the function to call.
    function testCallFoo(address payable _addr) public payable {
        // You can send ether and specify a custom gas amount
        (bool success, ) = _addr.call{value: msg.value, gas: 50001}(
            abi.encodeWithSignature("foo(string,uint256)", "call foo", 123)
        );
        emit Response(success);
    }

    // Calling a function that does not exist triggers the fallback function.
    function testCallDoesNotExist(address _addr) public {
        (bool success, ) = _addr.call(
            abi.encodeWithSignature("doesNotExist()")
        );
        emit Response(success);
    }
}
