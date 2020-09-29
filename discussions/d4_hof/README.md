
# Discussion 4 - Friday, February 24<sup>th</sup>

## Reminders
1. Project 2a due February 26th 11:59PM
2. Quiz 2 **date moved** to next Friday, March 3rd in discussion (see [Piazza](https://piazza.com/class/lctd1gtoyd76m8/post/801) for details)

## Introduction

Today, we'll be covering `map` and `fold`, as well as an example of a custom data type. 

## Part 1: Map

Suppose you have a list in which you want to add one to each element. You could easily write a function to do this:

```ocaml
let rec add1 xs =
  match xs with
      [] -> []
    | h::t -> (h+1)::(add1 t)
;;
```

Now, let's consider a function that squares each element in a list:

```ocaml
let rec square xs =
  match xs with
      [] -> []
    | h::t -> (h*h)::(square t)
;;
```

Notice that both of these functions are *essentially* doing the same thing; they are performing the same task to each element of a list. We can generalize for any function `f` by using `map`.

```ocaml
let rec map f xs = 
  match xs with
      [] -> []
    | h::t -> (f h)::(map f t)
;;
```

## Part 2: Fold

Suppose you want to compute the sum of each element in a list. We can write a function that does this: