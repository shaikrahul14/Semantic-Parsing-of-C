%{
#include<stdio.h>
#include<stdlib.h>
%}

%%

[a-zA-z0-9_]*+"<<<"+[0-9]+","+[0-9]+">>>"+"("+([a-zA-z0-9_])+")" {printf("%s\tKernal Function\n",yytext);}

[a-zA-z0-9_]*+"<<<"+[0-9]+","+[0-9]+">>>"+"("+([a-zA-z0-9_]*+","+[a-zA-z0-9_]*)*+")" {printf("%s\tKernal Function\n",yytext);}


"int"|"float"|"long int"|"long long int"|"double"|"char" {printf("%s\tPrimitive data type\n",yytext);}

("array")|("struct")|("union") {printf("%s \t Derived data type\n",yytext);}

("const") {printf("%s\tConstant Keyword\n",yytext);}

"+"|"-"|"*"|"/"|"="|"=="|"!="|">"|">="|"<"|"<="|"%"|"&&"|"||"|"^" {printf("%s\tOperators\n",yytext);}

("break")|("return")|("continue") {printf("%s\tSimple Statements\n",yytext);}

("if")|("else")|("switch")|("while")|("for")|("do-while") {printf("%s\tControl flow\n",yytext);}

[a-zA-Z_][a-zA-Z0-9_]*\( {printf("%s)\tProgrammer Defined function\n",yytext);}

("printf")|("scanf") {printf("%s\tSystem Defined function\n",yytext);}

("#include")|("define") {printf("%s\tPre-processor directive\n",yytext);}

"//".*" "* {printf("%s\tSingle line comment\n",yytext);}

"/*"([^*]|(\*+[^*/]))*\*+\/ {printf("%s\tMulti line comment\n",yytext);}

[a-zA-Z][0-9]+|[a-zA-Z]* {printf("%s\tIdentifier\n",yytext);}

"#"|"@"|"!"|"$" {printf("%s\tSpecial Character\n",yytext);}

";" {printf("%s\tSemicolon\n",yytext);}

":" {printf("%s\tColon\n",yytext);}


[0-9] {printf("%s\tIdentifier\n",yytext);}

.|\n ;

%%
int yywrap(){
  return 1;
}

int main(void){
  printf("Enter String\n");
  yylex();
  return 0;
}
