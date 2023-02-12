
# Project 3: Regular Expression Engine

Due: April 5, 2023 at 11:59 PM (late April 6, *10% penalty*)

Points: 35 public, 35 semipublic, 30 secret

**This is an individual assignment. You must work on this project alone.**

## Overview

In this project you will implement algorithms to work with NFAs, DFAs, and regular expressions. In particular, you will implement `accept` to see whether a string is matched by a NFA; `nfa_to_dfa` to convert an NFA to a DFA using te subset construction; `regex_to_nfa` to convert a regular expression to an NFA. You will also implement several other helper functions to assist in these tasks.

The project is broken into three parts: algorithms on NFAs; converting a DFA to an NFA; and converting/working with Regular Expressions. NFAs and DFAs are implemented in `src/nfa.ml`, and regexes in `src/regex.ml`.

In class we implemented a Regular Expression Interpreter through a series of reductions. First convert the RegExp to an NFA, then the NFA to a DFA, and then run the DFA on an input string to see if the string is accepted. This project will not follow that sequence exactly, but will allow you to work with the reductions so you understand each step in the sequence.

Here's how the parts can be assembled into an Interpreter. In Part I you'll simulate an NFA. You can do that directly, or you can use Part II to convert to a DFA and then assume you have a DFA to simulate. In Part II you'll implement an NFA to DFA converter. In Part III you'll convert a RegExp to an NFA. You can put these parts together to create an Interpreter: Input a RegExp to Part III to create an NFA, and then input that NFA and a string to Part I to simulate the resulting NFA. Or, input that NFA to Part II to get a DFA, then since the class of DFAs is a subset of NFAs, input that DFA to Part I to simulate it. You aren't required to create these workflows, as we'll test each part independently, but you can experiment with them. (Note that the same Ocaml type, `nfa_t`, is used for both NFAs and DFAs in this project, so the function to convert an NFA to a DFA takes and returns `nfa_t`.)

### Ground Rules

To begin this project, you will need to commit any uncommitted changes to your local branch and pull updates from the git repository.

This is NOT a pair project. You must work on this project alone as with most other CS projects. See the [Academic Integrity](#academic-integrity) section for more information. In your code, you may use **any** non-imperative standard library functions (with the exception of printing, see below), but the ones that will be useful to you will be found in the [`Stdlib`][pervasives doc] and [`List`][list doc]. The only imperative feature you may use is the provided `fresh` function in Part 3. You will receive a 0 for any functions using restricted features - we will be checking your code!

Several helper functions have been provided for you, as detailed at the end of this document. We have also provided a `Sets` module that correctly implements the functions for a functional [Set module][sets]. **Note:** the functions in the `Sets` module assume that the inputs are valid sets (i.e., they do not contain duplicates).  They will have undefined behavior if you try to give them inputs that do not meet this requirement (such as `[1; 2; 2; 3]`). You can convert an arbitrary list to a valid set with `List.sort_uniq Stdlib.compare your_list`.

### Testing

The procedure for testing this project is the same as the previous project. `dune` handles the majority of the work but, an environment variable must be set for `dune` to know where to find the precompiled binary files distributed with the project.

For this project, you must have OCaml version >= 4.12.0. To make sure you have the correct version of OCaml, run `ocaml --version`. If your version of OCaml is not 4.12.0 or later, refer to the project 0 instructions to update your version.
