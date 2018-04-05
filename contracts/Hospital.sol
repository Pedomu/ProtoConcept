pragma solidity ^0.4.20;

import "./Doctor.sol";
import "./Pet.sol";

/**
 *Base for contract that work with the abstraction of animal hospital.
 */

contract Hospital is Doctor, Pet {

    function Hospital() public {

    }

}
