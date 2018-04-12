pragma solidity ^0.4.20;

/**
 *Base for contract that work about medical data
 */

contract Medical {

    uint public medicalChart;
    //medical info_two digit?
    //first digit is category(1*: visit list, 2*: surgery list, ...)
    //second digit is medical details in category (11: ultrasonic wave, 12: cheak blood, ...)

    function Medical() public {

    }
}
