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

## Solution

## Pseudocode
```
int add(int a, int b)
{
    if (!b)
        return a;

    int sum = a ^ b;
    int carry = (a & b) << 1;

    return add(sum,carry);
}
```
