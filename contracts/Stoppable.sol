pragma solidity ^0.4.20;

import "./Owned.sol";
import "./Doctor.sol";

/**
 *Base for contracts that can stopped/resumed.
 */

 contract Stoppable is Owned, Doctor {

    event LogSwitchStatus(bool SwitchStatus);

    bool public running;

    function Stoppable() public {
        running = true;
    }

    modifier onlyIfRunning {
        require(running);
        _;
    }

    function controlSwitch(bool onOff) public onlyOwner onlyDoctor {
        running = onOff;

        emit LogSwitchStatus(running);
    }
 }
