// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract APIConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;

    mapping(bytes32 => bool) private s_typeIdrequested;

    mapping(address => int256) public s_addressAmount;

    bool public latestStatus;

    address public oracle;
    bytes32 public jobId;
    uint256 public fee;

    event DataFullfilled(uint256 volume);

    constructor(
        address _oracle,
        bytes32 _jobId,
        uint256 _fee,
        address _link
    ) {
        if (_link == address(0)) {
            setPublicChainlinkToken();
        } else {
            setChainlinkToken(_link);
        }
        oracle = _oracle;
        jobId = _jobId;
        fee = _fee;
    }

    function getnumberString(uint128 number_)
        public
        pure
        returns (string memory)
    {
        return toString(uint256(number_));
    }

    function toString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    function append(uint128 userId_) public pure returns (string memory) {
        string memory url = "link to api";
        string memory playerURL = string(
            abi.encodePacked(url, getnumberString(userId_))
        );
        return playerURL;
    }

    function getDepositConfirmation(uint128 userId_)
        public
        returns (bytes32 requestId)
    {
        Chainlink.Request memory request = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfill.selector
        );
        string memory url = "https://";
        string memory userURL = string(
            abi.encodePacked(url, getnumberString(userId_))
        );
        request.add("get", userURL);

        request.add("path", "STATUS");

        return sendChainlinkRequestTo(oracle, request, fee);
    }

    function fulfill(bytes32 _requestId, bool _score)
        public
        recordChainlinkFulfillment(_requestId)
    {
        latestStatus = _score;
    }
}
