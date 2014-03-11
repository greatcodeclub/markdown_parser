//// Macros
SPACES         " "*

//// Start conditions
// Start conditions can be used to limit when rules are applied.
// You prepend a rule with <state_name> to do so.
//
//    this.begin('state') to enter a state.
//    this.popState() to return to previous state.
//
// Declare a `text` start condition.
%s             text

%%

//// Rules

// The lexer starts in the INITIAL state and we reset it to this at the start of every line.
\n                            this.begin('INITIAL'); return 'BR'

// Block elements
// Must be at beginning of line (INITIAL state).
<INITIAL>"#"+{SPACES}         this.begin('text');    return 'HEADING'

<INITIAL>'-'{SPACES}          this.begin('text');    return 'UL_ITEM'
<INITIAL>'>'{SPACES}          this.begin('text');    return 'QUOTE'

// Indentation: used for code blocks.
<INITIAL>"    "               this.begin('text');    return 'INDENT'
<INITIAL>\t                   this.begin('text');    return 'INDENT'

// Span elements
// Can appear anywhere (no state requirement).
'**'                          this.begin('text');    return 'STRONG'
'*'                           this.begin('text');    return 'EM'

.                             this.begin('text');    return 'CHAR'

// EOF can replace a line break (BR)
<<EOF>>                                              return 'BR'
