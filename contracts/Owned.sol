pragma solidity ^0.4.20;

/**
 *Base for contracts that specify access rules to owners contract owners.
 */

contract Owned {

    event LogNewOwner(address oldOwner, address newOwner);

    address public owner;

    function Owned() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    function changeOwner(address newOwner) onlyOwner returns (bool Success) {
        require(newOwner != 0);
        LogNewOwner(owner, newOwner);

        owner = newOwner;
        return true;
    }

}
