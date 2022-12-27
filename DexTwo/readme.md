# Dex Two

"Dex Two" is similar to the "Dex" except the first `require` statement has been removed from the `swap` function:

```solidity
require((from == token1 && to == token2) || (from == token2 && to == token1), "Invalid tokens");
```

The vulnerability in this case arises from the `swap` method, which does not verify that the tokens being swapped are necessarily token1 and token2. This means that it is possible to perform a swap using tokens other than token1 and token2

To take advantage of this vulnerability, we can create our own ERC20 token called "ATK Token" and mint us at least 400 ATK. Then, we will send 100 ATK by using ATK Token's `transfer` function to the Dex Two contract to establish a price ratio of 1:1 when swapping.

Next, we will use the `approve` function of the ATK Token to give the Dex Two permission to spend up to 300 of our ATK Token. This will allow us to swap 100 token1 and 200 token2 using the `swap` function of the Dex Two contract.

<table>
    <thead>
        <tr>
            <th rowspan="2">Swap</th>
            <th colspan="3">Dex</th>
            <th colspan="2">Player</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td></td>
            <td>token 1</td>
            <td>token 2</td>
            <td>ATK Token</td>
            <td>token 1</td>
            <td>token 2</td>
        </tr>
        <tr>
            <td>transfer atk token to dex </td>
            <td>100</td>
            <td>100</td>
            <td>100</td>
            <td>10</td>
            <td>10</td>
        </tr>
        <tr>
            <td>swap(atkToken, token1, 100)</td>
            <td>0</td>
            <td>100</td>
            <td>200</td>
            <td>110</td>
            <td>10</td>
        </tr>
        <tr>
            <td>swap(atkToken, token2, 200)</td>
            <td>0</td>
            <td>0</td>
            <td>400</td>
            <td>110</td>
            <td>110</td>
        </tr>
    </tbody>
</table>

---

-   https://medium.com/@this_post/ethernaut-22-dex-writeups-55d4bfa8a7fa
-   https://dev.to/nvn/ethernaut-hacks-level-23-dex-two-4424
