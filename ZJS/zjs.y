%{
	#include <stdio.h>
//	int yyerror(const char* err);
	int yylex();
%}

%union{
	int ival;
	float fval;
}

%token END
%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token <ival> INT
%token <fval> FLOAT

%%

program:	statement_list
       		END
	;

statement_list:	
	|	statement
	|	statement_list
	;

statement:		
	|	line
	|	point
	|	circle
	|	rectangle
	| 	set_color
	|	END
	;

line:
    |	LINE INT INT INT INT END_STATEMENT	     {  }
    ;

point: 
     |   POINT INT INT END_STATEMENT		     {  }
     ;

circle:
      |	  CIRCLE INT INT INT END_STATEMENT	     {  }
      ;

rectangle:
	 |   RECTANGLE INT INT INT INT END_STATEMENT {  }
	 ;

set_color:
	 |   SET_COLOR INT INT INT END_STATEMENT     {  }
	 ;

%%

int main(int argc, char** argv){
	yyparse();
}
//int yyerror(const char* err){
//	printf("%s\n", err);
//}
