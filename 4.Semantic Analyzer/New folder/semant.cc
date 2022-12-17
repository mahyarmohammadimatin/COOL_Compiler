#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include "semant.h"
#include <algorithm>
#include "utilities.h"


extern int semant_debug;
extern char* curr_filename;

//////////////////////////////////////////////////////////////////////
//
// Symbols
//
// For convenience, a large number of symbols are predefined here.
// These symbols include the primitive type and method names, as well
// as fixed names used by the runtime system.
//
//////////////////////////////////////////////////////////////////////
static Symbol
arg,
arg2,
Bool,
concat,
cool_abort,
copy_,
Int,
in_int,
in_string,
IO,
length,
Main,
main_meth,
No_class,
No_type,
Object,
out_int,
out_string,
prim_slot,
self,
SELF_TYPE,
Str,
str_field,
substr,
type_name,
val;
//
// Initializing the predefined symbols.
//
static void initialize_constants(void)
{
	arg = idtable.add_string("arg");
	arg2 = idtable.add_string("arg2");
	Bool = idtable.add_string("Bool");
	concat = idtable.add_string("concat");
	cool_abort = idtable.add_string("abort");
	copy_ = idtable.add_string("copy");
	Int = idtable.add_string("Int");
	in_int = idtable.add_string("in_int");
	in_string = idtable.add_string("in_string");
	IO = idtable.add_string("IO");
	length = idtable.add_string("length");
	Main = idtable.add_string("Main");
	main_meth = idtable.add_string("main");
	//   _no_class is a symbol that can't be the name of any 
	//   user-defined class.
	No_class = idtable.add_string("_no_class");
	No_type = idtable.add_string("_no_type");
	Object = idtable.add_string("Object");
	out_int = idtable.add_string("out_int");
	out_string = idtable.add_string("out_string");
	prim_slot = idtable.add_string("_prim_slot");
	self = idtable.add_string("self");
	SELF_TYPE = idtable.add_string("SELF_TYPE");
	Str = idtable.add_string("String");
	str_field = idtable.add_string("_str_field");
	substr = idtable.add_string("substr");
	type_name = idtable.add_string("type_name");
	val = idtable.add_string("_val");
}

map<Symbol, Class_> set_new_class(map <Symbol, Class_> classInfo, Class_ my_new_class) {
	classInfo[my_new_class->pass_name()] = my_new_class;
	return classInfo;
}

ClassTable::ClassTable(Classes classes) : semant_errors(0), error_stream(cerr) {

	/* Fill this in */
	install_basic_classes();
	//# save basic class names
	map<Symbol, Class_> basic_class_names(classInfo);

	//# parse tree pass classes that contains all user defined classes to us. 
	//# so now let's iterate on it(as mentioned in tree.h) and chck for bad
	//# inheritance or bad class definitions
	for (int i = classes->first(); classes->more(i); i = classes->next(i)) {
		Class_ cur_class = classes->nth(i);
		Symbol cur_name = cur_class->pass_name();
		Symbol cur_parent = cur_class->pass_parent();
		//# if class dosn't exist yet we can just add it
		if (classInfo.find(cur_class->pass_name()) == classInfo.end()) {
			classInfo = set_new_class(classInfo, cur_class);
		}
		else { //# redifinition_error
			semant_error(cur_class);
			cur_class->set_parent_object(); //# set parent to object to continue
			cur_parent = Object;
			if (basic_class_names.find(cur_name) != basic_class_names.end()) {
				//# class is redefined from basic class
				error_stream << "your class name is the same name of basic class " << cur_name->get_string() << "." << endl;
			}
			else {
				//# class is redefined by user defined class
				error_stream << "your class " << cur_name->get_string() << " defined twice!" << endl;
			}
		}
		if ((basic_class_names.find(cur_parent) != basic_class_names.end()) && (cur_parent != Object)) {
			//# class is inherit from base classes
			semant_error(cur_class);
			error_stream << "your class " << cur_name->get_string() << " is inherit from base class" << cur_parent->get_string() << "." << endl;
			cur_class->set_parent_object();
			cur_parent = Object;
		}
	}
	//# second pass on classes to check parents and add them to classParents 
	for (map<Symbol, Class_>::iterator it = classInfo.begin(); it != classInfo.end(); it++) {
		Class_ cur_class = it->second;
		Symbol cur_name = cur_class->pass_name();
		Symbol cur_parent = cur_class->pass_parent();

		if (cur_name == Object) continue;

		vector<Symbol> inherit_list;
		//# loop to find all parents
		while (cur_parent != Object && cur_parent != No_class) {
			inherit_list.push_back(cur_parent);
			//#check to find loop in inheritance tree
			if (cur_parent == cur_name) {
				semant_error(cur_class);
				error_stream << "Class " << cur_name->get_string() << ", or an ancestor of " << cur_name->get_string() << ", is involved in an inheritance cycle." << endl;
				cur_class->set_parent_object();
				cur_parent = Object;
			}
			//cout << "class " << cur_name->get_string() << "has father " << cur_parent->get_string() << endl;
			//# check if parent exist
			if (classInfo.find(cur_parent) == classInfo.end()) {
				semant_error(cur_class);
				error_stream << "Class " << cur_name->get_string() << " father " << cur_parent->get_string() << " is not defined." << endl;
				cur_class->set_parent_object();
				cur_parent = Object;
			}
			cur_parent = (classInfo.find(cur_parent)->second)->pass_parent();
		}
		inherit_list.push_back(Object);
		classParents[cur_name] = inherit_list;
	}


}


