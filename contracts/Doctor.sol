pragma solidity ^0.4.20;

/**
 *Base for contract that work with the abstraction of medical.
 */

contract Doctor {

    event LogEnrollDoctor(address addDoctorAccount);
    event LogDeleteDoctor(address delDoctorAccount);

    address public doctor;

    modifier onlyDoctor{
        require(msg.sender == doctor);
        _;
    }

    function enrollDoctor(address inDoctor) public {
        require(inDoctor != 0);
        emit LogEnrollDoctor(doctor);

        doctor = inDoctor;
    }

    function deleteDoctor(address outDoctor) public onlyDoctor {
        emit LogDeleteDoctor(outDoctor);

        doctor = 0x0;
    }
}
