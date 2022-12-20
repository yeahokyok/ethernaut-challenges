# Shop

The Shop contract does not implement the `price()` function from the Buyer interface. This allows an attacker to create a contract that has its own implementation of this function.

Since `price()` is a view function, it is not possible to update state like the `Elevator`

> Functions can be declared view in which case they promise not to modify the state.\
>  https://docs.soliditylang.org/en/latest/contracts.html#view-functions

## Attack

The `buy()` calls the `price()` twice:

1. The return price must be greater than 100

2. Update the price: return a value less than 100
