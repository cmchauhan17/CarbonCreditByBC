pragma solidity ^0.4.19;

contract inputDetails {

    //creating a factory of certifictaes i.e. creating an array which will store all certificates
    address [] public registeredCCCertificate;

    //event creating bcs of promise to deliver us the newcertificates address
    event ContractCreated(address contractAddress);

    function addFootprintValues(string _orgName, uint32 _noOfVehicles, uint32 _avgDistance, uint32 _orgVehicleWeight, uint32 _orgCargoWeight) public{
        address newFootPrint = new CarbonCredit(msg.sender, _orgName, _noOfVehicles, _avgDistance, _orgVehicleWeight, _orgCargoWeight);

        //emits the event
        emit ContractCreated(newFootPrint);

        //saving the address so that a frontend client can access it
        registeredCCCertificate.push(newFootPrint);
    }

    //helper function to so your webClient can easily retrieve all certificates created by this factory
    function getDeployedCarbonCredits() public view returns (address []){
        return registeredCCCertificate;
    }
}

contract CarbonCredit {
    // We will declare your global vars here

    // Set owner public var, so everyone can see who owns the contract
    address public owner;

    //Factors required for calculation as well as the contract details
    string public orgName;
    uint32 public noOfVehicles;
    uint32 public avgDistance;
    uint32 public orgVehicleWeight;
    uint32 public orgCargoWeight;
    uint32 public carbonCreditValue;

    //NEWNEWNEW
    uint16 CLCV = 143;
    uint16 CHCV = 307;

    constructor(address _owner, string _orgName, uint32 _noOfVehicles, uint32 _avgDistance, uint32 _orgVehicleWeight, uint32 _orgCargoWeight) public {
        // We will instantiate your contract here
        owner = _owner;
        orgName = _orgName;
        noOfVehicles = _noOfVehicles;
        avgDistance = _avgDistance;
        orgVehicleWeight = _orgVehicleWeight;
        orgCargoWeight = _orgCargoWeight;

        if (orgVehicleWeight > 500){
            carbonCreditValue = noOfVehicles * avgDistance * (orgVehicleWeight + orgCargoWeight) * CLCV;
        }
        else{
            carbonCreditValue = noOfVehicles * avgDistance * (orgVehicleWeight + orgCargoWeight) * CHCV;
        }
        
    }

    function getCarbonCredits() external view returns (uint32) { 
        return carbonCreditValue/1000000; 
    }

}
