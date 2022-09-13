const storeDetails = artifacts.require("storeDetails");

module.exports = function (deployer) {
  deployer.deploy(storeDetails);
};
