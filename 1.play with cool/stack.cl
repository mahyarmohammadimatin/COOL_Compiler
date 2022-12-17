
class List inherits IO {

   isNil() : Bool { true };

   head()  : String { { abort(); "0"; } };


   tail()  : List { { abort(); self; } };

   cons(i : String) : List {
      (new Cons).init(i, self)
   };

   print_list() : Object {
      if self.isNil() then out_string("")
                   else {
			   out_string(self.head());
			   out_string("\n");
			   self.tail().print_list();
		        }
      fi
   };

};


class Cons inherits List {

   car : String;	-- The element in this list cell

   cdr : List;	-- The rest of the list

   isNil() : Bool { false };

   head()  : String { car };

   tail()  : List { cdr };

   init(i : String, rest : List) : List {
      {
	 car <- i;
	 cdr <- rest;
	 self;
      }
   };

};

class Command inherits A2I{
    init(c : String, stack : List ): List{
	if c = "d" then { stack.print_list(); stack; }
	else
	if c = "e" then (new E_command).run(stack)
	else
	stack.cons(c)
	fi
	fi
    };
};

class E_command inherits Command{

    first : String;
    second : String;
    sum : Int;
    head_command : String;

    run_plus(stack : List) : List {
	{
	    first <- stack.head();
	    second <- stack.tail().head();
	    stack <- stack.tail().tail();
	    sum <- a2i(first) + a2i(second);
	    stack <- stack.cons(i2a(sum));
	    stack;
        }
    };
    
    run_swap(stack : List) : List {
    	{
	    first <- stack.head();
	    second <- stack.tail().head();
	    stack <- stack.tail().tail();
	    stack <- stack.cons(first).cons(second);
	    stack;
        }
    };

    run(stack : List) : List {

	if stack.head() = "+" then run_plus(stack.tail())
	else
	if stack.head() = "s" then run_swap(stack.tail())
	else 
	stack
	fi
	fi

    };

};


class Main inherits IO {

   mylist : List;
   stack : List;
   newstack : List;
   command : String;


   main() : Object {
      {
	stack <- new List;
	out_string("> ");
	command <- in_string();

	while (not (command = "x")) loop {
	    newstack <- (new Command).init(command, stack);
	    stack <- newstack;
	    out_string("> ");
	    command <- in_string();
	}
	pool;

      }
   };

};



