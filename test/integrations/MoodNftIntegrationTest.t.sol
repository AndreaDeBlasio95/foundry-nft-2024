// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {MoodNft} from "../../src/MoodNft.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftIntegrationTest is Test {
    MoodNft public moodNft;
    DeployMoodNft public deployer;
    address public USER = makeAddr("USER");

    string private s_penguin1ImageUri = "ipfs://QmVXHEfthhDafur8BUv67AM5UBEFpYAkF1BNujSUMn25wi";
    string private s_penguin2ImageUri = "ipfs://QmZpMfR6dHbHCxYn1veGkKJdPpCZ2XRxpbxjpeyE36kLjs";

    function setUp() public {
        deployer = new DeployMoodNft();
        moodNft = deployer.run();
    }

    function testViewTokenURIIntegration() public {
        vm.prank(USER);
        moodNft.mintNft();
        console.log(moodNft.tokenURI(0));
    }

    function testFlipPenguinIntegration() public {
        vm.prank(USER);
        moodNft.mintNft();
        moodNft.flipPenguin(0);
        string memory penguin1Flipped = moodNft.getPenguinById(0);

        assertEq(penguin1Flipped, s_penguin2ImageUri);
    }
}
