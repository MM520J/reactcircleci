
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

Public and student tests can be run using the same `dune` command that you used in the previous projects but, you need to set the environment variable `OCAMLPATH` before running the command. The full command is now `env OCAMLPATH=dep dune runtest -f`. Setting `OCAMLPATH` tells `dune` where it can find the functions over sets that we have provided. You will need to provide this environment variable for every `dune` command so you may want to add it to your environment once by running `OCAMLPATH=dep` as separate command before using `dune`. We have also provided a shell script `test.sh` that runs the command given above.  To run this, type `sh test.sh` at a terminal.

For testing your regular expressions and `nfa_to_dfa`, we've provided another build target: `viz`. When you run this command, it will read a regular expression from standard in, compose an NFA from it, and export that NFA to Graphviz before rendering to a PNG. For this target to work, however, you must install Graphviz.

You are not required to do this, but it may be helpful in debugging your code. Once you've performed these steps, you can run the visualizer as follows:

1. Run the shell script `./viz.sh` or the command `env OCAMLPATH=dep dune exec bin/viz.bc` to open the input shell.
2. The shell will ask for a regular expression. Type without spaces and using only the constructs supported by this project.
3. Select if you want to convert the NFA to a DFA (with your conversion function) before visualizing.
4. You should be notified that the image has been successfully generated and put in `output.png`.
5. Use an image viewer of choice to open `output.png` and see the visual representation of your generated NFA.

### Submitting

You will submit this project to Gradescope using `gradescope-submit` or `submit`. Alternatively, you can manually submit the project on [Gradescope](https://www.gradescope.com) by clicking on the "Project 3" assignment and **ONLY** submit your `nfa.ml` file and `regexp.ml`.  You must submit both of these files every time, and any other files will be ignored.

Instructions to use the new optional submit process can be found [here](./GRADESCOPE_SUBMIT.md)

### Academic Integrity

Please **carefully read** the academic honesty section of the course syllabus. **Any evidence** of impermissible cooperation on projects, use of disallowed materials or resources, or unauthorized use of computer accounts, **will** be submitted to the Student Honor Council, which could result in an XF for the course, or suspension or expulsion from the University. Be sure you understand what you are and what you are not permitted to do in regards to academic integrity when it comes to project assignments. These policies apply to all students, and the Student Honor Council does not consider lack of knowledge of the policies to be a defense for violating them. Full information is found in the course syllabus, which you should review before starting.

## Part 1: NFAs

This first part of the project asks you to implement some functions for working with NFAs. In particular, you will be asked to implement the *move* and *epsilon closure* functions [described in class][lecture notes]; these will be handy for Part 2. You will also implement an `accept` function to determine whether a string is matched by a given NFA; both *move* and *epsilon closure* may be handy here, too.

### NFA Types

Before starting, you'll want to familiarize yourself with the types you will be working with.

The type `nfa_t` is the type representing NFAs. It is modeled after the formal definition of an NFA, a 5-tuple (Σ, Q, q0, F, δ) where:

1. Σ is a finite alphabet,
2. Q is a finite set of states,
3. q0 ∈ Q is the start state,
4. F ⊆ Q is the set of accept states, and
5. δ : Q × (Σ ∪ {ε}) → 𝒫(Q) is the transition function (𝒫(Q) represents the powerset of Q).