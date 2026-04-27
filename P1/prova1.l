%{
#include "prova1.tab.h"
%}

%option noyywrap yylineno

%%

("//"|"\\\\").* { /* Comentário: ignora */ }
[ \t\r]+        { /* Espaços: ignora */ }

"print"         { return PRINT; }
"concat"        { return CONCAT; }
"length"        { return LENGTH; }

[a-zA-Z][a-zA-Z0-9_]* { return ID; }
[0-9]+          { return NUM; }
\"[^\"\n]*\"    { return STRING; }

"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
"("             { return '('; }
")"             { return ')'; }
"="             { return '='; }
","             { return ','; }
"\n"            { return EOL; }

.               { return ERROR; }

%%