pragma solidity ^0.4.20;

import "./Owned.sol";

/**
 *Base for contracts that can stopped/resumed.
 */

 contract Stoppable is Owned {

     event LogSwitchStatus(bool switchStatus);
     event DoctorLicense(bool doctorStatus);

     bool public running;
     bool public status;

    function Stoppable() public {
        running = true;
    }

    modifier onlyIfRunning {
        require(running);
        _;
    }

    function controlSwitch(bool onOff) public onlyOwner {
        running = onOff;

        emit LogSwitchStatus(running);
    }

    function checkLicense(bool _status) public onlyOwner {
        status = _status;

        emit DoctorLicense(status);
    }
 }
