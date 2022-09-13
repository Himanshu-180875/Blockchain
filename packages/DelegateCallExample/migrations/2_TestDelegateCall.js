const TestDelegateCall = artifacts.require("TestDelegateCall");

module.exports = function (deployer) {
  deployer.deploy(TestDelegateCall);
};
