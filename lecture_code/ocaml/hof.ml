
let rec map f l = match l with
[] -> []
|h::t -> (f h)::(map f t);;

('a -> 'b) -> 'a list -> 'b list


let add3 x = x + 3 in 
map add3 [1;2;3]
4::5::6::[]