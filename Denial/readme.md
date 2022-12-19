# Denial

## transfer, send, call

-   `transfer` forward 2300 gas, will throw an error if the transfer fails.
-   `send` forward 2300 gas, returns a boolean value indicating whether the transfer was successful.
-   `call` forward all remaining gas or a specified amount of gas, returns a boolean value indicating whether the call was successful.

## error handling

Since Solidity version 0.8.0, the assert function has been implemented using the `REVERT` opcode. This means that **assert no longer consumes all of the available gas**, as it did when it used the `INVALID` (`0xFE`) opcode. Instead, assert and require now both use the `REVERT` opcode (`0xFD`), which does not drain the gas.

## Attack

Since all the gas is forwarded at `partner.call{value:amountToSend}("")`, it is possible to drain all of the gas and cause the smart contract to revert due to an `Out of Gas` exception.

---

-   https://solidity-by-example.org/sending-ether/
-   https://fravoll.github.io/solidity-patterns/secure_ether_transfer.html
-   https://consensys.github.io/smart-contract-best-practices/development-recommendations/general/external-calls/
-   https://blockchain-academy.hs-mittweida.de/courses/solidity-coding-beginners-to-intermediate/lessons/solidity-2-sending-ether-receiving-ether-emitting-events/topic/sending-ether-send-vs-transfer-vs-call/

-   https://github.com/CeTesDev/EthernautLevels/tree/main/denial
-   https://medium.com/@this_post/ethernaut-20-denial-writeups-17ed0bdc8857
