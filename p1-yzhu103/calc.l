%{
#include <stdio.h>
#include "sym_table.h"
#include "calc.tab.h"
int level_num;
%}

%option yylineno

digit	[0-9]
identify	[a-z]([a-zA-Z0-9])*

%%

"main()"	{  return (TOK_MAIN);}
"print"	{ return(TOK_PRINT);}
"float"	{ return TOK_F_DECLAR;}
{digit}+\.{digit}+	{sscanf(yytext,"%f",&(yylval.float_val));
			return TOK_FLOAT;}

{identify}	{yylval.string_val = strdup(yytext);
				return TOK_IDENTIFY;}

";"		{	return(TOK_SEMICOLON);	}
"-"		{	return(TOK_SUB);	}
"*"		{	return(TOK_MUL);	}
"{"		{	level_num++;return(TOK_LEFTBRACE);}
"}"		{	level_num--;pop_var(level_num);return(TOK_RIGHTBRACE);}

"("		{	return(TOK_LEFTPAR);}
")"		{	return(TOK_RIGHTPAR);}
"="		{	return(TOK_EQUAL);}
[ \t\r\a\n]+ {}

[a-zA-Z0-9]+	{printf("lexical analysis error: <%s>\n",
			yytext);
			exit(0);}	
. {
	printf("lexical analysis error: <%s>\n",
			yytext);
			exit(0);
	}

%%
