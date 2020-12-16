(let var = e1:t1 in e2:t2):t2

let x = 3 in x + 4;;
var: x
e1: 3
t1:int
e2:x+4
t2:int

1. e1 is evaluated to a value, v1
2. bind v1 to the varaible var, v1:var
3. evaluate e2 knowing {v1:var} to a value v2
4. return v2

let x = 3 in 4
