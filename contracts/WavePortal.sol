// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {

    uint256 totalWaves;
    address[] addresses;

    event NewWave(address indexed from, uint256 timestamp, string message);

    struct Wave {
        address waver; 
        string message; 
        uint256 timestamp;
    }

    Wave[] waves;

    constructor() payable {
        console.log("Hello, I'm contract and maybe smart");
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        addresses.push(msg.sender);
        console.log("%s say bye bye, with message %s", msg.sender, _message);

        waves.push(Wave(msg.sender, _message, block.timestamp));

        emit NewWave(msg.sender, block.timestamp, _message);

        uint256 prizeAmount = 0.0001 ether;
        
        require(
        prizeAmount <= address(this).balance,
        "Trying to withdraw sacar more money than the contract has"
        );
        
        (bool success, ) = (msg.sender).call{value: prizeAmount}("");
        
        require(success, "Failed to withdraw money from the contract.");
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
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