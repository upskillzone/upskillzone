---
layout: default
title: Swap two numbers without using temporary variable
parent: Interview Programs
nav_order: 2
nav_exclude: true
---

# Swap two numbers without using temporary variable
Swapping two numbers need a temporary variable like mentioned below.
```
tmp = num1;
num1 = num2;
num2 = tmp;
```
Can we achieve swapping of two numbers without using temporary variable ?

## 1. Solution
This can be achieved using three methods which are described below.

### 1.1 Solution with addition and subtraction operation
1. First add both the numbers and store in `num1` variable itself.
2. Then subtract `num2` from `num1` and store the result on `num2`. Now `num2`
gets the value of `num1`.
3. Similarly subtract `num2` from `num1` and store the result on `num1`.
```
num1 = num1 + num2;
num2 = num1 - num2;
num1 = num1 - num2;
```

- Here the assumption is, the addition of two number does not overflow. If
overflows this is not the right solution.

### 1.2 Solution with multiplication and division operation
Similarly swapping of two numbers can be achieved using multiplication and
division.

```
num1 = num1 * num2;
num2 = num1 / num2;
num1 = num1 / num2;
```
- This solution is also not suitable if multiplication of two number
overflows.

### 1.3 Solution with XOR operation
Solution with XOR operation is the best solution if above 2 solution
applicability fails due to overflow. Consider two number as `7` (`111`) and
`5` (`101`).
1. First XOR both number and store the result `2` (`010`) in `num1`.
2. Then XOR `num1` and `num2` and store the result `7` (`111`) in `num2`.
3. Then XOR `num1` and `num2` and store the result `5` (`101`) in `num1`.
Swapping is done !

```
num1 = num1 ^ num2;
num2 = num1 ^ num2;
num1 = num1 ^ num2;
```
