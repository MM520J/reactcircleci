
let rec map f l = match l with
[] -> []
|h::t -> (f h)::(map f t);;

('a -> 'b) -> 'a list -> 'b list


let add3 x = x + 3 in 
map add3 [1;2;3]
4::5::6::[]

map add3 [1;2;3]
(int -> int) -> int list -> int list

map (fun a,b -> a + b) [(1,2);(3,4)]
(int*int -> int) -> int *int list -> int list

map (fun f -> f 3) [(fun x -> x + 1);(fun x -> x -2)];
((int->int) -> int) -> (int -> int) list -> int list

let rec foldl f a l = match l with
[] -> a
|h::t -> foldl f (f a h) t;;

('a -> 'b -> 'a)-> 'a -> 'b list -> 'a

the function is going take some value and update it with 
each item in the list
evaluates list left -> right

fold takes in a total value, a function, and a list
and updates the total with the function and each item in the list
and returns the total value

a::b vs a@b;;
a:'a :: b:'a list
a:'a list @ b:'a list


let rec foldl f a l = match l with