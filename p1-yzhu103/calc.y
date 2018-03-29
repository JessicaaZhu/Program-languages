%{
#include <stdio.h>
#include "sym_table.h"
extern int level_num;
%}

%token TOK_SEMICOLON TOK_PRINT TOK_FLOAT TOK_IDENTIFY TOK_SUB TOK_MUL TOK_MAIN TOK_LEFTBRACE TOK_RIGHTBRACE TOK_F_DECLAR TOK_EQUAL TOK_LEFTPAR TOK_RIGHTPAR

%union{
        float float_val;
        char* string_val;
}

%type <float_val> expr TOK_FLOAT
%type <string_val> id TOK_IDENTIFY

%left TOK_SUB
%left TOK_MUL

%%
Prog:
	TOK_MAIN TOK_LEFTBRACE Stmts TOK_RIGHTBRACE
;

Stmts:
	| Stmt TOK_SEMICOLON Stmts
;

Stmt:
	
	| TOK_F_DECLAR id{ create_var($2,0.0,level_num);}
	| id TOK_EQUAL expr { modify_var($1,$3);}
	| TOK_PRINT id
		{
			float value = get_var($2);
			fprintf(stdout, "%.1f\n",value);
		}
	|
	TOK_LEFTBRACE Stmts TOK_RIGHTBRACE
;

id:
	TOK_IDENTIFY {$$ = $1;}
;

expr: 	
	TOK_FLOAT 
	{
		$$ = $1;
	}

	| id {$$ = get_var($1);}


	| expr TOK_SUB expr
	  {
		$$ = $1 - $3;
	  }

	| expr TOK_MUL expr
	  {
		$$ = $1 * $3;
	  }
	| TOK_LEFTPAR TOK_SUB expr TOK_RIGHTPAR
	 {
	 	$$ = 0.0 -$3;
	 }

;


%%

int yyerror(char *s)
{
	extern int yylineno;
	printf("Parsing error: line %d\n",yylineno);
	return 0;
}

int main()
{
   yyparse();
   return 0;
}
