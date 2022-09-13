// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
/*
importing the chainlink client for building and sending request
to the oracle
**second import is of setting the ownership of the contract
*/
import '@chainlink/contracts/src/v0.8/ChainlinkClient.sol';
import '@chainlink/contracts/src/v0.8/ConfirmedOwner.sol';


contract APIConsumerContract is ChainlinkClient, ConfirmedOwner {

    //using only the chainlink request structure 
    using Chainlink for Chainlink.Request;

    uint256 public price;
    bytes32 private jobId;
    uint256 private constant fee = 1 * LINK_DIVISIBILITY; // 1 * 10**18

    event RequestPrice(bytes32 indexed requestId, uint256 price);

    /**
     * @notice Initialize the link token and target oracle
     *
     * Goerli Testnet details:
     * Link Token: 0x326C977E6efc84E512bB9C30f76E30c160eD06FB
     * it will its parent contract for setting the ownership 
     */
    constructor() ConfirmedOwner(msg.sender) {
        setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
    }

    /**
     * Create a Chainlink request to retrieve API response, find the target
     * data, then multiply by 100000 (to remove decimal places from data).
     */
    function requestPriceData(address _oracle, string memory _jobId) public {
        Chainlink.Request memory req = buildChainlinkRequest(
            stringToBytes32(_jobId), 
            address(this), 
            this.fulfill.selector
            );

        // Set the URL to perform the GET request on
        req.add('get', 'http://localhost:5002/api/price/eth');

       

        req.add('path', 'price'); // Chainlink nodes 1.0.0 and later support this format

        // Multiply the result by 100000 to remove decimals
        int256 timesAmount = 10**5;
        req.addInt('times', timesAmount);

        // Sends the request
        sendChainlinkRequestTo(_oracle, req, fee);
    }

    /**
     * Receive the response in the form of uint256
     */
    function fulfill(bytes32 _requestId, uint256 _price) public recordChainlinkFulfillment(_requestId) {
        emit RequestPrice(_requestId, _price);
        price = _price;
    }

    /**
     * Allow withdraw of Link tokens from the contract
     */
    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
        require(link.transfer(msg.sender, link.balanceOf(address(this))), 'Unable to transfer');
    }

    //used when building the request because it accepts the job id to be in bytes
    function stringToBytes32(string memory source) private pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            // solhint-disable-line no-inline-assembly
            result := mload(add(source, 32))
        }
    }
}
