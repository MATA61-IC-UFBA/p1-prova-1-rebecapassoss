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

command: ID '=' expr EOL        { /* Lógica de atribuição */ }
       | PRINT '(' printable ')' EOL { /* Lógica de impressão */ }
       | EOL                    { /* Linha vazia */ }
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
    | LENGTH '(' STRING ')'
    | CONCAT '(' string_list ')'
    ;

string_list: string_list ',' STRING
           | STRING
           ;

%%

void yyerror(const char *s) {
    printf("erro sintatico\n");
}