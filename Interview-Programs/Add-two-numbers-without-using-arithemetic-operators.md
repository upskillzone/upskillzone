---
layout: default
title: Add two numbers without using arithmetic operators
parent: Interview Programs
nav_order: 1
nav_exclude: true
---

# Add two numbers without using arithmetic operators
Need to add two number without using arithemetic operators like `+`, `-`, `*`,
`/`, `%`.

## 1. Solution
Adding two number without using arithmetic operators can be performed using
binary operators XOR (`^`) and AND (`&`).
1. First two number is XORed and stored the result in `sum` variable.
```
sum = num1 ^ num2;
```
2. Then same two number is ANDed and left shifted once and stored the result
in `carry` variable.
```
carry = (num1 & num2) << 1;
```
3. Then if `carry` is non zero then continue 1st and 2nd step by keeping
`sum` as first number and `carry` as second number.

Here 1st operation performs XOR operation on two numbers and that ommits the
carry on every bit. For example XORing two number `6` (`110`) and `4` (`100`)
gives result as `2` (`010`), 3rd position generates carry which needs to be
placed on 4th position that is not done by X0R. That is why 2nd operation is
needed here, that performs AND on the same two number and result is left shifted
to get `8` (`1000`).

Now redoing 1st and 2nd operation with first number as `2` and 2nd number as `8`
will get `10` as part of 1st operation. And `0` as part of 2nd operation. The
execution ends once the 2nd operation (carry generation) returns 0.

## 2. Algorithm Pseudocode

```
int add(int num1, int num2)
{
  int sum, carry;
  do {
    sum = num1 ^ num2;
    carry = (num1 & num2) << 1;
    num1 = sum;
    num2 = carry;
  } while (carry != 0);
  return sum;
}
```
