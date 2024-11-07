forge init
forge install OpenZeppelin/openzeppelin-contracts --no-commit

in foundry.toml:
remappings = ["@openzeppelin/contracts=lib/openzeppelin-contracts/contracts']

info:

1. URI: Uniform Resource Identifier -> Identifies the resource by name at the specified location or URL
2. URL: Uniform Resource Locator -> Location of the Resource

Compare two strings in solidity:
use abi.encodePacked("stringHere") with keccak256
assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));

Run a specific test
forge test --mt testFunctionName

DevOps
forge install chainaccelorg/foundry-devops --no-commit

make deploy ARGS="--network sepolia"

- Extra on Code

Breaking Down the Components:

json Variable:

This variable holds the base64-encoded JSON string representing the token's metadata.
"data:application/json;base64,":

This prefix indicates that the data following it is a base64-encoded JSON object.
data: specifies that the content is inline data.
application/json denotes the MIME type of the data.
base64 indicates that the data is base64-encoded.
abi.encodePacked(...):

This function concatenates the prefix and the base64-encoded JSON string into a single byte array.
string(...):

Converts the concatenated byte array into a string.
