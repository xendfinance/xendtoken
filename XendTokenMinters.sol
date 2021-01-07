pragma solidity ^0.6.4;
import "./Ownable.sol";

contract XendTokenMinters is Ownable {
    mapping(address => bool) public minters;

    modifier onlyMinter() {
        bool hasAccess = minters[msg.sender];
        require(
            hasAccess == false,
            "mint access has not been granted to this account"
        );
        _;
    }

    function grantAccess(address minter) public onlyOwner {
        bool hasAccess = minters[minter];

        require(hasAccess == false, "minter has already been granted access");
        minters[minter] = true;
    }

    function revokeAccess(address minter) public onlyOwner {
        bool hasAccess = minters[minter];

        require(hasAccess == false, "minter has not been granted access");
        minters[minter] = false;
    }
}
