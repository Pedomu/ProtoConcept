pragma solidity ^0.4.20;

import "./Doctor.sol";
import "./Pet.sol";
import "./Medical.sol";

/**
 *Base for contract that work with the abstraction of animal hospital.
 */

contract Hospital is Doctor, Pet, Medical {

    function Hospital() public {

    }

}
