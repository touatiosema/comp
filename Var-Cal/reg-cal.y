%code requires{
#include "Table_des_symboles.h"
#include "Attribute.h"
 }

%{

#include <stdio.h>
  
extern int yylex();
extern int yyparse();

void yyerror (char* s) {
  printf ("%s\n",s);
  
}
		

%}

%union { 
	attribute val;
}
%token <val> NUM /* attribut d’un nombre = valeur entiere */
%token <val> ID  /* attribut d’un registre = sid */
%token PLUS MOINS MULT DIV PO PF EQ
%token FIN       /* marque la fin d’une expression */
%left PLUS MOINS 
%left MULT DIV    /* * et / plus prioritaires que + et - */
%nonassoc UNA    /* pseudo token pour assurer une priorite locale */

%type <val> exp  /* attribut d’une expr = valeur flottante */

%start cal  
 


%%

cal:lig  /*axiome*/
| cal lig ;

lig : FIN              { printf ("? "); }
| exp FIN              { printf ("= %i\n? ", $1->int_val); }
| ID EQ exp FIN        { printf ("%s = %i\n? ", $1->name, $3->int_val);
                         set_symbol_value($1->name,$3);
                       }
| ID error FIN         { yyerrok; }
;

exp
: NUM                  { $$ = $1; }
|MOINS exp %prec UNA   { $$=neg_attribute($2);}
| exp PLUS exp         { $$=plus_attribute($1,$3);}
| exp MOINS exp        { $$=minus_attribute($1,$3);}
| exp MULT exp         { $$=mult_attribute($1,$3);}
| exp DIV exp          { $$ = div_attribute($1,$3);}
| PO exp PF            { $$=$2;} 
| ID                   { $$ = get_symbol_value($1->name); }
;
       


%% 
int main () {
printf ("? "); return yyparse ();
} 

