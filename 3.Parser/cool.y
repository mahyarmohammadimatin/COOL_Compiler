/*
*  cool.y
*              Parser definition for the COOL language.
*
*/
%{
  #include <iostream>
  #include "cool-tree.h"
  #include "stringtab.h"
  #include "utilities.h"
  
  extern char *curr_filename;
  
  
  /* Locations */
  #define YYLTYPE int              /* the type of locations */
  #define cool_yylloc curr_lineno  /* use the curr_lineno from the lexer
  for the location of tokens */
    
    extern int node_lineno;          /* set before constructing a tree node
    to whatever you want the line number
    for the tree node to be */
      
      
      #define YYLLOC_DEFAULT(Current, Rhs, N)         \
      Current = Rhs[1];                             \
      node_lineno = Current;
    
    
    #define SET_NODELOC(Current)  \
    node_lineno = Current;
    
    /* IMPORTANT NOTE ON LINE NUMBERS
    *********************************
    * The above definitions and macros cause every terminal in your grammar to 
    * have the line number supplied by the lexer. The only task you have to
    * implement for line numbers to work correctly, is to use SET_NODELOC()
    * before constructing any constructs from non-terminals in your grammar.
    * Example: Consider you are matching on the following very restrictive 
    * (fictional) construct that matches a plus between two integer constants. 
    * (SUCH A RULE SHOULD NOT BE  PART OF YOUR PARSER):
    
    plus_consts	: INT_CONST '+' INT_CONST 
    
    * where INT_CONST is a terminal for an integer constant. Now, a correct
    * action for this rule that attaches the correct line number to plus_const
    * would look like the following:
    
    plus_consts	: INT_CONST '+' INT_CONST 
    {
      // Set the line number of the current non-terminal:
      // ***********************************************
      // You can access the line numbers of the i'th item with @i, just
      // like you acess the value of the i'th exporession with $i.
      //
      // Here, we choose the line number of the last INT_CONST (@3) as the
      // line number of the resulting expression (@$). You are free to pick
      // any reasonable line as the line number of non-terminals. If you 
      // omit the statement @$=..., bison has default rules for deciding which 
      // line number to use. Check the manual for details if you are interested.
      @$ = @3;
      
      
      // Observe that we call SET_NODELOC(@3); this will set the global variable
      // node_lineno to @3. Since the constructor call "plus" uses the value of 
      // this global, the plus node will now have the correct line number.
      SET_NODELOC(@3);
      
      // construct the result node:
      $$ = plus(int_const($1), int_const($3));
    }
    
    */
    
    
    
    void yyerror(char *s);        /*  defined below; called for each parse error */
    extern int yylex();           /*  the entry point to the lexer  */
    
    /************************************************************************/
    /*                DONT CHANGE ANYTHING IN THIS SECTION                  */
    
    Program ast_root;	      /* the result of the parse  */
    Classes parse_results;        /* for use in semantic analysis */
    int omerrs = 0;               /* number of errors in lexing and parsing */
    %}
    
    /* A union of all the types that can be the result of parsing actions. */
    %union {
      Boolean boolean;
      Symbol symbol;
      Program program;
      Class_ class_;
      Classes classes;
      Feature feature;
      Features features;
      Formal formal;
      Formals formals;
      Case case_;
      Cases cases;
      Expression expression;
      Expressions expressions;
      char *error_msg;
    }
    
    /* 
    Declare the terminals; a few have types for associated lexemes.
    The token ERROR is never used in the parser; thus, it is a parse
    error when the lexer returns it.
    
    The integer following token declaration is the numeric constant used
    to represent that token internally.  Typically, Bison generates these
    on its own, but we give explicit numbers to prevent version parity
    problems (bison 1.25 and earlier start at 258, later versions -- at
    257)
    */
    %token CLASS 258 ELSE 259 FI 260 IF 261 IN 262 
    %token INHERITS 263 LET 264 LOOP 265 POOL 266 THEN 267 WHILE 268
    %token CASE 269 ESAC 270 OF 271 DARROW 272 NEW 273 ISVOID 274
    %token <symbol>  STR_CONST 275 INT_CONST 276 
    %token <boolean> BOOL_CONST 277
    %token <symbol>  TYPEID 278 OBJECTID 279 
    %token ASSIGN 280 NOT 281 LE 282 ERROR 283
    
    /*  DON'T CHANGE ANYTHING ABOVE THIS LINE, OR YOUR PARSER WONT WORK       */
    /**************************************************************************/
    
    /* Complete the nonterminal list below, giving a type for the semantic
    value of each non terminal. (See section 3.6 in the bison 
    documentation for details). */
    
    /* Declare types for the grammar's non-terminals. */
    %type <program> program
    %type <classes> class_list
    %type <class_> class
	%type <feature> feature
	%type <features> feature_list
	%type <formal> formal
	%type <formals> formal_list
	%type <cases> case_counting
	%type <expression> exp
	%type <expressions> exp_param_list
	%type <expressions> exp_param_list_helper
	%type <expressions> exp_block_list
	%type <expression> let_exp
    
    
    /* Precedence declarations go here. */
    // the precedence of cool language is considred in section 11.1
	// page 17 of cool manual.
	%right let_confilict_handeler 
	%right ASSIGN //<- (if we have more than one assignment in expression, reduce them from right)
	%left NOT
	%nonassoc '=' // as said in cool manual, this 3 comparison symbols must be nonassoc
	%nonassoc '<'
	%nonassoc LE //<=
	%left '-'
	%left '+'
	%left '/'
	%left '*'
	%left ISVOID
	%left '~'
	%left '@'
	%left '.'
    
    %%
    /* 
    Save the root of the abstract syntax tree in a global variable.
    */
	/*
	-------------------constructors of APS for programs & class-------------------
	constructor program(classes : Classes) : Program;
    constructor class_(name : Symbol; parent: Symbol; features : Features; filename : Symbol): Class_;
	Classes nil_Classes();
	Classes single_Classes(Class_);
	Classes append_Classes(Classes,Classes);
	Class_ nth(int index);
	int len();
	*/
    program	: class_list	{ @$ = @1; ast_root = program($1); }
    ;
    
    class_list
    : class	{ $$ = single_Classes($1);parse_results = $$; } /* single class */
    | class_list class { $$ = append_Classes($1,single_Classes($2));parse_results = $$;} /* several classes */
    | error ';' { yyerrok; }
    ;//class(section 3 cool-manual)
    class	: CLASS TYPEID '{' feature_list '}' ';' /* If no parent is specified, the class inherits from the Object class. */
    { $$ = class_($2,idtable.add_string("Object"),$4,stringtable.add_string(curr_filename)); }
    | CLASS TYPEID INHERITS TYPEID '{' feature_list '}' ';'
    { $$ = class_($2,$4,$6,stringtable.add_string(curr_filename)); }
    ;
    

	/*Feature list may be empty, but no empty features in list.*/
    /*
	-------------------constructors of APS for features & formals-------------------
	-- Features:
	constructor method(name : Symbol; formals : Formals;return_type : Symbol; expr: Expression) : Feature;
    constructor attr(name, type_decl : Symbol;init : Expression) : Feature;
	-- Formals
    constructor formal(name, type_decl: Symbol) : Formal;
	*/
	feature_list
	: feature_list feature{ $$ = append_Features($1, single_Features($2)); }
	| { $$ = nil_Features(); } //epsilon transition
	| error ';' { yyerrok; }
	;
	//section 3.1 cool-manual
	feature 
	: OBJECTID ':' TYPEID ';'		{ $$ = attr($1, $3, no_expr()); } //attribute(section 5 cool-manual)
	| OBJECTID ':' TYPEID ASSIGN exp ';'	{ $$ = attr($1, $3, $5); } //attribute(section 5 cool-manual)
	| OBJECTID '(' formal_list ')' ':' TYPEID '{' exp '}' ';' { $$ = method($1, $3, $6, $8); } //method(section 6 cool-manual)


	formal_list
	: formal_list ',' formal{ $$ = append_Formals($1, single_Formals($3)); }
	| { $$ = nil_Formals(); } //epsilon transition
	;
	formal //definition is in cool-tour page7
	:	OBJECTID ':' TYPEID{ $$ = formal($1, $3); }
	;


	/*
	-------------------constructors of APS for expressions-------------------
	constructor assign(name : Symbol; expr : Expression) : Expression;
	constructor static_dispatch(expr: Expression; type_name : Symbol; name : Symbol; actual : Expressions) : Expression;
	constructor dispatch(expr : Expression; name : Symbol; actual : Expressions) : Expression;
	constructor cond(pred, then_exp, else_exp : Expression): Expression;
	constructor loop(pred, body: Expression) : Expression;
	constructor typcase(expr: Expression; cases: Cases): Expression;
	constructor block(body: Expressions) : Expression;
	constructor let(identifier, type_decl: Symbol; init, body: Expression): Expression;
	constructor plus(e1, e2: Expression) : Expression;
	constructor sub(e1, e2: Expression) : Expression;
	constructor mul(e1, e2: Expression) : Expression;
	constructor divide(e1, e2: Expression) : Expression;
	constructor neg(e1: Expression) : Expression;
	constructor lt(e1, e2: Expression) : Expression;
	constructor eq(e1, e2: Expression) : Expression;
	constructor leq(e1, e2: Expression) : Expression;
	constructor comp(e1: Expression) : Expression;
	constructor int_const(token: Symbol) : Expression;
	constructor bool_const(val: Boolean) : Expression;
	constructor string_const(token: Symbol) : Expression;
	constructor new_(type_name: Symbol): Expression;
	constructor isvoid(e1: Expression): Expression;
	constructor no_expr(): Expression;  
	constructor object(name: Symbol): Expression;
	*/

	

	//all type of expressions listed in cool-manual page 16 
	exp 
	: OBJECTID ASSIGN exp{ $$ = assign($1, $3); } //assignment(section 7.3)

	//all type of dispatch come here(section 7.4)
	| exp '.' OBJECTID '(' exp_param_list ')' { $$ = dispatch($1, $3, $5); } //dispatch type 1
	/* as we see in dispatch constructor, (Expression,Symbol,Expressions) we must pass expression
	in first argument. but when we add "self" to idtable, the function return symbol not a expression.
	here APS prepare us some function called object() that can get symbol and make epression of it.
	*/
	| OBJECTID '(' exp_param_list ')' { $$ = dispatch(object(idtable.add_string("self")), $1, $3); } //dispatch type 2
	| exp '@' TYPEID '.' OBJECTID '(' exp_param_list ')' { $$ = static_dispatch($1, $3, $5, $7); } //static dispatch

	| IF exp THEN exp ELSE exp FI{ $$ = cond($2, $4, $6); } //conditionals(section 7.5)
	| WHILE exp LOOP exp POOL{ $$ = loop($2, $4); } //loops(section 7.6)
	| '{' exp_block_list '}' { $$ = block($2); } //blocks(section 7.7)

	| LET let_exp{ $$ = $2; }
	| CASE exp OF case_counting ESAC{ $$ = typcase($2, $4); }

	//operators, new, isvoid (section 7.10 to 7.12)
	| NEW TYPEID{ $$ = new_($2); }
	| ISVOID exp{ $$ = isvoid($2); }
	| exp '+' exp{ $$ = plus($1, $3); }
	| exp '-' exp{ $$ = sub($1, $3); }
	| exp '*' exp{ $$ = mul($1, $3); }
	| exp '/' exp{ $$ = divide($1, $3); }
	| '~' exp { $$ = neg($2); }
	| exp '<' exp{ $$ = lt($1, $3); }
	| exp LE exp{ $$ = leq($1, $3); }
	| exp '=' exp{ $$ = eq($1, $3); }
	| NOT exp{ $$ = comp($2); }
	| '(' exp ')' { $$ = $2; }
	//name, integer, string, boolean 
	| OBJECTID{ $$ = object($1); }
	| INT_CONST{ $$ = int_const($1); }
	| STR_CONST{ $$ = string_const($1); }
	| BOOL_CONST{ $$ = bool_const($1); }
	;
    
	//CFG for (exp[,exp]*)|epsilon comes in function parameters
	exp_param_list 
	: exp exp_param_list_helper{ $$ = append_Expressions(single_Expressions($1), $2); }
	| { $$ = nil_Expressions(); }
	;
	exp_param_list_helper
	: exp_param_list_helper ',' exp { $$ = append_Expressions($1, single_Expressions($3)); }
	| { $$ = nil_Expressions(); }

	// CFG for [exp;]+ comes in blocks
	exp_block_list
	:exp ';' { $$ = single_Expressions($1); }
	| exp_block_list exp ';' { $$ = append_Expressions($1, single_Expressions($2)); }
	| error ';' { yyerrok; }
    
	// CFG for OBJECT : TYPEID DARROW exp that come in cases
	case_counting
	: OBJECTID ':' TYPEID DARROW exp ';'{ $$ = single_Cases(branch($1, $3, $5)); }
	| case_counting OBJECTID ':' TYPEID DARROW exp ';' { $$ = append_Cases($1, single_Cases(branch($2, $4, $6))); }
	


	let_exp
	: OBJECTID ':' TYPEID IN exp %prec let_confilict_handeler { $$ = let($1, $3, no_expr(), $5); }
	| OBJECTID ':' TYPEID ASSIGN exp IN exp %prec let_confilict_handeler { $$ = let($1, $3, $5, $7); }
	| OBJECTID ':' TYPEID ASSIGN exp ',' let_exp %prec let_confilict_handeler { $$ = let($1, $3, $5, $7); }
	| OBJECTID ':' TYPEID ',' let_exp %prec let_confilict_handeler { $$ = let($1, $3, no_expr(), $5); }
	;

    /* end of grammar */
    %%
    
    /* This function is called automatically when Bison detects a parse error. */
    void yyerror(char *s)
    {
      extern int curr_lineno;
      
      cerr << "\"" << curr_filename << "\", line " << curr_lineno << ": " \
      << s << " at or near ";
      print_cool_token(yychar);
      cerr << endl;
      omerrs++;
      
      if(omerrs>50) {fprintf(stdout, "More than 50 errors\n"); exit(1);}
    }
    
    