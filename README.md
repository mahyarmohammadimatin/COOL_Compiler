# Classroom Object Oriented Language(COOL) Compiler

<img src="https://github.com/mahyarmohammadimatin/COOL_Compiler/blob/main/44.png">

## About The Project
This is a compiler's course project. The goal is to design a **compiler for the Classroom Object Oriented Language(COOL)**. To warm up, I programmed a **stack machine** using the COOL language in the first part of the project. Later on, I have implemented a **syntax analyzer** (i.e. lexer) in phase one that catches some syntax errors. In phase two I defined a **grammar for the language**(i.e. parser) to catch the rest of the syntax errors. In phase three we have the **type checker**(i.e. semantic analyzer) which uses logic rules to perform the type inferences. 

This is a famous project designed by the [Stanford university](https://web.stanford.edu/class/cs143/). I got the base code from them and made my contribution clear in the readMe.
I've ran the Stanford grader on my codes and they nearly pass all the tests. 

You can check out the comprehensive readMe's and the complete codes to get more details. Also some useful resources and pdf's can be found in each folder. 

### Built With
* [C++](https://cplusplus.com/)
* [Flex](https://ftp.gnu.org/old-gnu/Manuals/flex-2.5.4/)
* [Bison](https://www.gnu.org/software/bison/)

## Getting Started

### Usage
Check out the readMe in each folder to get full details of each project.

#### A Stack Machine written in COOL 
A machine with only a single stack for storage is a stack machine. Consider the following very primitive language for programming a stack machine:
| Command | Meaning  |
|--|--|
| int | int push the integer int on the stack |
| + | push a ‘+’ on the stack   |
| s | push an ‘s’ on the stack   |
| e | evaluate the top of the stack  |
| d | display contents of the stack x stop |

#### Phase One: Lexer with Flex
In this phase I've created a lexical analyzer, also called a scanner, using a lexical analyzer generator, called flex. I have described the set of tokens for Cool in an appropriate input format, and the analyzer generator  generates the actual C++ code for recognizing tokens in Cool programs.

Refer to the readMe file for full details.
#### Phase Two: Parser with Bison
In this phase I have written a parser for Cool. I've used two tools: the parser generator, called bison, and a package for manipulating trees. The output of the parser is an abstract syntax tree (AST). I've constructed this AST using semantic actions of the parser generator.

Refer to the readMe file for full details.

#### Phase Three: Semantical Analysis
In this phase, I've implemented the static semantics of Cool. I've used the abstract syntax trees (AST) built by the parser to check that a program conforms to the Cool specification. My static semantic component rejects erroneous programs; for correct programs, it gathers certain information for use by the code generator. The output of the semantic analyzer is an annotated AST for use by the code generator.

At a high level, my semantic checker performs the following major tasks:

1. Look at all classes and build an inheritance graph. 
2. Check that the graph is well-formed.  
3. For each class
	* Traverse the AST, gathering all visible declarations in a symbol table. 
	* Check each expression for type correctness.
	* Annotate the AST with types.

And checks for every semantic error possible in COOL.

Refer to the readMe file for full details.
