pragma solidity ^0.4.20;

import "./Stoppable.sol";

/**
 *Base for contract that work with the abstraction of medical.
 */

contract Doctor is Stoppable {

    event LogEnrollDoctor(address doctorAccount);
    event LogDeleteDoctor(address delDoctorAccount);

    address public doctor;
    address public preDoctor;
    bool public doctorLicense;

    modifier onlyDoctor{
        require(msg.sender == doctor);
        _;
    }

    function Doctor() public {
        doctorLicense = false;
        preDoctor = msg.sender;
    }

    function enrollDoctor(bool _license) public onlyOwner {
        doctorLicense = _license;
        require(doctorLicense);
        emit LogEnrollDoctor( preDoctor);

        doctor = preDoctor;
        preDoctor = 0x0;
    }

    function deleteDoctor(address delDoctor) public onlyOwner onlyDoctor {
        emit LogDeleteDoctor(delDoctor);

        doctor = 0x0;
    }

}
