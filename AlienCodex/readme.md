# Alien Codex

the `AlienCodex` is inherited `Ownable` contract which has `address private _owner` and it will be store in the 0 slot

function `retract` will cause underflow array by `codex.length - 1` which can modify all storage slots.

> FYI, in solidity ^0.6.0 `.length` is read-only

## How to locate `_owner`

-   the EVM has 2^256 - 1 storage slots of 32 bytes each
-   `_owner` is in slot 0
-   `codex` is a dynamic array so `codex.length`store in storage slot which is slot 1
-   the data of `codex` start at `keccak256(p)` where `p` is the slot of `codex.length` stored so the data start at `keccak256(bytes32(1))`

| Slot        |                   Data |
| ----------- | ---------------------: |
| 0           |      contract, \_owner |
| 1           |           codex.length |
| p           |               codex[0] |
| p + 1       |               codex[1] |
| ...         |                    ... |
| 2 ^ 256 - 1 | codex[2 ^ 256 - 1 - p] |
| 0           |     codex[2 ^ 256 - p] |

`_owner` location would be `2 ** 256 - keccak256(bytes32(1))`

> In practice, you should get the index with the Solidity expression like: `2**256 - 1 - uint256(keccak256(bytes32(p))) + 1` instead of `2**256 - uint256(keccak256(bytes32(p)))`, because of compile error for the larger number operand than MAX_UINT256. Or `2 ** 256 - 1 - uint256(keccak256(abi.encode(1))) + 1` for Solc v0.5 or higher\
> https://github.com/CeTesDev/EthernautLevels/tree/main/alien-codex

```solidity
uint256 ownerIndex = 2 ** 256 - 1 - uint256(keccak256(abi.encode(1))) + 1;
```

---

-   https://medium.com/coinmonks/ethernaut-alien-codex-solution-74e3b0ca592e
-   https://github.com/CeTesDev/EthernautLevels/tree/main/alien-codex
-   https://listed.to/@r1oga/13892/ethernaut-levels-19-to-21
-   https://blog.dixitaditya.com/ethernaut-level-19-alien-codex
