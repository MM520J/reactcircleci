
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
```
* Each starting `word` will be considered part of the `English` language. 
    * `word` will be at least one character long
    * valid characters in `word` are lowercase alphabetic characters and the hyphen character ("-")
* `POS` is the part of speech
    * a valid `POS` will be any capitalized 3 letter code: ADJ, NOU, ADV, etc.
* `LX` is a language name (not including `English`)
    * A language `LX` starts with a capital letter, and is followed by any number of lowercase alphanumeric characters.
* `wordX` represents `word`'s equivalent in language `LX`
    * `wordX` will be a string consisting of lowercase alphabetic characters and the hyphen character ("-")
    * `wordX` will be at least one character long

For example:
```
blue, ADJ, French:bleu, German:blau, Spanish:azul, Swedish:bla
truck, NOU, Spanish:camion, German:lkw
the, DET, German:der, Spanish:el, French:le
```

Not all words will have translations to all other languages. 
It is also important to note, that some words have multiple parts of speech.
(eg. "Bank" is both a noun and a verb). If this is the case, they will be on seperate lines
```
bank, NOU, Spanish:banco
bank, VER, Spanish:ladear
```

If a line doesn't match all the above specifications, ignore the entire line.

#### Grammar File
Second, a file that describes the grammar structure of a language:

The file will have the following format
```
Lang: POSX1, POSX2, POSX3, ...
```

We will be using similar formatting as the Language File with a slight modification.
* `Lang` is a language name 
    * A language `Lang` starts with a capital letter, and is followed by any number of lowercase alphanumeric characters.
* `POSXY` denotes a single or repeated `POS`
    * a valid `POSXY` will be any capitalized 3 letter code: ADJ, NOU, ADV, etc, with an optional modifier denoting how many times it repeats in a row.
    * A valid modifier looks like `{#}` where `#` is any valid Natural number greater than zero.

For example:
```
Language: DET, ADJ{3}, NOU
English: DET, ADJ, NOU
Spanish: DET, NOU, ADJ
Swedish: DET, NOU
French: DET, NOU
German: DET, ADJ, ADJ, NOU, ADJ
```

Each language will only have one grammar structure at a time.

If a line doesn't match all the above specifications, ignore the entire line.

### **Translator Class**

You will make a `Translator` class which will hold all the words and grammars the translator will know.
When you make a new `Translator`, an initial words and grammar file will be 
provided.

You will need to design a data structure to hold all the information needed. We _highly_ recommend that you make inner classes to store the information in a more concise way.

#### **Part 1**

First initialize your data structure and then complete the following methods to add any new words/grammars to your structure.

 - `updateLexicon(inputfile)`: Update the words in your lexicon, by reading in 
 the file. If you have already seen a word, update your data structure so that any additional 
 translations are added.
 Ignore any malformed lines that do not follow the above formatting. You can assume that the inputfile is a valid file name.

 - `updateGrammar(inputfile)`: Update your grammar knowledge by reading in the 
 file. If you have already seen a language's grammatical structure, update it 
 with the new data. Ignore any malformed lines that do not follow the above formatting. You can assume that the inputfile is a valid file name.

#### **Part 2**

Here is a grammar structure of a valid English sentence:
```text
determiner adjective noun
the red truck
a small snail