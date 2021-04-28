(* Coursera Programming Languages, Homework 3, Provided Code *)
exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

(* 1 *)
fun only_capitals (xs) =  
    List.filter (fn x =>  Char.isUpper(String.sub (x, 0))) xs

(* 2 *)
fun longest_string1 xs = 
    List.foldl (fn (x,acc) => if String.size x > String.size acc then x else acc ) "" xs

(* 3 *)
fun longest_string2 xs = 
    List.foldl (fn (x,acc) => if String.size x >= String.size acc then x else acc ) "" xs

(* 4 *)
fun longest_string_helper f xs = 
    List.foldl (fn (x,acc) => if f(String.size x,String.size acc) then x else acc) "" xs

fun longest_string3 xs = 
    longest_string_helper (fn (x,acc) => (x > acc)) xs

fun longest_string4 xs = 
    longest_string_helper (fn (x,acc) => (x >= acc)) xs

(* 5 *)
val longest_capitalized = longest_string1 o only_capitals

(* 6 *)
val rev_string = implode o rev o explode 

(* 7 *)
fun first_answer f xs =
    case xs of 
         [] => raise NoAnswer
    |    x::xs' => if f x = SOME x then hd [x] 
                                   else first_answer f xs'

(* 8 *)
fun all_answers f list =
    let
        fun reducer (f, list, acc) = case list of
                                          [] => SOME acc
                                        | x::xs => case f(x) of
                                                    NONE => NONE
                                                |   SOME x => reducer(f, xs, x @ acc)
    in
        reducer (f, list, [])
    end

(* 9 *)
fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(* a *)
fun count_wildcards p = 
    g (fn x => 1) (fn x => 0) p

(* b *)
fun count_wild_and_variable_lengths p = 
    g (fn x => 1) (fn x => String.size x) p

(* c *)
fun count_some_var (str, p) = 
    g (fn x => 0) (fn x => if x = str then 1 else 0) p

(* 10 *)
fun check_pat p = 
    let 
        fun get_strings pattern =
            case pattern of 
                 Variable str      => [str]
            |    TupleP acc        => List.foldl (fn (p,acc) => acc @ get_strings(p)) [] acc
            |    ConstructorP(str,p)  => get_strings(p)
            |    _                 => []
        
        fun check_duplicates list =
            case list of  
                [] => true
                | head::tail => if List.exists (fn x => x = head) tail
                              then  false 
                              else check_duplicates tail              
    in 
       check_duplicates(get_strings p)
    end