void ClassTable::install_basic_classes() {

	// The tree package uses these globals to annotate the classes built below.
   // curr_lineno  = 0;
	Symbol filename = stringtable.add_string("<basic class>");

	// The following demonstrates how to create dummy parse trees to
	// refer to basic Cool classes.  There's no need for method
	// bodies -- these are already built into the runtime system.

	// IMPORTANT: The results of the following expressions are
	// stored in local variables.  You will want to do something
	// with those variables at the end of this method to make this
	// code meaningful.

	// 
	// The Object class has no parent class. Its methods are
	//        abort() : Object    aborts the program
	//        type_name() : Str   returns a string representation of class name
	//        copy() : SELF_TYPE  returns a copy of the object
	//
	// There is no need for method bodies in the basic classes---these
	// are already built in to the runtime system.

	//############################# mahyar comment ############################### 
	//# class_ is just a constructor(defined in cool-tree.h) that sets this attrs:
	//# Symbol name -> name of the classs
	//# Symbol parent -> parent of that class
	//# Features features -> features that is feature list. feature is attr and method
	//# Symbol filename -> which group of class this class belongs to. for example 
	//# object class is belongs to <basic class>

	//# method is just a constructor(defined in cool-tree.h) that sets:
	//# Symbol name -> name of the function
	//# Formals formals -> list of formal. formal is the parameters of function
	//# Symbol return_type -> return type of the function
	//# Expression expr -> body of the function as an expression

	Class_ Object_class =
		class_(Object,
			No_class,
			append_Features(
				append_Features(
					single_Features(method(cool_abort, nil_Formals(), Object, no_expr())),
					single_Features(method(type_name, nil_Formals(), Str, no_expr()))),
				single_Features(method(copy_, nil_Formals(), SELF_TYPE, no_expr()))),
			filename);

	// 
	// The IO class inherits from Object. Its methods are
	//        out_string(Str) : SELF_TYPE       writes a string to the output
	//        out_int(Int) : SELF_TYPE            "    an int    "  "     "
	//        in_string() : Str                 reads a string from the input
	//        in_int() : Int                      "   an int     "  "     "
	//
	Class_ IO_class =
		class_(IO,
			Object,
			append_Features(
				append_Features(
					append_Features(
						single_Features(method(out_string, single_Formals(formal(arg, Str)),
							SELF_TYPE, no_expr())),
						single_Features(method(out_int, single_Formals(formal(arg, Int)),
							SELF_TYPE, no_expr()))),
					single_Features(method(in_string, nil_Formals(), Str, no_expr()))),
				single_Features(method(in_int, nil_Formals(), Int, no_expr()))),
			filename);

	//
	// The Int class has no methods and only a single attribute, the
	// "val" for the integer. 
	//
	Class_ Int_class =
		class_(Int,
			Object,
			single_Features(attr(val, prim_slot, no_expr())),
			filename);

	//
	// Bool also has only the "val" slot.
	//
	Class_ Bool_class =
		class_(Bool, Object, single_Features(attr(val, prim_slot, no_expr())), filename);

	//
	// The class Str has a number of slots and operations:
	//       val                                  the length of the string
	//       str_field                            the string itself
	//       length() : Int                       returns length of the string
	//       concat(arg: Str) : Str               performs string concatenation
	//       substr(arg: Int, arg2: Int): Str     substring selection
	//       
	Class_ Str_class =
		class_(Str,
			Object,
			append_Features(
				append_Features(
					append_Features(
						append_Features(
							single_Features(attr(val, Int, no_expr())),
							single_Features(attr(str_field, prim_slot, no_expr()))),
						single_Features(method(length, nil_Formals(), Int, no_expr()))),
					single_Features(method(concat,
						single_Formals(formal(arg, Str)),
						Str,
						no_expr()))),
				single_Features(method(substr,
					append_Formals(single_Formals(formal(arg, Int)),
						single_Formals(formal(arg2, Int))),
					Str,
					no_expr()))),
			filename);

	classInfo = set_new_class(classInfo, Object_class);
	classInfo = set_new_class(classInfo, IO_class);
	classInfo = set_new_class(classInfo, Int_class);
	classInfo = set_new_class(classInfo, Bool_class);
	classInfo = set_new_class(classInfo, Str_class);
}

