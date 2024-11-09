// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {MoodNft} from "src/MoodNft.sol";

contract MoodNftTest is Test {
    MoodNft private s_moodNft;
    address USER = makeAddr("USER");

    function setUp() public {
        s_moodNft = new MoodNft();
    }

    function testViewTokenURI() public {
        vm.prank(USER);
        s_moodNft.mintNft();
        console.log(s_moodNft.tokenURI(0));
    }
}
