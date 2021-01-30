
# Project 1b: Translator

Due: February 19, 2023 at 11:59 PM (late February 20, *10% penalty*). 

**Test Weightage:**
 - Public: 50%
 - Semipublic: 40%
 - Secret: 10%

**This is an individual assignment. You must work on this project alone.**

## Introduction

In this project, you will be making a simple translator for very simple sentences.
To begin, we have a few things to mention.
Languages have these things called grammars. They define the structure of 
a sentence. We will talk more about grammars later in the course but for now
just consider the following:
```text
Adjective Adjective Noun Verb Adverb
```
Choose any two adjective, any noun, verb and adverb and mad-lib (substitute it)
in. You will get a grammatically correct sentence.
```text
large green trucks stop instantly
poisonous feral moose age rapidly
colourless green ideas sleep furiously
```
Notice that grammatically correct does not mean makes sense.

Adjectives, nouns, verbs, adverbs, etc are referred to as parts of speech.

For part 1 of this project, you will read in some files that describe various
languages' grammar and lexicon (the words that exist in that language).

### **File Inputs**

You will read in two files. 

#### Language File
First, a file that has a list of words, their part of speech, and their counterpart in other languages. 

The file would have the structure below:
```
word, POS, <L1>:<word1>, <L2>:<word2>, ...