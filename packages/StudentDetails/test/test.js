const { assert } = require("chai");
const web3 = require("web3");
var storeDetails = artifacts.require("./storeDetails.sol");

contract("storeDetails", (accounts) => {
  let instance;
  //created the mock record of student details
  let obj = {
    hash: "0xab1f7b7600761ef53800ccb5fd8b18827e4e7f191534d11a33ebbfa5482b767f",
    registrationNumber: 180875,
    studentName: "himanshu",
    instituteName: "central university of haryana",
  };


  //this will run before each test case
  before(async () => {
    // Load Contracts
    instance = await storeDetails.new({ from: accounts[0] });
  });

  //checking whether the contract is deployed by the manager 
  it("should be done by the owner", async () => {
    const contractOwner = await instance.owner();
    assert.equal(contractOwner, accounts[0]);
  });

  //generating the record of student
  it("generates a record with valid data", async () =>
    instance
      .createStudentRecord(
        obj.hash,
        obj.registrationNumber,
        obj.studentName,
        obj.instituteName,
        {
          from: accounts[0],
        }
      )
      //now checking whether the event is triggered or not
      .then((receipt) => {
        assert.equal(receipt.logs.length, 1, "an event was triggered");
        //checking whether the name of event is what we have entered.
        assert.equal(
          receipt.logs[0].event,
          "certificateGenerated",
          "the event type is correct"
        );
        //checking whether the hash is modified or not in between
        assert.equal(
          receipt.logs[0].args._certificateId,
          obj.hash,
          "the certificate hash is correct"
        );
      }));

  //throws error if we search for invalid id 
  it("throws an exception for invalid candidate ids", () =>
    instance
      .viewDocuments(
        "0xab1f7b7600761ef53800ccb5fd8b18827e4e7f191534d11a33ebbfa5482b767a"
      )
      .then(assert.fail)
      .catch((error) => {
        assert(
          error.message.indexOf("revert") >= 0,
          "error message must contain revert"
        );
      }));

    //throws error if we try to generate duplicate copy
  it("throws an exception if new certificate is generated with the duplicate certificate id", async () => {
    // const newInstance = await storeDetails.new({ from: accounts[0] });

    try {
      //     instance.createStudentRecord(
      //     obj.hash,
      //     obj.registrationNumber,
      //     obj.studentName,
      //     obj.instituteName,
      //     {
      //       from: accounts[0]
      //     }
      //   )
      instance
        .createStudentRecord(
          obj.hash,
          obj.registrationNumber,
          obj.studentName,
          obj.instituteName,
          {
            from: accounts[0],
          }
        )

        .then(assert.fail);
    } catch (error) {
      assert(
        error.message.indexOf("revert") >= 0,
        "error message must contain revert"
      );
    }
  });
});
