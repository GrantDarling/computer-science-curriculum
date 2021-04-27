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

(* 

1. The first argument should be applied to elements of the second
argument. 

2. If it returns NONE for any element, then the result for all_answers is NONE

3. Else the calls to the first argument will have produced SOME lst1, SOME lst2, ... SOME lstn and the result of
all_answers is SOME lst where lst is lst1, lst2, ..., lstn appended together (order doesn’t matter).

Hints: The sample solution is 8 lines. It uses a helper function with an accumulator and uses @. Note
all_answers f [] should evaluate to SOME []

*)

fun all_answers f xs =
    let 
        fun accumulator f xs acc =
            case xs of 
                [] => [acc]
            |   x::xs' => accumulator f xs' [SOME x]@[acc]
    in 
        accumulator f xs [SOME 1337]
    end 


val test8 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7]



