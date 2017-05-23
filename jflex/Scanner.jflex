package compiler;

import java_cup.runtime.Symbol;

%%
%implements java_cup.runtime.Scanner
%function next_token
%type java_cup.runtime.Symbol
%char
%line
%column
%unicode
%class Scanner
%{	
	 private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
     }
     
     private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
     }
      
%}

Identifier = [a-zA-Z][a-zA-Z0-9_]*
BooleanLit = true|false
IntegerLit = [0-9]+
RealLit = [0-9]+\.[0-9]*

new_line = \r|\n|\r\n;
white_space = {new_line} | [ \t\f] | [ ] 

Leftbrace = \{
Rightbrace = \}
Notrightbrace = [^}]
Comment_body = {Notrightbrace}*
Comment = {Leftbrace}{Comment_body}{Rightbrace}

%%

<YYINITIAL>{
	"program"		{ return symbol(sym.PROGRAM); }
	"and"			{ return symbol(sym.AND); }
	"var"			{ return symbol(sym.VAR); }
	"boolean"		{ return symbol(sym.BOOLEAN); }
	"begin"			{ return symbol(sym.BEGIN); }
	"real" 			{ return symbol(sym.REAL); }
	"integer"		{ return symbol(sym.INTEGER); }
	"procedure"		{ return symbol(sym.PROCEDURE); }
	"end"			{ return symbol(sym.END); }
	"if"			{ return symbol(sym.IF); }
	"else"			{ return symbol(sym.ELSE); }
	"then"			{ return symbol(sym.THEN); }
	"while"			{ return symbol(sym.WHILE); }
	"do"			{ return symbol(sym.DO); }
	"not" 			{ return symbol(sym.NOT); }
	"or" 			{ return symbol(sym.OR); }
	"->"			{ return symbol(sym.INF); }
	"*"         	{ return symbol(sym.TIMES); }
	"+"         	{ return symbol(sym.PLUS); }
	"-"         	{ return symbol(sym.MINUS); }
	"/"         	{ return symbol(sym.DIVIDE); }
	";"         	{ return symbol(sym.SEMI); }
	","         	{ return symbol(sym.COMMA); }
	"("         	{ return symbol(sym.LT_PAREN); }
	")"         	{ return symbol(sym.RT_PAREN); }
	"="         	{ return symbol(sym.EQ); }
	"<"         	{ return symbol(sym.GTR); }
	">"         	{ return symbol(sym.LESS); }
	"<="        	{ return symbol(sym.LESS_EQ); }
	">="        	{ return symbol(sym.GTR_EQ); }
	"<>"        	{ return symbol(sym.NOT_EQ); }
	":"         	{ return symbol(sym.COLON); }
	":="        	{ return symbol(sym.ASSMNT); }
	"."         	{ return symbol(sym.DOT); }
	{Comment}   	{ System.out.println("Comentário dentro do arquivo:"+ yytext()); }
	{BooleanLit}	{ return symbol(sym.BOOLEAN_LIT, Boolean.valueOf(yytext()) ); }
	{Identifier}	{ return symbol(sym.IDENTIFIER, yytext());}
	{IntegerLit}	{ return symbol(sym.INTEGER_LIT, Integer.valueOf(yytext())); }
	{RealLit}		{ return symbol(sym.REAL_LIT, Double.valueOf(yytext())); }
	{white_space} 	{ /* ignore */ }
	{new_line}		{ /* ignore */ }
	. 				{ System.out.println("Entrada ilegal: "+ yytext()); }
}
