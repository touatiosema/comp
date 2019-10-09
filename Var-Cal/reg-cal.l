%option noyywrap
/* avoid dependency with library fl */

%{ 
#include "y.tab.h"
#include "Table_des_symboles.h"
#include "Attribute.h"
#include <stdio.h>

%} 
%% 
"+"              { return PLUS;}
"-"              { return MOINS;}
"*"              { return MULT;}
"/"              { return DIV;}
"("              { return PO;}
")"              { return PF;}
"="              { return EQ;}

[0-9]+           { yylval.val = new_attribute();
                   yylval.val -> type_val = INT;
		   yylval.val -> int_val =  atoi (yytext);
                   // printf("INT %d\n",yylval.val -> int_val); // for debug ?
                   return NUM; }
[a-z]+           { yylval.val = new_attribute();
                   yylval.val -> name = string_to_sid(yytext);
		   return ID; }
\n               { return FIN;}
[ \t]            { /* on avale sans rendre la main */; }
.                { return 0; }
