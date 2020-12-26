---
layout: default
title: Egg Dropping Puzzle - n eggs and m floors
parent: Interview Puzzles
nav_order: 1
nav_exclude: true
---

# Egg Dropping Puzzle - n eggs and m floors
Given *n* number of Eggs are identical in dimension and there is a multistorey
building with *m* floors. In this building initial few floors will be safe 
for Dropping Eggs, which means egg wont break when it is dropped. After that
floor, all above floors are unsafe for Egg Dropping.

**The Puzzle is to
find till which number of floors, dropping egg is safest with optimal number of 
drops ?**
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

## 1. Solution
Simplest and unoptimal solution comes to mind immediatly is just take one of
the egg and keep dropping from floor *1* to *m*. Continue this process on
each floor till the egg breaks. Once the egg breaks the safest floors are found.
Floors below the floor on which it breaks are the safest floors.

Above solution is based on Linear traversal, worst case complexity is *O(m)*.
To get optimal results, need to pick the floor based on Binary Search (also
called as Logarithmic Search). But this has a risk of breaking all eggs
before finding the results.

So the Optimal Solution can be achieved by combining Binary and Linear Search.
- Pick the floors based on Binary Search and drop the egg till the remainings
eggs are more than one.
- Once the remaining egg is only one, then stop Binary Search and start Linear
Search.

## 2. Algorithm Pseudocode
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
```
#include <stdio.h>
#include <stdint.h>
#include <getopt.h>
#include <stdlib.h>

enum enum_opt {
  OPT_HELP = 1,
  OPT_EGGS,
  OPT_FLOORS,
  OPT_SAFE_FLOOR
};

struct option lopts[] = {
  {"help", no_argument, NULL, OPT_HELP},
  {"eggs", required_argument, NULL, OPT_EGGS},
  {"floors", required_argument, NULL, OPT_FLOORS},
  {"safe-floor", required_argument, NULL, OPT_SAFE_FLOOR},
};

void help()
{
  printf("Program to perform optimized checks to find which floor is safest\n");
  printf("among m floors, when eggs are dropped.\n");
  printf("This program takes input as n eggs, m floors, and safe floor\n");
  printf("By using these inputs the program gives output as how many\n");
  printf("minimum checks are needed to find the safe floor\n");
  printf("\nUsage:\n");
  printf("<exe> --eggs <count> --floors <count> --safe-floor <floor-num>\n");
  exit(0);
}

uint32_t m_floors, n_eggs, safe_floor;
uint32_t num_of_checks = 0;

int check_safe(uint32_t floor)
{
  num_of_checks++;
  if (floor <= safe_floor) return 1;
  return 0;
}

uint32_t find_safest_floors(uint32_t n_eggs, uint32_t m_floors)
{
  uint32_t start = 1, floor;
  uint32_t end = m_floors;
  printf("%u eggs and %u floors\n", n_eggs, m_floors);
  do {
    printf("Check among floors between %u and %u with %u eggs\n", start, end,
            n_eggs);
    /* Always start and end points to the unchecked floors */
    if (n_eggs > 1) {
      printf(" - Doing binary traversal\n");
      /* Do binary traversal */
      if (end != start) {
        floor = start + ((end - start) / 2);
      } else {
        floor = start;
        /* This is the last check */
      }
    } else {
      printf(" - Doing linear traversal\n");
      /* Do linear traversal */
      floor = start;
      /* TODO Need to add max check */
    }
    printf(" - Checking floor %u\n", floor);
    if (check_safe(floor) == 1) {
      printf(" - %u is safe floor\n", floor);
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
      printf(" - %u is unsafe floor\n", floor);
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

int main(int argc, char *argv[])
{
  uint32_t floor;
  int opt;
  while ((opt = getopt_long(argc, argv, "", lopts, NULL)) != -1) {
    switch (opt) {
      case OPT_EGGS:
        n_eggs = atoi(optarg);
        break;
      case OPT_FLOORS:
        m_floors = atoi(optarg);
        break;
      case OPT_SAFE_FLOOR:
        safe_floor = atoi(optarg);
        break;
      case OPT_HELP:
      default:
        help();
    }
  }

  if ((n_eggs == 0) || (m_floors == 0)) {
    printf("Invalid eggs(%u) or floors(%u)\n", n_eggs, m_floors);
    return -1;
  }
  floor = find_safest_floors(n_eggs, m_floors);
  printf("It took %u checks to find safest floor %u out of %u floors with %u " \
          "eggs\n", num_of_checks, floor, m_floors, n_eggs);
  return 0;
}
```

## 4. Output
- Below is the operation of the algorithm for **10 floors and 5 eggs** with 
the safest floor 4.

```
$ ./a.out --eggs 5 --floors 10 --safe-floor 4
5 eggs and 10 floors
Check among floors between 1 and 10 with 5 eggs
 - Doing binary traversal
 - Checking floor 5
 - 5 is unsafe floor
Check among floors between 1 and 4 with 4 eggs
 - Doing binary traversal
 - Checking floor 2
 - 2 is safe floor
Check among floors between 3 and 4 with 4 eggs
 - Doing binary traversal
 - Checking floor 3
 - 3 is safe floor
Check among floors between 4 and 4 with 4 eggs
 - Doing binary traversal
 - Checking floor 4
 - 4 is safe floor
It took 4 checks to find safest floor 4 out of 10 floors with 5 eggs
```

- Below is the operation of the algorithm for **10 floors and 2 eggs** with 
the safest floor 4.

```
$ ./a.out --eggs 2 --floors 10 --safe-floor 4
2 eggs and 10 floors
Check among floors between 1 and 10 with 2 eggs
 - Doing binary traversal
 - Checking floor 5
 - 5 is unsafe floor
Check among floors between 1 and 4 with 1 eggs
 - Doing linear traversal
 - Checking floor 1
 - 1 is safe floor
Check among floors between 2 and 4 with 1 eggs
 - Doing linear traversal
 - Checking floor 2
 - 2 is safe floor
Check among floors between 3 and 4 with 1 eggs
 - Doing linear traversal
 - Checking floor 3
 - 3 is safe floor
Check among floors between 4 and 4 with 1 eggs
 - Doing linear traversal
 - Checking floor 4
 - 4 is safe floor
It took 5 checks to find safest floor 4 out of 10 floors with 2 eggs
```
