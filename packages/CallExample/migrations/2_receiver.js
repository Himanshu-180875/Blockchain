const Receiver = artifacts.require("Receiver");

module.exports = function (deployer) {
  deployer.deploy(Receiver);
};
