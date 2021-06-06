---
layout: post
date:   2021-06-04 00:18:00 +0530
title:  Egg Dropping Puzzle - n eggs and m floors
author: Ashok Karmegam
categories:
    - puzzles
tags:
    - puzzle
    - interview questions
---

Given *n* number of Eggs are identical in dimension and there is a multistorey
building with *m* floors. In that building only initial few floors will be safe
for Dropping Eggs, which means egg wont break when it is dropped. After that
all above floors are unsafe for Egg Dropping.

**The Puzzle is to
find till which number of floors, dropping egg is safest with optimal number of 
tries (dropping eggs) ?**
- *n* number of eggs are given. All of the eggs are allowed to break in the
process of solving this Puzzle.
- Optimial solution for this Puzzle should be with less number of drops.
- Don't try to solve this puzzle by considering Earth's gravity. Because
randomly initial few floors are considered as safest to evaluate the Solution's
optimality.
- If the egg does't break at a certain floor means, it wont break on all the
below floors.
- Similarly if the egg breaks at a certain floor means, it will break on 
all the above floors.
- The eggs that are not broken on a drop can be reused to drop on another
attempt.

## 1. Solution
Simplest and unoptimal solution comes to mind immediatly is just take one of
the egg and keep dropping from floor *1* to *m*. Continue this process on
each floor till the egg breaks. Once the egg breaks the safest floors are found.
Floors below the floor on which it breaks are the safest floors.

Above solution is based on Linear traversal, worst case complexity is *O(m)*.
To get optimal results, need to pick the floor based on Binary Search (also
called as Logarithmic Search). But this has a risk of breaking all eggs
before finding the results.

So the Optimal Solution can be achieved by combining both Binary and Linear
Search.
- Pick the floors based on Binary Search and drop the egg till the remainings
eggs are more than one.
- Once the remaining egg is only one, then stop Binary Search and start Linear
Search.

### 1.2 Detailed Solution explanation with Youtube Video
- In below Youtube video, I have explained this puzzle solution with examples.

<iframe width="560" height="315" src="https://www.youtube.com/embed/Q9fwrjU0Aso" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## 2. Algorithm Pseudocode
- Algorithm pseudocode for the above explained solution is given below.

```
uint32_t find_safest_floors(uint32_t n_eggs, uint32_t m_floors)
{
  uint32_t start = 1, floor;
  uint32_t end = m_floors;
  do {
    /* Always start and end points to the unchecked floors */
    if (n_eggs > 1) {
      /* Do binary traversal */
      if (end != start) {
        floor = start + ((end - start) / 2);
      } else {
        floor = start;
        /* This is the last check */
      }
    } else {
      /* Do linear traversal */
      floor = start;
    }
    if (check_safe(floor) == 1) {
      if (floor < end) {
        /* Checking floor range adjustment */
        /* If some more floors are there then point start next to
         * current floor. */
        start = floor + 1;
      } else {
        /* else we found it */
        return floor;
      }
    } else {
      if (n_eggs > 1) {
        /* If we are in binary traversal */
        n_eggs--; /* Reduce egg count, as one egg is broken */
        if (floor > start) {
          /* Checking floor range adjustment */
          /* If current checking floor is greater than start then
           * assign (floor - 1) to end. */
          end = floor - 1;
        } else {
          /* else we found it */
          return (floor - 1);
        }
      } else {
        /* else in linear traversal */
        /* Found it */
        return (floor - 1);
      }
    }
  } while (1);
}
```

## 3. Complete Implementation in C Language
C Program implementation for this Egg dropping puzzle is available in
[https://github.com/upskillzone/upskillzone-programs/tree/main/puzzles/egg-dropping-puzzle](https://github.com/upskillzone/upskillzone-programs/tree/main/puzzles/egg-dropping-puzzle).
