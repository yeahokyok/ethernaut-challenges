# Magic Number

> [EVM Opcodes Reference](https://www.ethervm.io/)

> Contract creation byte code = initialization byte code + runtime byte code

#### runtime opcode

```
60 2a   // PUSH1 2a 2a(hexadecimal) = 42(decimal)
60 40   // PUSH1 40 memory 40 (random pick)
52      // MSTORE store 2a(hex) in memory position 40
60 20   // PUSH1 20 20(hexadecimal) = 32(decimal)
60 40   // PUSH1 40 memory 40
f3      // RETURN return 32 bytes in memory 40
```

runtime byte code: 602a60405260206040f3

#### initialization opcode

```
60 0a   // PUSH1 10 bytes (runtime code length)
60 ??   // PUSH1 position of runtime code (don't know yet)
60 00   // PUSH1 destination in memory
39      // CODECOPY
60 0a   // PUSH1 10 bytes (runtime code length)
60 00   // PUSH1 access memory 00
f3      // RETURN
```

initialization byte code is 600a60??600039600a6000f3 which is 12 bytes
so the runtime byte code start at index 12(0c in hexadecimal)

initialization byte code: 600a600c600039600a6000f3

---

The contract creation byte code:

```
600a600c600039600a6000f3602a60405260206040f3
----initialization------|------runtime------
```

deploy contract from byte codes

```javascript
await web3.eth.sendTransaction({
    from: player,
    data: "600a600c600039600a6000f3602a60405260206040f3",
})
```

then call setSolver with deployed contract address

```javascript
await contract.setSolver(<address>)
```
