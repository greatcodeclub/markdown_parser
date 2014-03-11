//// Macros
SPACES         " "*

//// States
// States can be used to limit when rules are applied.
// You prepend a rule with <state_name> to do so.
//
//    this.begin('state') to enter a state.
//    this.popState() to return to previous state.
//
// Declare a `text` state.
%s             text

%%

//// Rules

// The lexer starts in the INITIAL state and we reset it to this at the start of every line.
\n                            this.popState();          return 'BR'

// Block elements
// Must be at beginning of line (INITIAL state).
<INITIAL>"#"+{SPACES}         this.begin('text');       return 'HEADING'

<INITIAL>'-'{SPACES}          this.begin('text');       return 'UL_ITEM'
<INITIAL>'>'{SPACES}          this.begin('text');       return 'QUOTE'

// Indentation: used for code blocks.
<INITIAL>"    "               this.begin('text');       return 'INDENT'
<INITIAL>\t                   this.begin('text');       return 'INDENT'

// Span elements
// Can appear anywhere (no state requirement).
'**'                          this.beginUnique('text'); return 'STRONG'
'*'                           this.beginUnique('text'); return 'EM'

.                             this.beginUnique('text'); return 'CHAR'

// EOF can replace a line break (BR)
<<EOF>>                                                 return 'BR'

%%

//// Custom code (merged in parser.js).

// Like the original `begin` function, but do not push the state if it's already the top state.
lexer.beginUnique = function(state) {
  if (this.topState() !== state) this.begin(state)
}