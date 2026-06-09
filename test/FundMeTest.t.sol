// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {fundme} from "../src/FundMe.sol";

contract FundMeTest is Test {
    fundme fundme1;

    function setUp() external {
         fundme1 = new fundme();
    }

    function testDemo() public {
        assertEq(fundme1.minUSD() , 6e18);
    }
}