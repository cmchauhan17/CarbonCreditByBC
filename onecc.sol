pragma solidity ^0.4.25;

contract CarbonCredit {

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
