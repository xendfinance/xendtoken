pragma solidity 0.6.6;
import "./Ownable.sol";

contract XendTokenMinters is Ownable {
    mapping(address => bool) public minters;

    modifier onlyMinter() {
        bool hasAccess = minters[msg.sender];
        require(hasAccess == true,
            "mint access has not been granted to this account"
        );
        _;
    }

    function grantAccess(address minter) public onlyOwner {
        bool hasAccess = minters[minter];
        minters[minter] = true;
    }

    function revokeAccess(address minter) public onlyOwner {
        bool hasAccess = minters[minter];
        minters[minter] = false;
    }
}
