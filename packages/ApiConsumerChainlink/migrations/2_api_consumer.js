const APIConsumerContract = artifacts.require("APIConsumerContract");

module.exports = function (deployer) {
  deployer.deploy(APIConsumerContract);
};
