%{
#include <stdio.h>
extern int yylex();
void yyerror(const char *s);
%}

%token NUM ID STRING
%token PRINT CONCAT LENGTH
%token EOL ERROR


%left '+' '-'
%left '*' '/'

%%

/* O programa agora é uma lista de comandos */
program: command_list
       ;

command_list: command_list command
            | command
            ;

command: ID '=' printable EOL   { /* Lógica de atribuição */ }
       | ID '=' printable
       | PRINT '(' printable ')' EOL {/* Lógica de impressão }
       | PRINT '(' printable ')'
       | printable EOL
       | printable
       | EOL { /* Linha vazia */ }
       ;

printable: expr
         | STRING
         ;

expr: expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | '(' expr ')'
    | NUM
    | ID
    | LENGTH '(' printable ')'
    | CONCAT '(' string_list ')'
    ;

string_list: string_list ',' printable
           | printable
           ;

%%