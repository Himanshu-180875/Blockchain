const PublishVerifyHash = artifacts.require("PublishVerifyHash");

module.exports = function (deployer) {
  deployer.deploy(PublishVerifyHash);
};
