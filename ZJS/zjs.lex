%{
  #include <stdio.h>
  #include <stdlib.h>
  void printLexeme();
%}

//DIGIT	[0-9]
%option noyywrap

%%
END	  		            { printf("Exiting interpreter\n"); exit(0);}
; 			              { printf("END_STATEMENT\n");}
POINT	  		          { printf("POINT\n");}
LINE			            { printf("LINE\n");}
CIRCLE			          { printf("CIRCLE\n");}
RECTANGLE		          { printf("RECTANGLE\n");}
SET_COLOR		          { printf("SET_COLOR\n");}
{0-9}+     		      { printf("INT\t"); printLexeme();}
{0-9}+"."{0-9}* 	{ printf("FLOAT\t"); printLexeme();}
[A-Za-z]  		        { printf("ALPHA_CHAR\t"); printLexeme();}
.			                { printf("UNRECOGNIZED CHAR\t");}
[\t|\n]+	 	/*Ignoring whitespace, tabs, newlines, and spaces*/;

%%
void printLexeme(){
	printf("(%s)\n", yytext);
}
