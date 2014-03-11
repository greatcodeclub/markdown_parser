# A basic Markdown parser

A demo project from the http://greatcodeclub.com/ to play with parsing and Jison.

Shows how to use states in the lexer.

## Installation

You need:

- A recent version of [node](http://nodejs.org/).
- `make`. You probably have it already.

To install Node modules and start the test:

    $ npm install
    $ make watch

Then modify any file, the parser will be recompiled and the file `test.js` will be executed.

## How to browse the code

Here are the files you should take a look at, in logical order:

1. `tokens.jisonlex` defines the tokens produced by the lexer.
2. `grammar.jison` is the grammar defining the syntax. It is compiled to `parser.js`.
3. `test.js` uses the parser to parser and output to the console. Modify this file.

## License

Copyright 2014 Coded Inc.  
marc@codedinc.com

You are free to modify and distribute this however you want. Except for teaching purposes.
