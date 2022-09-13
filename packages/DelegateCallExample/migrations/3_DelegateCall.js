const DelegateCall = artifacts.require("DelegateCall");

module.exports = function (deployer) {
  deployer.deploy(DelegateCall);
};
