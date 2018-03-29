all: calc

lex.yy.c: calc.l calc.tab.h
	flex -l calc.l

calc.tab.c calc.tab.h: calc.y
	bison -dv calc.y

calc: calc.tab.c lex.yy.c sym_table.c
	gcc -o calc calc.tab.c lex.yy.c sym_table.c -lfl

clean:
	rm -rf calc calc.output calc.tab.c calc.tab.h lex.yy.c sym_table.o

