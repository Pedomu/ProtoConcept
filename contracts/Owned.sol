pragma solidity ^0.4.20;

/**
 *Base for contracts that specify access rules to owners contract owners.
 */

contract Owned {

    event LogNewOwner(address oldOwner, address newOwner);
    event LogDeleteOwner(address killOwner);

    address public owner;

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    function Owned() public {
        owner = msg.sender;
    }

    function changeOwner(address newOwner) public onlyOwner {
        require(newOwner != 0);
        emit LogNewOwner(owner, newOwner);

        owner = newOwner;
    }

    function deleteOwner(address outOwner) public onlyOwner {
        emit LogDeleteOwner(outOwner);

        owner = 0x0;
    }

}
