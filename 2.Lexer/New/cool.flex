/*
 *  The scanner definition for COOL.
 */

/*
 *  Stuff enclosed in %{ %} in the first section is copied verbatim to the
 *  output, so headers and global definitions are placed here to be visible
 * to the code in the file.  Don't remove anything that was here initially
 */
%{
#include <cool-parse.h>
#include <stringtab.h>
#include <utilities.h>

/* The compiler assumes these identifiers. */
#define yylval cool_yylval
#define yylex  cool_yylex

/* Max size of string constants */
#define MAX_STR_CONST 1025
#define YY_NO_UNPUT   /* keep g++ happy */

extern FILE *fin; /* we read from this file */

/* define YY_INPUT so we read from the FILE fin:
 * This change makes it possible to use this scanner in
 * the Cool compiler.
 */
#undef YY_INPUT
#define YY_INPUT(buf,result,max_size) \
	if ( (result = fread( (char*)buf, sizeof(char), max_size, fin)) < 0) \
		YY_FATAL_ERROR( "read() in flex scanner failed");

char string_buf[MAX_STR_CONST]; /* to assemble string constants */
char *string_buf_ptr;

extern int curr_lineno;
extern int verbose_flag;

extern YYSTYPE cool_yylval;

/*
 *  Add Your own definitions here
 */

 int add_to_buffer(char c);



%}

%x STRING
%x LONG_STRING
%x COMMENT

/*
 * Define names for regular expressions here.
 */

CLASS_RE    [cC][lL][aA][sS][sS]
ELSE_RE     [eE][lL][sS][eE]
FI_RE       [fF][iI]
IF_RE       [iI][fF]
IN_RE       [iI][nN]
INHERITS_RE [iI][nN][hH][eE][rR][iI][tT][sS]
LET_RE      [lL][eE][tT]
LOOP_RE     [lL][oO][oO][pP]
POOL_RE     [pP][oO][oO][lL]
THEN_RE     [tT][hH][eE][nN]
WHILE_RE    [wW][hH][iI][lL][eE]
CASE_RE     [cC][aA][sS][eE]
ESAC_RE     [eE][sS][aA][cC]
OF_RE       [oO][fF]
DARROW_RE   =>
NEW_RE      [nN][eE][wW]
ISVOID_RE   [iI][sS][vV][oO][iI][dD]
/*STR_CONST_RE*/
INT_CONST_RE [0-9]+
/*BOOL_CONST_RE*/
TYPEID_RE   [A-Z][A-Z_a-z0-9]*
OBJECTID_RE [a-z][A-Z_a-z0-9]*
ASSIGN_RE   <-
NOT_RE      [nN][oO][tT]
LE_RE       <=
/*ERROR_RE*/
/*LET_STMT_RE*/

%%

 /* ------------------------------------------------------------ */
 /* keywords and symbols */
"."	{return '.';}
"@"	{return '@';}
"~"	{return '~';}
"*"	{return '*';}
"/"	{return '/';}
"+"	{return '+';}
"-"	{return '-';}
"<"	{return '<';}
"="	{return '=';}

"{"	{return '{';}
"}"	{return '}';}
"("	{return '(';}
")"	{return ')';}
":"	{return ':';}
";"	{return ';';}
","	{return ',';}

{CLASS_RE}	{return CLASS;}
{ELSE_RE}	{return ELSE;}
{FI_RE}	    {return FI;}
{IF_RE}	    {return IF;}
{IN_RE}	    {return IN;}
{INHERITS_RE}	{return INHERITS;}
{LET_RE}	{return LET;}
{LOOP_RE}	{return LOOP;}
{POOL_RE}	{return POOL;}
{THEN_RE}	{return THEN;}
{WHILE_RE}	{return WHILE;}
{CASE_RE}	{return CASE;}
{ESAC_RE}	{return ESAC;}
{OF_RE}	    {return OF;}
{DARROW_RE}	{return DARROW;}
{NEW_RE}	{return NEW;}
{ISVOID_RE}	{return ISVOID;}
{INT_CONST_RE}	{cool_yylval.symbol = inttable.add_string(yytext);return INT_CONST;}
{ASSIGN_RE}	{return ASSIGN;}
{NOT_RE}	{return NOT;}
{LE_RE}	    	{return LE;}
true        {cool_yylval.boolean=true; return BOOL_CONST;}
false       {cool_yylval.boolean=false; return BOOL_CONST;}
{TYPEID_RE}	{cool_yylval.symbol = idtable.add_string(yytext);return TYPEID;}
{OBJECTID_RE}	{cool_yylval.symbol = idtable.add_string(yytext);return OBJECTID;}
\n          {curr_lineno++;}


 /* ------------------------------------------------------------ */
 /* handle strings */
\" {string_buf_ptr = &string_buf[0];BEGIN(STRING);}

<STRING>
{
	[\"] {
	    *string_buf_ptr = '\0';
	    cool_yylval.symbol = stringtable.add_string(string_buf);
	    BEGIN(INITIAL);
	    return STR_CONST;
	}
	[\n]   {
	    curr_lineno++;
	    BEGIN(INITIAL);
	    cool_yylval.error_msg = "Unterminated string constant";
	    return ERROR;
	}
	\\n      {add_to_buffer('\n');}
	[\][\\n]   {curr_lineno++;add_to_buffer('\n');}
	[\\t]      {add_to_buffer('\t');}
	<<EOF>>    {cool_yylval.error_msg ="EOF in string constant";return ERROR;}
	[\\][0] {BEGIN(LONG_STRING);cool_yylval.error_msg="String contains null character";return ERROR;}
 	. {if(add_to_buffer(*yytext)==ERROR) return ERROR;}
}
<LONG_STRING>{
	[\"] {BEGIN(INITIAL);}
	\n   {curr_lineno++;}
	.    {;}
}

 /* ------------------------------------------------------------ */
 /* handle comments */
[\(][\*] {BEGIN(COMMENT);}
[\*][\)] {cool_yylval.error_msg = "Unmatched *)";return ERROR;}
--.* 	 {;}
<COMMENT>{
    <<EOF>>  {cool_yylval.error_msg = "EOF in comment";BEGIN(INITIAL);return ERROR;}
    [\*][\)]     {BEGIN(INITIAL);}
    \n		{curr_lineno++;}
    .        {;}
}

 /* ------------------------------------------------------------ */
 /* handle whitespace and other unmathed */
[\t ]*          {;}
.	    {cool_yylval.error_msg = yytext; return ERROR;}

%%

 /* ------------------------------------------------------------ */
 /* function definition */
int add_to_buffer(char c){
    if(string_buf_ptr - &string_buf[0] < MAX_STR_CONST){
	*string_buf_ptr++ = c;
	return 0;
    }
    else {
        BEGIN(LONG_STRING);
        cool_yylval.error_msg ="String constant too long";
        return ERROR;
    }
 }