//###################### Mahyar IMPORTANT Comment ################################
//# so as we know from compiler class, for type checking we need 
//# semantic environment that contains O,M,C that stands for 
//# object Environment, Method Environment and current class. in our code
//# we defined a C++ structure called Environment that contains O,M and C 
//# (can be find in cool-tree.handcode.h) as follow:
//# - SymbolTable<Symbol, Symbol>* ObjEnv
//# - map< Class_, map<Symbol, vector<Symbol>> > MthEnv
//# - Class_ currentClass

//# add new method to MthEnv(method environment)
void checkAndAddMethod(Class_ curClass,
	Method newMethod,
	map<Symbol, vector<Symbol> >& mthEnv,
	ClassTable*& classTable) {

	vector<Symbol> formalsType;
	Formals curFormals = newMethod->pass_formals();

	//# loop on formals and check them individualy
	for (int i = curFormals->first(); curFormals->more(i); i = curFormals->next(i)) {
		Formal curFormal = curFormals->nth(i);
		Symbol curName = curFormal->pass_name();
		Symbol curType = curFormal->pass_type();

		//# here we check some function definition semantic errors
		{
			if (curType == SELF_TYPE) {
				//#Formal parameter c cannot have type SELF_TYPE.
				classTable->semant_error(curClass);
				classTable->error_stream << "Formal parameter " << curName->get_string() << " cannot have type SELF_TYPE." << endl;
				curType = Object;
			}
			else if (classTable->classInfo.find(curType) == classTable->classInfo.end()) {
				//# Class N of formal parameter a is undefined.
				classTable->semant_error(curClass);
				classTable->error_stream << "Class " << curType->get_string() << " of formal parameter " << curName->get_string() << " is undefined." << endl;
				curType = Object;
			}
			if (find(formalsType.begin(), formalsType.end(), curName) != formalsType.end()) {
				//# Formal parameter a is multiply defined.
				classTable->semant_error(curClass);
				classTable->error_stream << "Formal parameter " << curName->get_string() << " is multiply defined in method " << newMethod->pass_name()->get_string() << "." << endl;
			}
			if (curName == self) {
				//# 'self' cannot be the name of a formal parameter.
				classTable->semant_error(curClass);
				classTable->error_stream << "'self' cannot be the name of a formal parameter." << endl;
			}
		}

		//# add to formals type list
		formalsType.push_back(curType);
	}

	Symbol curName = newMethod->pass_name();
	Symbol retType = newMethod->pass_ret_type();
	if (retType != SELF_TYPE) {
		if (classTable->classInfo.find(retType) == classTable->classInfo.end()) {
			// return type is undefined
			classTable->semant_error(curClass);
			classTable->error_stream << "Undefined return type " << retType->get_string() << " in method " << curName->get_string() << "." << endl;
			retType = Object;
		}

	}

	if (mthEnv.find(curName) != mthEnv.end()) {
		// Method c is multiply defined.
		classTable->semant_error(curClass);
		classTable->error_stream << "Method " << curName->get_string() << " is multiply defined in class " << curClass->pass_name()->get_string() << "." << endl;
	}

	formalsType.push_back(retType);
	mthEnv[curName] = formalsType;
}

//# adds new attribute to the ObjEnv(object Environment)
void checkAndAddAttr(Class_ curClass,
	Attr newAttr,
	map <Symbol, Symbol>& attrEnv,
	ClassTable*& classTable) {

	Symbol curName = newAttr->pass_name();
	Symbol curType = newAttr->pass_type();

	//# attributes semantic check
	{
		if (curType != SELF_TYPE) {
			if (classTable->classInfo.find(curType) == classTable->classInfo.end()) {
				//# attribute type is undefined
				if (curType != prim_slot) {
					classTable->semant_error(curClass);
					classTable->error_stream << "type " << curType->get_string() << " of attribute " << curName->get_string() << " is undefined." << endl;
					curType = Object;
				}
			}
		}
		//# Attribute b is multiply defined in class.
		if (attrEnv.find(curName) != attrEnv.end()) {
			classTable->semant_error(curClass);
			classTable->error_stream << "Attribute " << curName->get_string() << " is multiply defined in class " << curClass->pass_name()->get_string() << "." << endl;
		}
		if (curName == self) {
			// 'self' cannot be the name of an attribute.
			classTable->semant_error(curClass);
			classTable->error_stream << "'self' cannot be the name of an attribute." << endl;
		}
	}

	attrEnv[curName] = curType;

}

