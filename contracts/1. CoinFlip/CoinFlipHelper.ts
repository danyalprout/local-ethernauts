import { expect } from "chai";
import { ethers } from "hardhat";

const helper = async (victim: any, attacker: any) => {
  for (let i = 0; i < 10; i++) {
    await attacker.hackContract();
    // new block per txn no need to evm_mine
  }
};

export default helper;
