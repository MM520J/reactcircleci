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

You must come up with your own implementation for the data type for the database `db`. As provided above, `person` includes `name`, `age`, and `hobbies`, which is the data we would like to add to our database.

Given a piece of data like `person`, you will implement the following operations on the database:

### `newDatabase`
  - **Type**: `db`
  - **Description**: creates and returns an empty database

### `insert person database`: 
  - **Type**: `person -> db -> db`
  - **Description**: given a person and a database, insert the person into the database and return the updated database. If the person already exists in the database, there should be duplicate entries of the person after performing the insert function.
  - **Examples**:
  ```ocaml
  let db1 = insert {name="Alice";age=23;hobbies=["Skiing";"golfing"]} newDatabase
  let db1 = insert {name="Alice";age=23;hobbies=["Skiing";"golfing"]} db1
  (* db1 stores a database that includes Alice twice, so querying the size
      of this database should result in 2 instances of the Alice person *)
  ```

### `remove name database`: 
  - **Type**: `string -> db -> db`
  - **Description**: given a person's name and a database, remove all persons with the same name from the database and return the updated database. If no persons exist in the database with the same name as the given person, the database should not change.
  - **Examples**:
  ```ocaml
  let db1 = remove "Alice" db1
  (* db1 no longer contains Alice, db1 is now empty *)
  ```
#### Comparator
A comparator is a function that tells how to compare two people. 
Its type is `person -> person -> int`. It follows the typical -1, 0, 1 convention. Below is an example comparator:
  ```ocaml
  let comparator1 p1 p2 = 
    if p1.age < p2.age then -1
    else if p1.age == p2.age then 0
    else 1
  ```

### `sort comparator db`:
  - **Type**: `(person -> person -> int) -> db -> person list`
  - **Description**: given a comparator function and a db, sort the list of people based on the comparator and return in the form of a person list. You may use anything from the `Stdlib` or the `List` modules to help you.
   - **Examples**:
  ```ocaml
  let db1 = insert {name="Alice";age=23;hobbies=["Skiing";"golfing"]} newDatabase
  let db2 = insert {name="Bob";age=42;hobbies=["Skiing";"Cooking"; "Legos"]} db1
  sort comparator1 db2 = [{name="Alice";age=23;hobbies=["Skiing";"golfing"]}; {name="Bob";age=42;hobbies=["Skiing";"Cooking"; "Legos"]}]
  ```

#### Aside

When we are describing something we typically link together and modify different 
descriptors with common words like *and*, *or*, *not*. For example: "His name 
is Cliff AND he is older than 18 AND (he likes Lego OR he likes chocolate)." 
Here I added parenthesis to remove ambiguity. If we changed the syntax of this
sentence we can remove some of the ambiguity: (and his name is cliff, and he is
is older than 18, or he likes Lego, he likes chocolate). Here, while it 
looks weird and sounds weird if you were to say it out loud, by defining words
like *and* to link exactly 2 parts together, we can figure out exactly which 
parts are conjoined and which are under the *or* condition. 
Visually this looks like:
```text
and(e1,e2)
or(e1,e2)
and(name is cliff,and(older than 18, or(likes Lego, likes Chocolate)))
```

The nice part about this modified English grammar/syntax is that we don't have 
ambiguity and it's easy to represent this as code. See below.

#### Condition
A `condition` is a restriction on the combination of age, name, and/or hobbies. We represent a condition as a type containing either a true/false value, a restriction on age, name