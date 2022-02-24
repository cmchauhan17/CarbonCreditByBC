pragma solidity ^0.4.24;

contract CarbonCredit {


    //Factors required for calculation as well as the contract details

    string orgName;
    uint32 noOfVehicles;
    uint32 carbonCreditValue;

    struct declare{
        uint32 avgDistance;
        uint32 orgVehicleWeight;
        uint32 orgCargoWeight;
    }



    function inputDetails(string _orgName, uint32 _noOfVehicles, uint32 avgDistance, uint32 orgVehicleWeight, 
    uint32 orgCargoWeight) public{

        orgName = _orgName;
        noOfVehicles = _noOfVehicles;

        if (orgVehicleWeight > 500){
            carbonCreditValue = noOfVehicles * avgDistance * (orgVehicleWeight + orgCargoWeight) * 143;
        }
        else{
            carbonCreditValue = noOfVehicles * avgDistance * (orgVehicleWeight + orgCargoWeight) * 307;
        }
    }

    function getCarbonCredits() external view returns (uint32) { 
        return carbonCreditValue/1000000; 
    }
}

