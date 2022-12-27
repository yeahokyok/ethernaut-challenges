# Dex

> Since the type of the result of an operation is always the type of one of the operands, division on integers always results in an integer. In Solidity, division rounds towards zero
> https://docs.soliditylang.org/en/v0.8.17/types.html#division

`getSwapAmount` calculation is based on the x \* y = k constant function market maker, which is used to maintain a ratio between the two tokens in the pool. However, Solidity does not support floating point numbers, so division can produce unexpected results. This can potentially lead to issues in automated market makers that use this calculation.

<table>
    <thead>
        <tr>
            <th rowspan="2">Swap</th>
            <th colspan="2">Dex</th>
            <th colspan="2">Player</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td></td>
            <td>token 1</td>
            <td>token 2</td>
            <td>token 1</td>
            <td>token 2</td>
        </tr>
        <tr>
            <td>start</td>
            <td>100</td>
            <td>100</td>
            <td>10</td>
            <td>10</td>
        </tr>
        <tr>
            <td>swap(token1, token2, 10)</td>
            <td>110</td>
            <td>90</td>
            <td>0</td>
            <td>20</td>
        </tr>
        <tr>
            <td>swap(token2, token1, 20)</td>
            <td>86</td>
            <td>110</td>
            <td>24</td>
            <td>0</td>
        </tr>
        <tr>
            <td>swap(token1, token2, 24)</td>
            <td>110</td>
            <td>80</td>
            <td>0</td>
            <td>30</td>
        </tr>
        <tr>
            <td>swap(token2, token1, 30)</td>
            <td>69</td>
            <td>110</td>
            <td>41</td>
            <td>0</td>
        </tr>
        <tr>
            <td>swap(token1, token2, 41)</td>
            <td>110</td>
            <td>45</td>
            <td>0</td>
            <td>65</td>
        </tr>
        <tr>
            <td>swap(token2, token1, 45)</td>
            <td>0</td>
            <td>90</td>
            <td>110</td>
            <td>20</td>
        </tr>
    </tbody>
</table>

---

-   https://dev.to/nvn/ethernaut-hacks-level-22-dex-1e18
-   https://ardislu.dev/ethernaut/22
