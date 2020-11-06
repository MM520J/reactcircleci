
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