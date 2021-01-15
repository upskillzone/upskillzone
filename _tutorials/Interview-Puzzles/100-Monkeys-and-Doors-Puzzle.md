---
layout: default
title: 100 Monkeys and Doors Puzzle
parent: Interview Puzzles
nav_order: 3
nav_exclude: true
---

# 100 Monkeys and Doors Puzzle
There are 100 doors in a row, all of them are initially in closed state. And
there are 100 monkeys (or 100 People) as well. All monkeys walks through all
the doors one by one. Each monkey toggles the door (that means, closing if the
door is opened or opening if the door is closed) while walking through the
doors. This toggling on door is performed by monkeys in below mentioned order.
- 1st monkey toggles all the doors.
- 2nd monkey toggles 2nd, 4th, 6th, ... 100th door.
- 3rd monkey toggles 3rd, 6th, 9th, ... 99th door.
- 4th monkey toggles 4th, 8th, 12th, ... 100th door.
- ...
- 50th monkey toggles 50th and 100th door.
- 100th monkey toggles only 100th door.

Puzzle is to find out **which all doors are opened at the end after all the
monkeys walkthrough the doors** ?

## 1. Solution
Here the initial state of door is closed, so if a door is toggled two times then
it will be in closed state. That means for even number of toggles the door state
will be closed. Similarly for odd number of toggles the door state will be
opened. **So need to find which all doors are toggled by monkey in odd number of
times**.

### 1.1 Understanding Factors of Number
A door is toggled by `i`th monkey if `i` divides door number. So need to
understand `factors of a number` concept here.

**Factors of a number** are a set of numbers which all can divides an another
number evenly. For example `Factors of 10` are `1, 2, 5, 10`. That means, there
are four factors for the number `10`, all four of them can divide number `10`
evenly. These four numbers are factors of `10`. This number of factors varies
for different numbers. For example number `20` has `6` factors which are
`1, 2, 4, 5, 10, 20`.

All numbers has a minimum of two factors, one of them is `1` and the another is
the same number itself. And all prime numbers has only these two as factors, no
other factors. Because it is not divisible by any other number, thats why it
is called as Prime number.

These factors are always occurs as pair. For example take the factors of the
number `20`, 
- `1 x 20 = 20`: So both `1` and `20` are factors of `20`.
- `2 x 10 = 20`: So both `2` and `10` are factors of `20`.
- `4 x 5 = 20`: So both `4` and `5` are factors of `20`.

As these factors are occuring in pairs, total number of factors for a numbers
are always even except for perfect squares.

Perfect squares (`1`, `4`, `9`, `16` ...) are the one which has odd number of
factors. Because **perfect squares are the one which results to a multiplication
of two same numbers**. For example factors of `16` are `1, 2, 4, 8, 16`.
- `1 x 16 = 16`: So both `1` and `16` are factors of `16`.
- `2 x 8 = 16`: So both `2` and `8` are factors of `16`.
- `4 x 4 = 16`: So `4` is factor of `16`. No duplicate in the list of factors.

So all perfect square numbers (`1`, `4`, `9`, `16`, ...) has odd number of
factors.

### 1.2 Using Factors of Number to solve 100 Doors Puzzle
In 100 Door Puzzle, each monkey toggles the door **if the door number is
divisible by monkey number**. That means every door is toggled for the factors
of that door number. That means door number `10` is toggled by 4 times, by the
1st, 2nd, 5th and 10th monkeys. Similarly door number `20` is toggled by 6
times.

So to find out which all doors are opened after all the monkeys walk through,
need to find out which all doors are toggled in odd number of times.

As odd number of factors are available only for perfect square numbers, only
perfect square number doors (`1`, `4`, `9`, `16`, ... `81`) are toggled odd
number of times. So these doors are opened at the end. All other doors (`2`,
`3`, `5`, ... `100`) are closed at the end.



