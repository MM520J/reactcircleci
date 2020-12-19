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
3=>3
3:x
4 knowing 3:x => 4
4


(let var = e1:t1 in e2:t2):t2

1. e1 is evaluated to a value, v1
2. bind v1 to the varaible var, v1:var
3. evaluate e2 knowing {v1:var} to a value v2
4. return v2

let x = 3 in let x = 4 in x + x
let x = 3 in z
let x = 3 in 8
z = let x = 4 in x + x => 8


e1:3=>3
t1:int {x:3}
e2: let x = 4 in x + x
t2