bool isSubType(Symbol class1, Symbol class2, Class_ currentClass, ClassTable*& classTable) {
	//# if class1 <= class2 return true
	vector<Symbol> class1parents = classTable->classParents[class1];
	if (class1 == class2) return true;
	if (class1 == SELF_TYPE) {
		return isSubType(currentClass->pass_name(), class2, currentClass, classTable);
	}
	if (class2 == SELF_TYPE) return false;//# no class can be a sub type of SELF_TYPE
	//#check all parents
	//#if (count(class1parents.begin(), class1parents.end(), class2)) return true;
	if (std::find(class1parents.begin(), class1parents.end(), class2) != class1parents.end()) return true;
	else return false;
}
Symbol join(Symbol class1, Symbol class2, Class_ currentClass, ClassTable * &classTable) {
	//# just like cool manual definition in section 7.5 we define join that find first cummon
	//# parent of two class

	vector<Symbol> class1parents = classTable->classParents[class1];
	vector<Symbol> class2parents = classTable->classParents[class2];
	if (class1 == class2) return class1;

	if (class1 == SELF_TYPE) return join(currentClass->pass_name(), class2, currentClass, classTable);
	if (class2 == SELF_TYPE) return join(class1, currentClass->pass_name(), currentClass, classTable);

	for (size_t i = 0; i < class1parents.size(); i++) {
		for (size_t j = 0; j < class2parents.size(); j++) {
			if (class1parents[i] == class2parents[j]) {
				return class1parents[i];
			}
		}
	}
	return Object;
}


void program_class::semanticTypeChecking(ClassTable * &classTable) {
	map <Symbol, ClassFeatures> tempEnv;
	map <Symbol, Class_> classInfo = classTable->classInfo;
	map <Symbol, vector<Symbol> > classParents = classTable->classParents;

	//#loop on classes to extract their methods and attrs
	for (map<Symbol, Class_>::iterator it = classInfo.begin(); it != classInfo.end(); it++) {
		Symbol curName = it->first;
		Class_ curClass = it->second;

		//# save featurs to this variables
		map <Symbol, vector<Symbol> > methodEnv;
		map <Symbol, Symbol> attrEnv;

		Features curFeautures = curClass->pass_features();
		for (int i = curFeautures->first(); curFeautures->more(i); i = curFeautures->next(i)) {
			Feature curFeautre = curFeautures->nth(i);
			//#is this feature method or attr?
			Method curMethod = dynamic_cast<Method>(curFeautre);
			if (curMethod != NULL) { //# it's method
				checkAndAddMethod(curClass, curMethod, methodEnv, classTable);
			}
			else { //# it's attribute
				Attr curAttr = dynamic_cast<Attr>(curFeautre);
				checkAndAddAttr(curClass, curAttr, attrEnv, classTable);
			}
		}
		//# adds the features to the tempEnv of each class!
		ClassFeatures tempFeature;
		tempFeature.methodEnv = methodEnv;
		tempFeature.attrEnv = attrEnv;
		tempEnv[curName] = tempFeature;
	}

	// Check if we have the class Main!
	if (classInfo.find(Main) == classInfo.end()) {
		// Class Main is not defined. 
		classTable->semant_error();
		classTable->error_stream << "you forget to define main class!" << endl;
	}
	else if ((tempEnv[Main].methodEnv).find(main_meth) == (tempEnv[Main].methodEnv).end()) {
		// No 'main' method in class Main.
		classTable->semant_error(classInfo[Main]);
		classTable->error_stream << "you forget to define main function in main class!" << endl;
	}

	//# methodEnvironment later be set on methodEnv in our eviroment
	map < Class_, map <Symbol, vector<Symbol> > > methodEnvironment;
	//# now we loop on class and make method enviroment of class
	for (map<Symbol, Class_>::iterator it = classInfo.begin(); it != classInfo.end(); it++) {
		Symbol curName = it->first;
		Class_ curClass = it->second;

		vector<Symbol> parents = classParents[curName];
		parents.insert(parents.begin(), curName);
		//# let's loop on class and it's parents from object to the class it self
		//# and add all functions that are in class or it's parent.
		int n = parents.size();
		for (int i = 0; i < n; i++) {
			Symbol curParent = parents[i];
			map <Symbol, vector<Symbol> > curParentMethods = tempEnv[curParent].methodEnv;
			//# combine this two map
			for (map<Symbol, vector<Symbol> >::iterator it = curParentMethods.begin();
				it != curParentMethods.end(); it++) {
				methodEnvironment[curClass][it->first] = it->second;
			}
		}
	}



	//# as we see in symtab_example.h
	SymbolTable<Symbol, Symbol>* objectEnvironment = new SymbolTable<Symbol, Symbol>();
	//# now we loop on each class to make object enviroment of class
	for (map<Symbol, Class_>::iterator it = classInfo.begin(); it != classInfo.end(); it++) {
		Symbol curName = it->first;
		Class_ curClass = it->second;
		vector<Symbol> parents = classParents[curName];
		map <Symbol, vector<Symbol> > curClassMethods = tempEnv[curName].methodEnv;
		map <Symbol, Symbol> curClassAttrs = tempEnv[curName].attrEnv;

		//# start this class scope
		objectEnvironment->enterscope();
		parents.insert(parents.begin(), curName); //# add class as it parents to include in loop
		int n = parents.size();
		for (int i = 0;i < n;i++) {
			map <Symbol, Symbol>& curParentAttrs = tempEnv[parents[i]].attrEnv;
			for (map<Symbol, Symbol>::iterator it = curClassAttrs.begin(); it != curClassAttrs.end(); it++) {
				objectEnvironment->addid(it->first, &(it->second));
			}
		}


		Environment environment;
		environment.ObjEnv = objectEnvironment;
		environment.MthEnv = methodEnvironment;
		environment.currentClass = curClass;

		//################################ Mahyar Comment #############################
		//# our environment is ready and we can begin semnatic analysis for this specific class
		//# we use recursive decent algorithm that is a backtrack kind of algorithm start
		//# from class node and get down to all methods and attrs for type checking them
		//# and thir expression.
		curClass->TypeCheck(environment, classTable);

		//# exit scope and enter a new class scope later
		environment.ObjEnv->exitscope();

	}
}


