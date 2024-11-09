// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNft) {
        //string memory penguin1 = vm.readFile("./img/penguin-1.png");
        //string memory penguin2 = vm.readFile("./img/penguin-2.png");

        vm.startBroadcast();
        MoodNft moodNft = new MoodNft();
        vm.stopBroadcast();
        return moodNft;
    }
}
