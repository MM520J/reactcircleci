
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
