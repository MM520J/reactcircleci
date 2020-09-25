
# Discussion 3 - Friday, February 17<sup>th</sup>

## Reminders
1. Project 1b due Sunday, February 19th 11:59PM
2. Quiz 1 regrade requests open until February 22nd 
3. Quiz 2 **next Friday**, February 24th **in discussion** 

## Introduction

This week, we dive into Ocaml in discussions. We will be covering a breadth of material in Ocaml. Projects 2 to 4 are in Ocaml. So, please make sure you understand the fundamentals of the language as best as possible. Today, we will be covering **Ocaml expressions, values, and types, let bindings, let expressions, lists, pattern matching, functions, and recursive functions `rec`**.

## Part 1: Ocaml expressions, values, and types

Some basics of Ocaml. Ocaml is a compiled and bootstrapped language. It is implicitly typed. That means, the compiler infers the type of your variables and values at compile time. Ocaml is also statically typed, meaning once the type of a variable is infered, the variable must abide by the type throughout its scope. Everything in Ocaml is immutable. Everything means everything. Once you initialize a variable, you cannot change throughout its scope. You should redefine it to change it. That being said, `=` is an equality operator and not the assignment operator outside `let` expressions. 

Some primitive built-in data types are `int`, `float`, `char`, `string`, `bool`, and `unit`. Other composite data types include `tuples`, `lists`, `option`, and variants.

We know the primitive data types but we will learn more about the others later down in the discussion. Arithmetic operators in Ocaml are not overloaded. So, you can use `+`, `-`, `*`, `/` on two ints but not on floats. For floats, they are `+.`, `-.`, `*.`, `/.`. **Notice the period**.

Expressions are something that evaluates to some value. Example: `1 + 2`, `2 < 3`, `"hello"`.

## Part 2: Let bindings and Let expressions

Almost everything in Ocaml is an expression , say `e`. An expression will evaluate to some value of type, say `t`.

Examples:  
- `1: int`
- `true: bool`
- `'e': char`

The `let` syntax is the main way to bind a name to a value. Simply: 

```ocaml
let name = value;; (* syntax *)
let num1 = 5;; (* type: int *)
let num2 = 6;; (* type: int *)
let num3 = num1 + num2;; (* type: int *)
```

We use `let` to create expressions as well. Remember that expressions evaluate to some values. So, the variables initialized in the let expressions are limited to the expression in terms of scope.

Examples:

```ocaml
let x = 8 in x;;  (* will evaluate to 8 *)
let x = 10 in let y = 15 in x + y;; (* nested let expressions *)
let x = 5 in let y = 7 in if x > y then "bigger" else "smaller";; (* expression can be another expression *)
```

## Part 3: Functions and the `rec` keyword

Functions, conventionally, are multiline reusable code that might or might not depend on other variables (arguments). To denote the notion of functions in Ocaml, we can treat the functions as expressions i.e. something that can evaluate to a value. Technically, a function processes the input and generates an output. Putting multiple expressions together can work the same magic. So, we use `let` bindings to bind expression(s) and parameters to some name to make functions.

Example:

```ocaml
let my_function a = a;; (* type 'a -> 'a *)
```
analogous to (java)
```java