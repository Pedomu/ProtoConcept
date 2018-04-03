pragma solidity ^0.4.20;

import "./Owned.sol";

contract Pet is Owned {

    struct PetInfo {
        string petName;
        address petAddress;
        uint petAges; //need a update;
    }

}
