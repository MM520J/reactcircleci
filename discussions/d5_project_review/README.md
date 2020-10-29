# Discussion 5 - Friday, March 3<sup>rd</sup>

## Reminders
1. Quiz 2 is **today** March 3rd
2. Project 2b due March 12th 11:59PM
3. Exam 1 is coming up on March 14th

Today, we will be briefly discussing how to evaluate a subset of the `condition`s from Project 2b.

```ml
type condition = 
  | True
  | False
  | And of condition * condition
  | Or of condition * condition
  | Not of condition
  | If of condition * condition * condition
```
Notice how this definition is recursive. The “base cases” are True and False, and the other conditions have conditions within them. Some examples of conditions are:
- `Or(Not(True), False)`
- `And(Or(True, Not(False))), True)`
- `If(True, Or(True, False), And(False,Not(True)))`
-