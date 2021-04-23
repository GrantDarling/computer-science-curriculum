(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* a *)

(* If string is not in the list return NONE *)
(* Else return SOME string_list without string in list *)
(* a *)   


fun remove_x_from_ys(x, ys) = (* "2", ["1","2","2","3","4"] *)
   case ys of 
      [] => [] (* NONE *)
   |  y::ys' => if x = y 
                then remove_x_from_ys(x, ys') (* remove x *)
                else y::remove_x_from_ys(x, ys') (* keep y, keep going *)

fun all_except_option(x, ys) = 
   case ys of 
      [] => [] (* NONE *)
   |  y::ys' => if x = y
                then (remove_x_from_ys(x, ys)) (* remove x's func *)
                else (y::all_except_option(x, ys')) (* Keep checking *)

fun all_except_option(x, ys) = 
   case ys of 
      [] => NONE
   |  ys => SOME ys








(* 
fun remove_x_from_ys(x, ys) = (* "2", ["1","2","2","3","4"] *)
   case ys of 
      [] => [] (* NONE *)
   |  y::ys' => if x = y 
                then remove_x_from_ys(x, ys') (* remove x's*)
                else y::remove_x_from_ys(x, ys') (* Keep checking *)

fun all_except_option(x, ys) = 
   case ys of 
      [] => NONE (* NONE *)
   |  y::ys' => if x = y
                then SOME (remove_x_from_ys(x, ys)) (* remove x's*)
                else y::all_except_option(x, ys') (* Keep checking *)

 *)




















(* 
fun string_in_list(x,ys) =
   case ys of
      [] => false
      | y::ys' => case x = y of 
                  true => true
               |  false => case [y] of
                           [] => string_in_list(x,[]) 
                           |_ => string_in_list(x,ys')

fun remove_string_from_list(x,ys) = 
   case ys of 
      [] => []
      | y::ys' => case x = y of 
                   true => remove_string_from_list(x, ys')
                | false => y::remove_string_from_list(x, ys')


fun all_except_option(x, ys) =
   case string_in_list(x,ys) of
      true => remove_string_from_list(x, ys)
      | false => []

fun kk(x, ys) = 
   case all_except_option(x,ys) of 
   [] => NONE 
   | ys => SOME ys

 *)
















(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)