pragma solidity ^0.4.24;

contract CarbonCredit {


    //Factors required for calculation as well as the contract details
    string public organisationName;
    uint32 public CCValue_SP;
    uint32 public CCValue_Elect;
    uint32 public CCValue_EmployeeCommu;
    uint32 public CCValue_PublicTrans;
    uint32 public CCValue_PurchasedGas;
    uint32 public CCValue_GreenPowerOff;

    //Sourcing and Procurement
    uint32 public distanceCovered;
    string public transportationMode;
    uint32 public vehicleWeight;
    uint32 public numberOfVehicles;
    uint32 public cargoWeight;

    //Electricity
    uint32 public unitsOfElectricity;
    string public typeOfEnergy;

    //Employee Commute
    string public typeOfTravel;
    string public modeOfTransportInComumute;
    uint32 public totalDistanceTravelled;

    //Public Transport
    uint32 public enterTotalDistanceCovered;
    string public modeOfTransportInProduct;
    uint32 public weightOfVehiclesInProduct;
    uint32 public noOfVehiclesInProduct;

    //Purchased Gases
    string public typeOfGasPurchased;
    uint32 public enterQuantityPurchasedInGases;

    //REC or Greenpower Offset
    string public typeOfPowerUsed;
    uint32 public purchasedQuantityOfCredit;

    
    //input function for sourcing and procurement
    function input_SourceProcure(string _organisationName, uint32 _distanceCovered, string _transportationMode, uint32 _vehicleWeight, uint32 _numberOfVehicles,
    uint32 _cargoWeight) public {
        organisationName = _organisationName;
        distanceCovered = _distanceCovered;
        transportationMode = _transportationMode;
        vehicleWeight = _vehicleWeight;
        numberOfVehicles = _numberOfVehicles;
        cargoWeight = _cargoWeight;

        if (vehicleWeight > 500){
            CCValue_SP = numberOfVehicles * distanceCovered * (vehicleWeight + cargoWeight) * 143;
        } else {
            CCValue_SP = numberOfVehicles * distanceCovered * (vehicleWeight + cargoWeight) * 307;
        }
    }

    //input function for electricity
    function input_Elect(uint32 _unitsOfElectricity, string _typeOfEnergy) public{
        unitsOfElectricity = _unitsOfElectricity;
        typeOfEnergy = _typeOfEnergy;
        
        //Conversion Formula
    }

    //input function for employee commute
    function input_EmployeeComm(string _typeOfTravel, string _modeOfTransportInComumute, uint32 _totalDistanceTravelled) public{
        typeOfTravel = _typeOfTravel;
        modeOfTransportInComumute = _modeOfTransportInComumute;
        totalDistanceTravelled = _totalDistanceTravelled;
        
        //Conversion Formula
    }

    //input function for public transport
    function input_publicTrans(uint32 _enterTotalDistanceCovered, string _modeOfTransportInProduct, uint32 _weightOfVehiclesInProduct,
    uint32 _noOfVehiclesInProduct) public{
        enterTotalDistanceCovered = _enterTotalDistanceCovered;
        modeOfTransportInProduct = _modeOfTransportInProduct;
        weightOfVehiclesInProduct = _weightOfVehiclesInProduct;
        noOfVehiclesInProduct = _noOfVehiclesInProduct;
        
        //Conversion Formula
    }


    //input function for purchased gases
    function input_purchasedGas(string _typeOfGasPurchased, uint32 _enterQuantityPurchasedInGases) public{
        typeOfGasPurchased = _typeOfGasPurchased;
        enterQuantityPurchasedInGases = _enterQuantityPurchasedInGases;
        
        //Conversion Formula
    }

    //input function for REC or Greenpower Offset
    function input_GreenPowerOffset(string _typeOfPowerUsed, uint32 _purchasedQuantityOfCredit) public{
        typeOfPowerUsed = _typeOfPowerUsed;
        purchasedQuantityOfCredit = _purchasedQuantityOfCredit;
        
        //Conversion Formula
    }

    function getCarbonCredits() external view returns (uint32) { 
        return CCValue_SP/1000000; 
    }
}

