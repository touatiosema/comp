%%
[ \t]  ;
"("		    { return(PG);} 
")"		    { return(PD);} 
"+"		    { return(PLUS);}
"*"		    { return(MULT);}
[0-9]+              { yylval = atoi(yytext) ; 
                      return(CSTE) ; }
[a-zA-Z]+           { return(ID);}



