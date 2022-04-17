require('dotenv').config()
require("@nomiclabs/hardhat-waffle");
require('@nomiclabs/hardhat-ethers')
require('@eth-optimism/plugins/hardhat/compiler')
require('hardhat-abi-exporter');

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  networks: {
    matic: {
      url: process.env.L2_NODE_URL || 'http://localhost:8546',
      accounts: [process.env.PRIVATE_KEY]
    },
    bsc: {
      gas: 30000000,
      gasPrice: 5000000000, 
      url: process.env.PROVIDER_URL || 'http://localhost:8888'
    }, 
  },
  solidity: "0.5.16",
};
