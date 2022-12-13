# Gatekeeper One

### Gate 1

use contract to attack will pass the gate 1

### Gate 2

> Different Solidity compiler versions will calculate gas differently

I have tried to use Remix's Debug to get GAS opcode and look for the remaining gas but it didn't work well ;( so just brute force it

### Gate 3

for the gate 3 let's do the part 3 first

#### Part 3

```solidity
uint32(uint64(_gateKey)) == uint16(uint160(tx.origin))
```

```solidity
uint64(key) 			    // 00 00 00 00 00 00 90 1B
uint32(uint64(_gateKey)) 	// 00 00 90 1B
==
uint160(tx.origin) 		    // 0bae3B8E702eA3e9F85594ca69Baa9aA3f2F901B
uint16(uint160(tx.origin)) 	// 90 1B
```

the part 3 bytes 7-8 are the last of tx.origin and bytes 5-6 must be 0 \
so \_gateKey is ?? ?? ?? ?? 00 00 90 1B to pass the part 3

#### Part 1

```solidity
uint32(uint64(_gateKey)) == uint16(uint64(_gateKey))
```

```solidity
uint64(_gateKey)		    -- 00 00 00 00 00 00 90 1B
uint32(uint64(_gateKey))	-- 00 00 90 1B
==
uint64(_gateKey)		    -- 00 00 00 00 00 00 90 1B
uint16(uint64(_gateKey))	-- 90 1B
_gateKey = ?? ?? ?? ?? 00 00 ?? ??
```

the part 1 will pass if the bytes 5-6 are 0 \
so \_gateKey is ?? ?? ?? ?? 00 00 ?? ?? \
to pass the part 1 and 3 \_gateKey must be ?? ?? ?? ?? 00 00 90 1B

#### Part 2

```solidity
uint32(uint64(_gateKey)) != uint64(_gateKey)
```

```solidity
uint64(_gateKey)		    -- 11 11 11 11 00 00 90 1B
uint32(uint64(_gateKey))	-- 00 00 90 1B
!=
uint64(_gateKey)		    -- 00 00 00 01 00 00 90 1B
```

the part 1 will pass if the bytes **1-4 can be any but not 0**

**to pass the part 1, 2 and 3 \_gateKey can be 000000010000901B**

---

in Solidity ^0.8.0, this syntax is not valid:

```solidity
uint16(tx.origin)
```

Instead, you must do:

```solidity
uint16(uint160(tx.origin))
```

-   https://ethereum.stackexchange.com/questions/139164/about-conversions-on-solidity-0-8-x-ethernaut-gatekeeper-one
-   https://ethereum.stackexchange.com/questions/70172/what-is-meaning-of-address-equivalent-to-uint160-except-for-the-assumed-inter

---

-   https://wizzardhat.com/ethernaut-level-13-gatekeeperone/
-   https://dev.to/nvn/ethernaut-hacks-level-13-gatekeeper-one-3ljo
-   https://blog.learnweb3.io/ethernaut-gatekeeper-one-walkthrough
-   https://ardislu.dev/ethernaut/13
-   https://medium.com/coinmonks/ethernaut-lvl-13-gatekeeper-1-walkthrough-how-to-calculate-smart-contract-gas-consumption-and-eb4b042d3009
