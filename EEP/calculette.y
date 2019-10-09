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

axiome		: exp                { printf("Le résultat est : %d\n", $1);}
exp             : terme expp         
expp            : PLUS terme expp    
|                                    
terme           : facteur termep     
termep          : MULT facteur termep
|                                   
facteur		: PG exp PD         
| ID                
| CSTE              

%%
		/* CODE C */

int yyerror(s) char*s;
{
  return fprintf(stderr,"%s\n",s);
}
#include    "lex.yy.c"
int main() {
       return yyparse();
       }


