pragma solidity ^0.4.20;

import "./Owned.sol";

/**
 *Base for contracts that can stopped/resumed.
 */

 contract Stoppable is Owned {

    bool public running;

    function Stoppable() public {
        running = true;
    }

    modifier onlyIfRunning {
        require(running);
        _;
    }

    function runSwitch(bool onOff) public onlyOwner returns (bool success) {
        running = onOff;
        return true;
    }

 }
