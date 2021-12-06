# Project 2b: HOFs on trees & Database design
Due: March 12th 11:59 PM (Late: March 13th 11:59 PM)

Points: 40% public, 30% semipublic, 30% secret

**This is an individual assignment. You must work on this project alone.**

## Introduction
The goal of this project is to increase your familiarity with programming in OCaml and give you more practice with higher order functions and user-defined types. You will write a number of small functions that will use higher order functions operating over a tree structure, and then you will implement a program that simulates a database.

### Ground Rules
In addition to your own code, you may use library functions found in the [`Stdlib` module](https://caml.inria.fr/pub/docs/manual-ocaml/libref/Stdlib.html) and the `List` module. You **may not** (under threat of a grading penalty) use any other submodules of `Stdlib` or any imperative features of Ocaml unless otherwise stated. You **may not** make any function in part 2 recursive unless the function already has the `rec` keyword.

### Testing & Submitting
Submit by either running `gradescope-submit` or `submit` (if you have installed the new version of gradescope submit on your computer).

Instructions to use the new optional submit process can be found [here](./GRADESCOPE_SUBMIT.md)

To test locally, run `dune runtest -f`. Besides the provided public tests, you will also find the file `student.ml` in `test/student/`, where you'll be able to add `OUnit` tests of your own. More detailed information about writing tests can be found [here](https://www.youtube.com/watch?v=C36JnAcClOQ).

You can interactively test your code by running `dune utop src`, which will include your source files. (As usual, all of your commands in `utop` need to end with two semicolons (`;;`), otherwise it will appear as if your terminal is hanging)

## Part 1: Database Design

Create a program that stores `person`s in a database which can later be queried. 
A person is defined as follows:

```ocaml
type person = { name: string;
                age: int;
                hobbies: string list }
```

You must come up with your own implementation for the data type for the data