//################################## Mahyar Comments ####################################
//# here we start type checking! all type checking rules fortunatly listed in 
//# section 12.2 of cool manual!
void class__class::TypeCheck(Environment environment, ClassTable * &classTable) {
	//# so we want to type check a class! we should first type check all of the class
	//# methods and then all attrs.
	Features classFeatures = (environment.currentClass)->pass_features();
	for (int i = classFeatures->first(); classFeatures->more(i); i = classFeatures->next(i)) {
		Feature curFeature = features->nth(i);
		Method curMethod = dynamic_cast<Method>(curFeature);
		if (curMethod != NULL) {
			curMethod->TypeCheck(environment, classTable);
		}
		else {
			Attr curAttr = dynamic_cast<Attr>(curFeature);
			curAttr->TypeCheck(environment, classTable);
		}
	}
}

void method_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	(environment.ObjEnv)->enterscope();
	(environment.ObjEnv)->addid(self, &SELF_TYPE);
	//#type check all formal parameters
	for (int i = formals->first(); formals->more(i); i = formals->next(i)) {
		Formal curFormal = formals->nth(i);
		Symbol curType = curFormal->pass_type();
		//# just add formal parameters to our environment
		curFormal->TypeCheck(environment, classTable);
	}
	//# type check function body
	Symbol bodyType = expr->TypeCheck(environment, classTable);

	if (!isSubType(bodyType, return_type, environment.currentClass, classTable)) {
		if (No_type != bodyType) {
			classTable->semant_error_(this, environment.currentClass);
			classTable->error_stream << " returned expression " <<
				bodyType->get_string() << " of function " << name->get_string() <<
				" is not match the function return type " << return_type->get_string() <<
				"." << endl;
		}
	}
	(environment.ObjEnv)->exitscope();
}

void formal_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	(environment.ObjEnv)->addid(name, &type_decl);
}

void attr_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	(environment.ObjEnv)->enterscope();
	(environment.ObjEnv)->addid(self, &SELF_TYPE);
	//# check if attr has initialaztion. if not, we just add it to env.
	if (dynamic_cast<no_expr_class*>(init) == NULL) {
		Symbol initType = init->TypeCheck(environment, classTable);
		if (!isSubType(initType, type_decl, environment.currentClass, classTable)) {
			//Inferred type String of initialization of attribute b does not conform to declared type Int.
			classTable->semant_error_(this, environment.currentClass);
			classTable->error_stream << "type of your initialaztion " <<
				initType->get_string() << " of attribute " << name->get_string() <<
				" is not match the type " << type_decl->get_string() <<
				"." << endl;
		}
	}
	(environment.ObjEnv)->exitscope();
}

Symbol assign_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	Symbol exprType = expr->TypeCheck(environment, classTable);
	Symbol* lookupPtr = environment.ObjEnv->lookup(name);

	if (lookupPtr == NULL) {
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "Undeclared identifier " <<
			name->get_string() << "." << endl;
		type = Object;
		return type;
	}

	Symbol originalType = *lookupPtr;

	if (exprType == SELF_TYPE) {
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "Cannot assign to self object" << endl;
		exprType = Object;
	}
	else if (!isSubType(exprType, originalType, environment.currentClass, classTable)) {
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "Inferred type " <<
			exprType->get_string() << " of assignment of attribute " << name->get_string() <<
			" does not conform to declared type " << originalType->get_string() <<
			"." << endl;
	}

	type = exprType;
	return type;
}

