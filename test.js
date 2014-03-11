var parser = require('./parser').parser,
    lexer = require('./lexer')

function parseAndLog(input) {
  console.log()
  console.log('(input)')
  console.log(input)
  console.log('(parsed)')
  // To view the tokens
  // console.log(lexer.lex(input))
  console.log(parser.parse(input))
}

parseAndLog("Hi there Markdown!\nWhat's rocking?")

parseAndLog("## Headings\nWorks damn # fine")

parseAndLog("You *smell* **awesome** today!")

parseAndLog("# Martini Recipe\nYou need:\n\n- Gin\n- Vermouth\n- Olives")
