%%

document:
  blocks                     { return $1.join("\n") }
;

blocks:
  block                      { $$ = [ $1 ] }
| blocks BR block            { $$ = $1.concat($3) }
| blocks BR                  { $$ = $1 }
;

// Block elements
block:
  paragraph BR               { $$ = '<p>' + $1 + '</p>' }
| HEADING text               { $$ = '<hX>' + $2 + '</hX>' }
| ulList BR                  { $$ = '<ul>' + $1.join('') + '</ul>' }
;

ulList:
  ulItem                     { $$ = [ $1 ] }
| ulList BR ulItem           { $$ = $1.concat($3) }
;

ulItem:
  UL_ITEM text               { $$ = '<li>' + $2 + '</li>' }
;

paragraph:
  text
| paragraph BR text          { $$ = $1 + $2 + $3 }
;

text:
  span
| text span                  { $$ = $1 + $2 }
;

// Span elements
span:
  CHAR
| EM string EM               { $$ = '<em>' + $2 + '</em>' }
| STRONG string STRONG       { $$ = '<strong>' + $2 + '</strong>' }
;

string:
  CHAR
| string CHAR                { $$ = $1 + $2 }
;