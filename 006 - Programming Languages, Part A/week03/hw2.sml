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

 
fun get_names(all_names, str) = 
   get_substitutions2(all_names, str)


fun get_first_name(full_name) =
   case full_name of 
      {first=a,middle=b,last=c} => a

fun get_second_name(full_name) =
   case full_name of 
      {first=a,middle=b,last=c} => b

fun get_third_name(full_name) =
   case full_name of 
      {first=a,middle=b,last=c} => c

fun get_list_of_substitutes(list, full_name) =
   get_substitutions2(list, get_first_name(full_name))

fun convert_to_objs(all_names, full_name) = 
   case all_names of 
      [] => []
      |h::t => [{first=get_first_name(full_name),middle=get_second_name(full_name),last=get_third_name(full_name)}]@convert_to_objs(t, full_name)

fun similar_names(all_names, full_name) =
   convert_to_objs(all_names, full_name)


(* loop through list of objects and replace a with head*)
(* USE {first=a,middle=b,last=c}::t NOT h::t and you should be able to find a solution! *)
   

  
   (* get_substitutions2(similar_names_lists, "") *)



(* 
CLOSEST YET 

fun extract_first_name(full_name: {first:string, last:string, middle:string}) =
   case full_name of
         {first:string, last:string, middle:string} => first

fun get_names(similar_names_lists, full_name) = 
      let
         val first_name = extract_first_name(full_name)
         val list_of_name = "dile"::get_substitutions2(similar_names_lists, first_name) 
      in 
         case list_of_name of 
            h::t => h
      end  

fun similar_namesx(similar_names_lists, full_name) = 
      case similar_names_lists of 
      [] => []
      |h::t => [full_name]@similar_namesx(t, full_name)


fun similar_names(similar_names_lists, full_name) = 
   let 
      val xx = get_names(similar_names_lists, full_name)
   in 
   case similar_namesx(similar_names_lists, full_name) of 
         {first=a,middle=b,last=c}::t => {first=get_names(similar_names_lists, full_name),middle=b,last=c}::similar_namesx(t, {first=get_names(similar_names_lists, full_name),middle=b,last=c})
   end 



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