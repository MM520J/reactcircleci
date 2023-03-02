
# Sets module

## `elem x a`

- Type: `'a -> 'a list -> bool`
- Description: Returns true iff `x` is an element of the set `a`.
- Examples:
```ocaml
elem 2 [] = false
elem 3 (insert 5 (insert 3 (insert 2 []))) = true
elem 4 (insert 3 (insert 2 (insert 5 []))) = false
```

## `insert x a`

- Type: `'a -> 'a list -> 'a list`
- Description: Inserts `x` into the set `a`.
- Examples:
```ocaml
insert 2 [] = [2]
insert 3 (insert 2 []) = [3; 2]
insert 3 (insert 3 (insert 2 [])) = [3; 2]
```

## `insert_all xs a`

- Type: `'a list -> 'a list -> 'a list`
- Description: Inserts each element from `xs` into the set `a`.
- Examples:
```ocaml
insert_all [2; 3; 3] [] = [2; 3]
insert_all [1; 2; 3] [4; 5; 6] = [1; 2; 3; 4; 5; 6]