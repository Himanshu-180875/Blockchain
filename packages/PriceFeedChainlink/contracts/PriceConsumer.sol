// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

//importing the aggregator of chainlink and the data is
//aggregated from many independent Chainlink node operators
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceConsumer {
    AggregatorV3Interface internal priceFeed;

    // Network: Goerli
    // Aggregator: BTC/USD
    //Address: 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e

    constructor() {
        priceFeed = AggregatorV3Interface(
            0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        );
    }

    // Returns the latest price

    function getLatestPrice() public view returns (int256) {
        (
            ,
            /*uint80 roundID*/
            int256 price, /*uint startedAt*/ /*uint timeStamp*/
            ,
            ,

        ) = /*uint80 answeredInRound*/

        //using latestrounddata so that the latest answer will come
            priceFeed.latestRoundData();
        return price;
    }
}
