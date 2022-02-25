pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;


contract CarbonCredit {


    //Factors required for calculation as well as the contract details

    struct declare{


    string organisationName;
    string transportationMode;
    string typeOfTravel;
    string typeOfEnergy;
    string modeOfTransportInComumute;
    string modeOfTransportInProduct;
    string typeOfGasPurchased;
    string typeOfPowerUsed;
    uint32 carbonCreditValue;

        uint32 numberOfVehicles;
        uint32 distanceCovered;
        uint32 vehicleWeight;
        uint32 cargoWeight;

        uint32 unitsOfElectricity;

        uint32 totalDistanceTravelled;

        uint32 enterTotalDistanceCovered;
        uint32 weightOfVehiclesInProduct;
        uint32 noOfVehiclesInProduct;

        uint32 enterQuantityPurchasedInGases;

        uint32 purchasedQuantityOfCredit;

    }



    function inputDetails(declare memory organisationName, uint32 numberOfVehicles, string _transportationMode, uint32 distanceCovered, uint32 vehicleWeight, uint32 cargoWeight,
    uint32 unitsOfElectricity, string _typeOfEnergy,
    string _typeOfTravel, string _modeOfTransportInComumute, uint32 totalDistanceTravelled,
    uint32 enterTotalDistanceCovered, string _modeOfTransportInProduct, uint32 weightOfVehiclesInProduct, uint32 noOfVehiclesInProduct,
    string _typeOfGasPurchased, uint32 enterQuantityPurchasedInGases,
    string _typeOfPowerUsed, uint32 purchasedQuantityOfCredit) public{

        organisationName = _organisationName;
        transportationMode = _transportationMode;

        typeOfEnergy = _typeOfEnergy;

        typeOfTravel = _typeOfTravel;
        modeOfTransportInComumute = _modeOfTransportInComumute;

        modeOfTransportInProduct = _modeOfTransportInProduct;

        typeOfGasPurchased = _typeOfGasPurchased;

        typeOfPowerUsed = _typeOfPowerUsed;


        if (vehicleWeight > 500){
            carbonCreditValue = numberOfVehicles * distanceCovered * (vehicleWeight + cargoWeight) * 143;
        }
        else{
            carbonCreditValue = numberOfVehicles * distanceCovered * (vehicleWeight + cargoWeight) * 307;
        }
    }

    function getCarbonCredits() external view returns (uint32) { 
        return carbonCreditValue/1000000; 
    }
}

