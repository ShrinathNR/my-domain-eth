// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.10;

import "hardhat/console.sol";

contract Domains {
    //map of domains to address
    mapping(string => address) public domains;

    mapping(string => string) public twitterRecord;

    constructor() {
        console.log("this is a domain contract");
    }

    function register(string calldata name) public {
        //check whether the domain already exist
        require(domains[name] == address(0));

        domains[name] = msg.sender;
        console.log("%s has registered in domain name: %s", msg.sender, name);
    }

    function getAddress(string calldata name) public view returns (address) {
        return domains[name];
    }

    function setTwitterID(string calldata name, string calldata twitterID)
        public
    {
        console.log(
            "%s is trying to access the domain name : %s",
            msg.sender,
            name
        );
        require(
            domains[name] == msg.sender,
            "you are not the owner of the domain"
        );

        twitterRecord[name] = twitterID;
    }

    function getTwitterID(string calldata name)
        public
        view
        returns (string memory)
    {
        return twitterRecord[name];
    }
}
