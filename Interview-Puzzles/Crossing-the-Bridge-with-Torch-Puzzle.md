---
layout: default
title: Crossing the Bridge with Torch Puzzle
parent: Interview Puzzles
nav_order: 2
nav_exclude: true
---

# Crossing the Bridge with Torch Puzzle
Few people are trying to cross an old and rusty bridge in a night. Conditions
for crossing the bridge are
- Only 2 person can be on the bridge at a time.
- Crossing without torch is impossible.
- Each person takes different time to cross the bridge, because of different
age groups of people. So when 2 person crosses, faster walking person also
should walk equally to the slower walking person. So that both can walk on torch
light.

Puzzle is to find, **what is the shortest duration taken by all the people to
cross the bridge?**

## 1. Solution
Solution is to keep moving 2 people at a time with a torch in multiple batches.
After every movement, a fastest walking person who reached the destination
should come back to the starting place with the torch so that remaining people
can cross.

### 1.1 Solution with Example
Here the solution is explained with an example.
Consider four people are crossing the bridge and their time taken
to cross the bridge are given below.
- Person A takes 1 min
- Person B takes 2 mins
- Person C takes 6 mins
- Person D takes 10 mins

The solution to cross the bridge with above set of 4 people are
1. First find out two fastest walking person and move them. That means move A
and B. **This takes 2 mins**.
2. Now C and D are in starting place. A and B are in destination with torch.
Now bring back the torch with the help of fastest walking person on the
desitnation. That means, make A to bring back the torch. **This takes 1 min**.
3. Now A, C and D are in starting place with torch. B is in destination.
Now move 2 slowest walking person C and D to the destination. **This takes 10
mins**.
4. Now bring back torch with the help of fastest walking person B. **This takes
2 mins**.
5. Now move both A and B. **This takes 2 mins**.

Now all of them have crossed the bridge with 5 movement. Totally it takes
**17mins**.

### 1.2 General Solution
In this puzzle number of person varies, not always with 4 person. So solution
to solve with any number of person need to follow below procedure.
1. Move two fastest person.
2. If some more are waiting in the starting place, then bring back one fastest
person to starting place. Or else finished.
3. Move two slowest person.
4. If some more are waiting in the staring place, then bring back the one
fastest person to starting place. This person is nothing but the person who
moved in Step 2. Or else finished.
5. Now people who are in destination are slowest person, at this time need to
continue from Step1 to move two fastest person. Now moving slowest person is
not correct, because next time it will take more time to bring back torch.

Repeatedly doing above mentioned steps will solve the puzzle with any number of
persons. **Solution ends either at the Step2 or Step4 when there are no person
in the starting place**.
