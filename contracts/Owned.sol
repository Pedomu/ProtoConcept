pragma solidity ^0.4.20;

/**
 *Base for contracts that specify access rules to owners contract owners.
 */

contract Owned {

    event LogNewOwner(string oldOwnerName, address oldOwner, string newOwnerName, address newOwner);
    event LogDeleteOwner(string killOwnerName, address killOwner);

    address public owner;
    string public ownerName;
    string public ownerEmail;
    string public ownerPhone;

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    function Owned(string _ownerName, string _ownerEmail, string _ownerPhone) public {
        owner = msg.sender;
        ownerName = _ownerName;
        ownerEmail = _ownerEmail;
        ownerPhone = _ownerPhone;
    }

    function changeOwner(address _newOwner, string _newOwnerName, string _newOwnerEmail, string _newOwnerPhone) public onlyOwner {
        require(_newOwner != 0);
        emit LogNewOwner(ownerName, owner, _newOwnerName, _newOwner);

        owner = _newOwner;
        ownerName = _newOwnerName;
        ownerEmail = _newOwnerEmail;
        ownerPhone = _newOwnerPhone;
    }

    function deleteOwner(address outOwner) public onlyOwner {
        emit LogDeleteOwner(ownerName, outOwner);

        owner = 0x0;
        delete ownerName;
        delete ownerEmail;
        ownerPhone = ""; //which is more efficient?
    }

    // function ownerInfo(string _ownerName) public view returns (address _infoAddress, string _infoEmail, string _infoPhone){
    //     require(ownerName == _ownerName);
    //     return (owner, ownerEmail, ownerPhone);
    // }

}