Symbol dispatch_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	
	Symbol exprType = expr->TypeCheck(environment, classTable); //# e0:T0

	Class_ methodClass;
	//# get class that e0 represent it
	if (exprType == SELF_TYPE) methodClass = environment.currentClass;
	else methodClass = classTable->classInfo[exprType];
	

	map <Symbol, vector<Symbol> > classMethods = environment.MthEnv[methodClass];
	vector<Symbol> methodSign;

	//# Dispatch to undefined method f.
	if (classMethods.find(name) == classMethods.end()) {
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "Dispatch to undefined method " <<
			name->get_string() << endl;
		type = Object; // err recovery
		return type;
	}

	else {
		methodSign = environment.MthEnv[methodClass][name];
	}

	Symbol methodRetType = methodSign.back();
	methodSign.pop_back();
	vector<Symbol> argTypes = methodSign;

	Expressions actualArgs = actual; //# e1,...,en
	size_t actualArgsSize = actualArgs->len();
	//# Method f called with wrong number of arguments.
	if (argTypes.size() != actualArgsSize) {
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "Method " <<
			name->get_string() << " called with wrong number of arguments." << endl;
		type = Object;
		return type;
	}

	int j = 0;
	for (int i = actualArgs->first(); actualArgs->more(i); i = actualArgs->next(i)) {
		Expression curExp = actualArgs->nth(i);
		Symbol curType = curExp->TypeCheck(environment, classTable); // e1:T1,...,en:Tn
		//# In call of method f, type Int of parameter no. 2 does not conform to declared type Bool.
		if (!isSubType(curType, argTypes[j], environment.currentClass, classTable)) {
			classTable->semant_error_(this, environment.currentClass);
			classTable->error_stream << "In call of method " <<
				name->get_string() << ", type " << curType->get_string() << " of the parameter no. " <<
				(j + 1) << " does not conform to declared type " << argTypes[j]->get_string() << "." << endl;
		}
		j++;
	}

	if (methodRetType == SELF_TYPE) type = exprType; //# T0
	else type = methodRetType; //# T(n+1)

	return type;
}

Symbol static_dispatch_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	//# e0@T.f(e1,...,en) : Tn+1

	Symbol exprType = expr->TypeCheck(environment, classTable); //# e0:T0

	Class_ methodClass = classTable->classInfo[type_name];

	map <Symbol, vector<Symbol> > classMethods = environment.MthEnv[methodClass];
	vector<Symbol> methodSign;

	//# Dispatch to undefined method f
	if (classMethods.find(name) == classMethods.end()) {
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "Dispatch to undefined method " <<
			name->get_string() << endl;
		type = Object; 
		return type;
	}
	else {
		methodSign = environment.MthEnv[methodClass][name];
	}

	//# Type x of expression does not conform to static type y of dispatch f of class C
	//# compare exprType(T0) with type_name(T) so that T0<=T
	if (!isSubType(exprType, type_name, environment.currentClass, classTable)) {
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "Type " << exprType->get_string() <<
			" of expression does not conform to static type " <<
			type_name->get_string() << " of dispatch " << name->get_string() << "." << endl;
		type = Object; 
		return type;
	}

	Symbol methodRetType = methodSign.back();
	methodSign.pop_back();
	vector<Symbol> argTypes = methodSign;

	size_t actualSize = actual->len(); // e1,...,en
	if (argTypes.size() != actualSize) {
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "Incompatible number of arguments on dispatch of method " <<
			name->get_string() << "." << endl;
		type = Object; 
		return type;
	}

	int j = 0;
	for (int i = actual->first(); actual->more(i); i = actual->next(i)) {
		Expression curExp = actual->nth(i);
		Symbol curType = curExp->TypeCheck(environment, classTable); //# e1:T1,...,en:Tn
		if (!isSubType(curType, argTypes[j], environment.currentClass, classTable)) {
			//# In call of method f, type Int of parameter no. x does not conform to declared type Bool.
			classTable->semant_error_(this, environment.currentClass);
			classTable->error_stream << "In call of method " <<
				name->get_string() << ", type " << curType->get_string() << " of the parameter no. " <<
				(j + 1) << " does not conform to declared type " << argTypes[j]->get_string() << "." << endl;
		}
		j++;
	}

	if (methodRetType == SELF_TYPE) type = exprType; // T0
	else type = methodRetType;
	return type;
}

Symbol cond_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	Symbol typePred = pred->TypeCheck(environment, classTable);
	Symbol typeThen = then_exp->TypeCheck(environment, classTable);
	Symbol typeElse = else_exp->TypeCheck(environment, classTable);
	if (typePred != Bool) {
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "If condition does not have type Bool." << endl;
	}
	//# use join or least upper bound
	type = join(typeThen, typeElse, environment.currentClass, classTable);
	return type;
}

Symbol loop_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	Symbol typePred = pred->TypeCheck(environment, classTable);
	Symbol typeBody = body->TypeCheck(environment, classTable); // Is not used tho.
	if (typePred != Bool) {
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "Loop condition does not have type Bool." << endl;
	}
	type = Object; //# type of loop is always Object
	return type;
}

Symbol typcase_class::TypeCheck(Environment environment, ClassTable * &classTable) {

	//# so it's important here that each branch of casse have distinct types.
	//# also the returned type of a case is LUB or join of all types in it's branches.
	expr->TypeCheck(environment, classTable);
	vector<Symbol> varTypes; //# to save all types of branches
	Symbol retType; //# join of list above

	for (int i = cases->first(); cases->more(i); i = cases->next(i)) {

		Case curBranch = cases->nth(i);
		Symbol varDecType = curBranch->pass_type();

		//check for duplicated type
		if ((i != cases->first()) &&
			(std::find(varTypes.begin(), varTypes.end(), varDecType) != varTypes.end())) {
			classTable->semant_error_(this, environment.currentClass);
			classTable->error_stream << "The variables declared on the branches of case do not have distinct types." << endl;
		}
		else varTypes.push_back(varDecType);

		Symbol branchType = curBranch->TypeCheck(environment, classTable);

		if (i == cases->first()) {
			retType = branchType;
		}

		else {
			retType = join(branchType, retType, environment.currentClass, classTable);
		}
	}

	type = retType;
	return type;
}

