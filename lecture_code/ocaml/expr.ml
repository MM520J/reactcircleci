
int things
  +, -, *, /
  (e1:int + e2:int):int

float things
  +., -., *., /.
  (e1:float +. e2:float ):float

string things
  (e1:string ^ e2:string):string
  
bool things
  &&, ||, !
  (e1:bool && e2:bool):bool

conditionals
  (if (e1:bool) then e2:'a else e2:'a):'a

let expressions
  (let x = e1:'a in x):'a
  (let x a1:'a a2:'b ...= e1:'tx in x):'a->'b->...->'ty
  (let x = e1:'a in e2:'b):'b

function calls
  (f x1 x2 ...)
  which has type:
  (f: 'a 'b ... -> 't x1:'a x2:'b ...):'t

list things
  ([e1:'a;e2:'a;...]):'a list
  (e1:'a :: e2:'a list):'a list

tuples
  ((e1:'a,e2:'b,...)):'a * 'b *...

pattern match
  (match e1:'a with
     p1 -> e1:'b
    |p2 -> e2:'b
    ...
    ):'b

constants
  1:int
  1.3:float
  true:bool
  "String":string
  (fun x -> x + x):int -> int

variants (not expression. Is a definition)
  (type x = A|B|...):x
  (type x = {var1:'a;var2:'b;...}:x

let bindings (not expressions, different than let expressions)
(let x = expr1:'t):'t;;
(let f x:'a y:'b ...  = expr1:'t) 'a -> 'b -> ... 't);;

let x = 5;;
x + 6;;

5 + 6

(fun a1 a2 a3... -> e)

let area l w = l*w;;


let area l w = l * w

let area = (fun l w -> l * w);;

let area = fun l -> (fun w -> l * w)