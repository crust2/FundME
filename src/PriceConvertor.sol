// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface AggregatorV3Interface {
    function latestRoundData()
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );

    function version() external view returns (uint256);
}
library PriceConvertor{
    function getprice() internal view returns (uint256) {
        // Sepolia ETH/USD price feed
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price,,,) = priceFeed.latestRoundData();
        // Convert 8 decimals → 18 decimals
        return uint256(price) * 1e10;
    }
    function conversionrate(uint256 ethAmount)internal view returns (uint256){
        uint256 ethPrice = getprice();
        uint256 ethInUsd = (ethPrice * ethAmount) / 1e18;
        return ethInUsd;
    }
    function getVersion() internal view returns(uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}