Symbol branch_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	//# Each branch of a case is type checked in an environment where variable xi has type Ti. 
	(environment.ObjEnv)->enterscope();
	(environment.ObjEnv)->addid(name, &type_decl);

	Symbol branchType = expr->TypeCheck(environment, classTable);

	(environment.ObjEnv)->exitscope();

	return branchType;
}

Symbol block_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	Expressions exprList = body;
	for (int i = exprList->first(); exprList->more(i); i = exprList->next(i)) {
		Expression curExpr = exprList->nth(i);
		type = curExpr->TypeCheck(environment, classTable);
	}
	return type;
}
 
Symbol let_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	// We give type rules only for a let with a single variable.
	// Typing a multiple let, is defined to be the same as typing Let (Let (Let ...)).

	//# let with init!
	//# let x:T0<-e1 in e2:T2 (e1:T1)
	if (dynamic_cast<no_expr_class*>(init) == NULL) {
		Symbol initType = init->TypeCheck(environment, classTable);
		//# T1<=T0
		if (!isSubType(initType, type_decl, environment.currentClass, classTable)) {
			classTable->semant_error_(this, environment.currentClass);
			classTable->error_stream << "Inferred type " <<
				initType->get_string() << " of initialization of variable " << identifier->get_string() <<
				" in Let, does not conform to declared type " << type_decl->get_string() <<
				"." << endl;
		}
	}

	(environment.ObjEnv)->enterscope();
	(environment.ObjEnv)->addid(identifier, &type_decl);

	type = body->TypeCheck(environment, classTable);

	(environment.ObjEnv)->exitscope();

	return type;
}

Symbol plus_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	Symbol typeExp1 = e1->TypeCheck(environment, classTable);
	Symbol typeExp2 = e2->TypeCheck(environment, classTable);

	if (typeExp1 != Int || typeExp2 != Int) {
		// non-Int arguments: Int + String
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "non-Int arguments: " <<
			typeExp1->get_string() << " + " <<
			typeExp2->get_string() << "." << endl;
	}
	type = Int;
	return type;
}

Symbol sub_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	Symbol typeExp1 = e1->TypeCheck(environment, classTable);
	Symbol typeExp2 = e2->TypeCheck(environment, classTable);

	if (typeExp1 != Int || typeExp2 != Int) {
		// non-Int arguments: Int - String
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "non-Int arguments: " <<
			typeExp1->get_string() << " - " <<
			typeExp2->get_string() << "." << endl;
	}
	type = Int;
	return type;
}

Symbol mul_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	Symbol typeExp1 = e1->TypeCheck(environment, classTable);
	Symbol typeExp2 = e2->TypeCheck(environment, classTable);

	if (typeExp1 != Int || typeExp2 != Int) {
		// non-Int arguments: Int * String
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "non-Int arguments: " <<
			typeExp1->get_string() << " * " <<
			typeExp2->get_string() << "." << endl;
	}
	type = Int;
	return type;
}

Symbol divide_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	Symbol typeExp1 = e1->TypeCheck(environment, classTable);
	Symbol typeExp2 = e2->TypeCheck(environment, classTable);

	if (typeExp1 != Int || typeExp2 != Int) {
		// non-Int arguments: Int / String
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "non-Int arguments: " <<
			typeExp1->get_string() << " / " <<
			typeExp2->get_string() << "." << endl;
	}

	type = Int;
	return type;
}

Symbol neg_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	Symbol typeExp = e1->TypeCheck(environment, classTable);
	if (typeExp != Int) {
		// Argument of 'neg' has type Bool instead of Int.
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "Argument of 'neg' has type " <<
			typeExp->get_string() << "instead of Int." << endl;
	}
	type = Int;
	return type;
}

Symbol comp_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	Symbol typeExp = e1->TypeCheck(environment, classTable);
	if (typeExp != Bool) {
		// Argument of 'not' has type Int instead of Bool.
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "Argument of 'not' has type " <<
			typeExp->get_string() << " instead of Bool." << endl;
	}
	type = Bool;
	return type;
}

