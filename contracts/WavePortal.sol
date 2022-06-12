// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {

    uint256 totalWaves;
    address[] addresses;

    constructor() {
        console.log("Hello, I'm contract and maybe smart");
    }

    function wave() public {
        totalWaves += 1;
        addresses.push(msg.sender);
        console.log("%s say bye bye!", msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have a total of %d goodbyes!", totalWaves);
        return totalWaves;
    }

    function getListOfAddresses() public view {
        for (uint256 i = 0; i < addresses.length; i++) {
            console.log("Address", i, ":" , addresses[i]);
        }
    }
}