const Oracle = artifacts.require("Oracle");

module.exports = function (deployer) {
  deployer.deploy(Oracle, "0x326C977E6efc84E512bB9C30f76E30c160eD06FB");
};
