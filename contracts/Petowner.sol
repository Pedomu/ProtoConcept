pragma solidity ^0.4.20;

/**
 *Base for contracts that specify access rules to pet_owner contract owners.
 */

contract Petowner {

    event LogNewPetOwner(string oldOwnerName, address oldOwner, string newOwnerName, address newOwner);
    event LogDeletePetOwner(string killOwnerName, address killOwner);

    address public petOwner;
    string public petOwnerName;
    string public petOwnerEmail;
    string public petOwnerPhone;

    modifier onlyPetOwner {
        require(petOwner == msg.sender);
        _;
    }

    function Petowner(string _petOwnerName, string _petOwnerEmail, string _petOwnerPhone) public {
        petOwner = msg.sender;
        petOwnerName = _petOwnerName;
        petOwnerEmail = _petOwnerEmail;
        petOwnerPhone = _petOwnerPhone;
    }

    function changePetOwner(address _newPetOwner, string _newPetOwnerName, string _newPetOwnerEmail, string _newPetOwnerPhone) public onlyPetOwner {
        require(_newPetOwner != 0);
        emit LogNewPetOwner(petOwnerName, petOwner, _newPetOwnerName, _newPetOwner);

        petOwner = _newPetOwner;
        petOwnerName = _newPetOwnerName;
        petOwnerEmail = _newPetOwnerEmail;
        petOwnerPhone = _newPetOwnerPhone;
    }

    function deleteOwner(address _deletePetOwner) public onlyPetOwner {
        require(_deletePetOwner == msg.sender);
        emit LogDeletePetOwner(petOwnerName, _deletePetOwner);

        petOwner = 0x0;
        delete petOwnerName;
        delete petOwnerEmail;
        petOwnerPhone = ""; //which is more efficient?
    }

    // function ownerInfo(string _ownerName) public view returns (address _infoAddress, string _infoEmail, string _infoPhone){
    //     require(ownerName == _ownerName);
    //     return (owner, ownerEmail, ownerPhone);
    // }

}
