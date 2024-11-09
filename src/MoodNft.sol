// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {
    //      ERRORS      //
    error MoodNft_CantFlipMood(uint256 tokenId);

    uint256 private s_tokenCounter;
    string private s_penguin1ImageUri = "ipfs://QmVXHEfthhDafur8BUv67AM5UBEFpYAkF1BNujSUMn25wi";
    string private s_penguin2ImageUri = "ipfs://QmZpMfR6dHbHCxYn1veGkKJdPpCZ2XRxpbxjpeyE36kLjs";

    enum Mood {
        PENGUIN_1,
        PENGUIN_2
    }

    mapping(uint256 => Mood) private s_tokenIdPenguin;

    constructor() ERC721("Mood NFT", "MN") {
        s_tokenCounter = 0;
    }

    function getPenguinById(uint256 penguinId) public view returns (string memory) {
        if (s_tokenIdPenguin[penguinId] == Mood.PENGUIN_1) {
            return s_penguin1ImageUri;
        } else {
            return s_penguin1ImageUri;
        }
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdPenguin[s_tokenCounter] = Mood.PENGUIN_1;
        s_tokenCounter++;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function flipPenguin(uint256 tokenId) public {
        // only the owner of the NFT can flip the mood
        if (!_isAuthorized(msg.sender, msg.sender, tokenId)) {
            revert MoodNft_CantFlipMood(tokenId);
        }
        if (s_tokenIdPenguin[tokenId] == Mood.PENGUIN_1) {
            s_tokenIdPenguin[tokenId] = Mood.PENGUIN_2;
        } else {
            s_tokenIdPenguin[tokenId] = Mood.PENGUIN_1;
        }
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory imageURI = (tokenId % 2 == 0) ? s_penguin2ImageUri : s_penguin1ImageUri;

        if (s_tokenIdPenguin[tokenId] == Mood.PENGUIN_1) {
            imageURI = s_penguin1ImageUri;
        } else {
            imageURI = s_penguin2ImageUri;
        }

        // Use Base64 to encode the JSON string, it transforms bytes data into a string
        string memory json = string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{"name": "',
                            name(),
                            '", "description": "An NFT that represents a penguin.", "attributes": [{"trait_type": "cuteness", "value": "100"}], "image": "',
                            imageURI,
                            '"}'
                        )
                    )
                )
            )
        );

        return json;
    }
}
