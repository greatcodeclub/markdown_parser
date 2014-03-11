BIN = `npm bin`

parser.js: grammar.jison tokens.jisonlex
	${BIN}/jison $^ -o $@

test: parser.js
	node test.js

watch:
	${BIN}/nodemon -x 'make test' -e 'js jison jisonlex' -q

.PHONY: test watch