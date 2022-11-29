# Telephone

```
EOA ------> Contract
            msg.sender = EOA address
            tx.origin = EOA address

EOA ------> Contract A  --------------> Contract B
            msg.sender = EOA address    msg.sender = Contract A address
            tx.origin = EOA address     tx.origin = EOA address
```

#### tx.origin

-   EOA that started the transaction
-   Only EOA can be tx.origin

#### msg.sender

-   The immediate account of tracnsaction or call
-   EOA and contract can be the msg.sender

---

-   https://solidity-by-example.org/hacks/phishing-with-tx-origin/
-   https://blog.dixitaditya.com/ethernaut-level-04-telephone
-   https://0xsage.medium.com/ethernaut-lvl-4-walkthrough-how-to-abuse-tx-origin-msg-sender-ef37d6751c8
