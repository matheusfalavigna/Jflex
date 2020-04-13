package br.com.compiler.scanner;
%%
%public
%class LexicalAnalyzerExample
%{
private void print_value(String lexema, String tipo, String valor) {
 System.out.println(lexema + " | " + tipo + " | " + valor);
}
%}
%int
%line
%column

PESQ = [\(]*
PDIR = [\)]*
POT = "**"
MULT = "*"
DIV = "/"
SOMA = "+"
SUBT = "-"
NP = 0|[1-9][0-9]*
NN = \-\d*\d
BRANCO = [\n| |\t\r]

%%

{BRANCO}             { System.out.println(yytext() + " - " + "BRANCO"); }
{PESQ}               { print_value(yytext(), "Pontuacao", "ParentEsq"); }
{PDIR}               { print_value(yytext(), "Pontuacao", "ParentDir"); }
{POT}                { print_value(yytext(), "Operador", "Potencia"); }
{MULT}               { print_value(yytext(), "Operador", "MUltiplicacao"); }
{DIV}                { print_value(yytext(), "Operador", "Divisao"); }
{SOMA}               { print_value(yytext(), "Operador", "Adicao"); }
{SUBT}               { print_value(yytext(), "Operador", "Subtracao"); }
{NP}                 { print_value(yytext(), "Numero", yytext()); }
{NN}                 { print_value(yytext(), "Numero", yytext()); }
. { throw new RuntimeException("Caractere inválidos " + yytext()); }