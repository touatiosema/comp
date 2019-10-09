                /* DECLARATIONS */
    /* TOKENS */
%token  CSTE
%token  PG
%token  PD
%token  ID
%token  PLUS
%token  MULT
    /* START SYMBOL */
%start axiome
    /* INSERTIONS DE CODE *VERBATIM* */
%{ 
#include <stdio.h>
#include <ctype.h>
%}

%% 
                /* GRAMAIRES ET ACTIONS SEMANTIQUES */

axiome		: exp                { printf("yacc : S->E\n");};
exp		: exp PLUS terme     { printf("yacc : E->E + T\n");}
		| terme              { printf("yacc : E->T\n");};
terme		: terme MULT facteur { printf("yacc : T->T*F\n");}
		| facteur            { printf("yacc : T->F\n");};
facteur		: PG exp PD          { printf("yacc : F->(E)\n");}
		| ID                 { printf("yacc : F->id\n");} 
                | CSTE               { printf("yacc : F->cste\n");};

%%
		/* CODE C */

yyerror(s) char*s;
{
  fprintf(stderr,"%s\n",s);
}

#include "lex.yy.c"

main() {
       yyparse();
       }


