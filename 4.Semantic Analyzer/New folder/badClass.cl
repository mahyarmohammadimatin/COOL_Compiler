(*
   Includes all possible errors in classes. 
      1. Class Main is not defined.
      2. No 'main' method in class Main. X
      3. Class C was previously defined. 
      4. Class C, or an ancestor of C, is involved in an inheritance cycle.
      6. Class C cannot inherit class Int/Bool/String/SELF_TYPE. 
      7. Class C inherits from an undefined class A. 
      8. Redefinition of basic class Object/IO/Int/Bool/String/SELF_TYPE.
*)

Class C {
	b : Int;
};

Class C inherits E{ (*3*)
	b : Int;
};

Class X inherits Y{ (*4*)
	b : Int;
};

Class Y inherits Z{
	b : Int;
};

Class Z inherits X{
	b : Int;
};

Class D inherits A{ (*7*)
  a : Int;
  };


Class E inherits Bool{ (*6*)
    a : Int;
  };

Class String{ (*8*)
    a : Int;
  };