Symbol eq_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	//# we just track of bad comparison betwin int, str and bool.
	Symbol typeExp1 = e1->TypeCheck(environment, classTable);
	Symbol typeExp2 = e2->TypeCheck(environment, classTable);

	if (typeExp1 == Int || typeExp1 == Str || typeExp1 == Bool ||
		typeExp2 == Int || typeExp2 == Str || typeExp2 == Bool) {
		if (typeExp1 != typeExp2) {
			//# Illegal comparison with a basic type x and y.
			classTable->semant_error_(this, environment.currentClass);
			classTable->error_stream << "Illegal comparison with a basic type " <<
				typeExp1->get_string() << " and " <<
				typeExp2->get_string() << "." << endl;
		}
	}
	type = Bool;
	return type;
}

Symbol lt_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	// same as leq
	Symbol typeExp1 = e1->TypeCheck(environment, classTable);
	Symbol typeExp2 = e2->TypeCheck(environment, classTable);
	if (typeExp1 != Int || typeExp2 != Int) {
		// non-Int arguments: Int < String
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "non-Int arguments: " <<
			typeExp1->get_string() << " < " <<
			typeExp2->get_string() << "." << endl;
	}
	type = Bool;
	return type;
}

Symbol leq_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	// same as le
	Symbol typeExp1 = e1->TypeCheck(environment, classTable);
	Symbol typeExp2 = e2->TypeCheck(environment, classTable);

	if (typeExp1 != Int || typeExp2 != Int) {
		// non-Int arguments: Int < String
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "non-Int arguments: " <<
			typeExp1->get_string() << " <= " <<
			typeExp2->get_string() << "." << endl;
	}
	type = Bool;
	return type;
}

Symbol int_const_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	type = Int;
	return type;
}

Symbol bool_const_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	type = Bool;
	return type;
}

Symbol string_const_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	type = Str;
	return type;
}

Symbol new__class::TypeCheck(Environment environment, ClassTable * &classTable) {
	type = type_name;
	return type;
}

Symbol isvoid_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	// type check the body of expression
	e1->TypeCheck(environment, classTable);
	type = Bool;
	return type;
}

Symbol no_expr_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	type = No_type;
	return type;
}

Symbol object_class::TypeCheck(Environment environment, ClassTable * &classTable) {
	//# it's just a simple var checking!
	Symbol* lookupPtr = (environment.ObjEnv)->lookup(name);
	if (lookupPtr == NULL) {
		// Undeclared identifier e.
		classTable->semant_error_(this, environment.currentClass);
		classTable->error_stream << "Undeclared identifier " <<
			name->get_string() << "." << endl;
		type = Object;
	}
	else {
		type = *lookupPtr;
	}
	return type;
}


//######################### Mahyar Comment ######################################
//# Some functions to get protected or private data from tree.
//# and i dont know why it's not provided by programmer :(
Symbol class__class::pass_name() { return name; }
Symbol class__class::pass_parent() { return parent; }
void class__class::set_parent_object() { parent = Object; }
Features class__class::pass_features() { return features; }
Symbol method_class::pass_name() { return name; }
Formals method_class::pass_formals() { return formals; }
Symbol method_class::pass_ret_type() { return return_type; }
Symbol attr_class::pass_name() { return name; }
Symbol attr_class::pass_type() { return type_decl; }
Symbol formal_class::pass_name() { return name; }
Symbol formal_class::pass_type() { return type_decl; }
Symbol branch_class::pass_type() { return type_decl; }

////////////////////////////////////////////////////////////////////
//
// semant_error is an overloaded function for reporting errors
// during semantic analysis.  There are three versions:
//
//    ostream& ClassTable::semant_error()                
//
//    ostream& ClassTable::semant_error(Class_ c)
//       print line number and filename for `c'
//
//    ostream& ClassTable::semant_error(Symbol filename, tree_node *t)  
//       print a line number and filename
//
///////////////////////////////////////////////////////////////////
ostream& ClassTable::semant_error(Class_ c)
{
	return semant_error(c->get_filename(), c);
}
ostream& ClassTable::semant_error(Symbol filename, tree_node * t)
{
	error_stream << filename << ":" << t->get_line_number() << ": ";
	return semant_error();
}
ostream& ClassTable::semant_error()
{
	semant_errors++;
	return error_stream;
}
ostream& ClassTable::semant_error_(tree_node * t, Class_ c) {
	semant_error(c->get_filename(), t);
	return error_stream;
}


/*   This is the entry point to the semantic checker.

	 Your checker should do the following two things:

	 1) Check that the program is semantically correct
	 2) Decorate the abstract syntax tree with type information
		by setting the `type' field in each Expression node.
		(see `tree.h')

	 You are free to first do 1), make sure you catch all semantic
	 errors. Part 2) can be done in a second stage, when you want
	 to build mycoolc.
 */

void program_class::semant()
{
	initialize_constants();

	/* ClassTable constructor may do some semantic analysis */
	ClassTable* classtable = new ClassTable(classes);

	if (classtable->errors()) {
		cerr << "Compilation halted due to static semantic errors." << endl;
		exit(1);
	}

	/* some semantic analysis code may go here */
	semanticTypeChecking(classtable);

	if (classtable->errors()) {
		cerr << "Compilation halted due to static semantic errors." << endl;
		exit(1);
	}
}


