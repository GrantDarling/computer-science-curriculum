(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
(* a *)   
fun all_except_option(x, ys) = 
   let fun ys_without_x(x, list) = 
         case list of
              []    => []
            | y::list' => if same_string(x,y) then ys_without_x(x,list') else y::ys_without_x(x,list')
   in 
      if ys_without_x(x, ys) = ys then NONE else SOME (ys_without_x(x, ys)) 
   end 

(* b *)
fun get_substitutions1(str_lst_lst, str) =
   case str_lst_lst of 
        []                 => []
      | list::str_lst_lst' => case all_except_option(str, list) of 
                                   NONE => get_substitutions1(str_lst_lst', str)
                                 | SOME list => list@get_substitutions1(str_lst_lst', str)

(* c *)
fun get_substitutions2(str_lst_lst, str) =
   let 
      fun inner_substitution(str_lst_lst, str) =
         case str_lst_lst of 
         []                 => []
         | list::str_lst_lst' => case all_except_option(str, list) of 
                                      NONE => inner_substitution(str_lst_lst', str)
                                    | SOME list => list@inner_substitution(str_lst_lst', str)
   in 
      inner_substitution(str_lst_lst, str)
   end 

(* d *)
fun similar_names(similar_names_lists, full_name) =
   get_substitutions2(similar_names_lists)







(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)