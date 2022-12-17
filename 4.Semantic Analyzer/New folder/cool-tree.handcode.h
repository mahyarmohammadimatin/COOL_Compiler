#pragma once
//
// The following include files must come first.

#ifndef COOL_TREE_HANDCODE_H
#define COOL_TREE_HANDCODE_H

#include <iostream>
#include "tree.h"
#include "cool.h"
#include "stringtab.h"
#include <symtab.h>
#include <map>
#include <vector>
#define yylineno curr_lineno;
extern int yylineno;

using std::map;
using std::vector;

class ClassTable;

inline Boolean copy_Boolean(Boolean b) { return b; }
inline void assert_Boolean(Boolean) {}
inline void dump_Boolean(ostream& stream, int padding, Boolean b)
{
	stream << pad(padding) << (int)b << "\n";
}

void dump_Symbol(ostream& stream, int padding, Symbol b);
void assert_Symbol(Symbol b);
Symbol copy_Symbol(Symbol b);

class Program_class;
typedef Program_class* Program;
class Class__class;
typedef Class__class* Class_;
class Feature_class;
typedef Feature_class* Feature;
class Formal_class;
typedef Formal_class* Formal;
class Expression_class;
typedef Expression_class* Expression;
class Case_class;
typedef Case_class* Case;

typedef list_node<Class_> Classes_class;
typedef Classes_class* Classes;
typedef list_node<Feature> Features_class;
typedef Features_class* Features;
typedef list_node<Formal> Formals_class;
typedef Formals_class* Formals;
typedef list_node<Expression> Expressions_class;
typedef Expressions_class* Expressions;
typedef list_node<Case> Cases_class;
typedef Cases_class* Cases;

//############################## Mahyar Comment ################################
struct ClassFeatures {
	map <Symbol, vector<Symbol> > methodEnv;
	map <Symbol, Symbol> attrEnv;
};

struct Environment {
	//# map from attr name to it's type check result.
	SymbolTable <Symbol, Symbol>* ObjEnv;
	//# map from each class to it's methods. and the inner map is a map from
	//# function name to vector of formalArgsType+returnType.
	map < Class_, map <Symbol, vector<Symbol> > > MthEnv;

	Class_ currentClass;
};

//###############################################################################

#define Program_EXTRAS                          \
virtual void semant() = 0;			\
virtual void dump_with_types(ostream&, int) = 0; \
virtual void semanticTypeChecking(ClassTable *&classTable)=0;


#define program_EXTRAS                          \
void semant();     				\
void dump_with_types(ostream&, int);   \
void semanticTypeChecking(ClassTable *&classTable);

#define Class__EXTRAS                   \
virtual Symbol get_filename() = 0;      \
virtual void dump_with_types(ostream&,int) = 0;  \
virtual Symbol pass_name() = 0;       \
virtual Symbol pass_parent() = 0;   \
virtual void set_parent_object() = 0; \
virtual Features pass_features() = 0; \
virtual void TypeCheck(Environment environment, ClassTable*& classTable) = 0;


#define class__EXTRAS                                 \
Symbol get_filename() { return filename; }             \
void dump_with_types(ostream&,int);  \
Symbol pass_name(); \
Symbol pass_parent(); \
void set_parent_object(); \
Features pass_features(); \
void TypeCheck(Environment environment, ClassTable*& classTable);


#define Feature_EXTRAS                                        \
virtual void dump_with_types(ostream&,int) = 0; 


#define Feature_SHARED_EXTRAS                                       \
void dump_with_types(ostream&,int);    


#define method_EXTRAS                        \
Symbol pass_name();                          \
Formals pass_formals();                       \
Symbol pass_ret_type(); \
void TypeCheck(Environment environment, ClassTable*& classTable);

#define attr_EXTRAS                         \
Symbol pass_name();                          \
Symbol pass_type(); \
void TypeCheck(Environment environment, ClassTable*& classTable);


#define Formal_EXTRAS                              \
virtual void dump_with_types(ostream&,int) = 0; \
virtual Symbol pass_name()=0;                          \
virtual Symbol pass_type()=0; \
virtual void TypeCheck(Environment environment, ClassTable*& classTable)=0; 

#define formal_EXTRAS                           \
void dump_with_types(ostream&,int); \
Symbol pass_name();                          \
Symbol pass_type(); \
void TypeCheck(Environment environment, ClassTable*& classTable); 


#define Case_EXTRAS                             \
virtual void dump_with_types(ostream& ,int) = 0;\
virtual Symbol TypeCheck(Environment environment, ClassTable*& classTable)=0; \
virtual Symbol pass_type() = 0; 


#define branch_EXTRAS                                   \
void dump_with_types(ostream& ,int);\
Symbol TypeCheck(Environment environment, ClassTable*& classTable); \
Symbol pass_type(); 

#define Expression_EXTRAS                    \
Symbol type;                                 \
Symbol pass_type() { return type; }           \
Expression set_type(Symbol s) { type = s; return this; } \
virtual void dump_with_types(ostream&,int) = 0;  \
void dump_type(ostream&, int);               \
Expression_class() { type = (Symbol) NULL; } \
virtual Symbol TypeCheck(Environment environment, ClassTable*& classTable)=0; 

#define Expression_SHARED_EXTRAS           \
void dump_with_types(ostream&,int);  \
Symbol TypeCheck(Environment environment, ClassTable*& classTable);

#endif
