# Gatekeeper Two

### Gate 1

use contract to attack will pass the gate 1

### Gate 2

> During initialization code execution, `EXTCODESIZE` on the address should return zero, which is the length of the code of the account while `CODESIZE` should return the length of the initialization code

so call `enter(bytes8 _gateKey)` from the attack contract's constructor the `extcodesize(caller())` will be 0

### Gate 3

```solidity
  modifier gateThree(bytes8 _gateKey) {
    require(uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(_gateKey) == type(uint64).max);
    _;
  }
```

Since a ^ b = c implies a ^ c = b \
a = `uint64(bytes8(keccak256(abi.encodePacked(msg.sender))))`\
b = `uint64(_gateKey)`\
c = `type(uint64).max)`

```solidity
uint64 _gateKey = uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ type(uint64).max)
```

`_gateKey` solution

```solidity
bytes8 _gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ type(uint64).max)
```

---

-   https://ardislu.dev/ethernaut/14
-   https://www.linkedin.com/pulse/ethernaut-gatekeepertwo-balaji-shetty-pachai
-   https://www.youtube.com/watch?v=PYzz33wEwYE
