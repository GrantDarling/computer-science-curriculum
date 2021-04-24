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
fun similar_names(all_names, full_name) =
   let 
      fun get_f_name({first=x, middle=y, last=z}) = x
      fun get_m_name({first=x, middle=y, last=z}) = y
      fun get_l_name({first=x, middle=y, last=z}) = z
      val subsituted_names = get_f_name(full_name)::get_substitutions2(all_names, get_f_name(full_name))
      fun conv_fname_to_sub_names(sub_fnames, full_name) = 
         case sub_fnames of 
              [] => []
            | head::tail => [{first=head,middle=get_m_name(full_name),last=get_l_name(full_name)}]@conv_fname_to_sub_names(tail, full_name)
   in 
      conv_fname_to_sub_names(subsituted_names, full_name)
   end 

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

(* 2 *)

(* a *)

fun card_color(card) = 
   case card of 
        (Spades,   suit) => Black
     |  (Clubs,    suit) => Black
     |  (Diamonds, suit) => Red
     |  (Hearts,   suit) => Red

(* b *)

fun card_value(card) = 
   case card of 
      (suit, Num i ) => i
   |  (suit, Ace) => 11
   |  (suit, rank) => 10

(* c *)

fun remove_card(card_list, card, e) = 
   let 
      fun card_list_without_card(cards, card, e) = 
         case cards of 
            [] => []
         |  head::tail => [head]@card_list_without_card(tail, card, e)
   in 
      case card_list of 
         [] => raise e
         | head::tail => if head = card 
                         then card_list_without_card(tail, card, e)    (* ["included"] *) (* helper function to loop through cards without head *)
                         else [head]@remove_card(tail, card, e)
   end
   
(* d *)

fun all_same_color(card_list) = 
   case card_list of 
        head::[] => true
      | head::neck::tail => if card_color(head) = card_color(neck) 
                           then all_same_color(neck::tail)
                           else false

(* e *)
fun sum_cards(card_list) = 
   let 
      fun accumulator(cards, acc) = 
         case card_list of 
                  [] => acc
               |  head::tail => card_value(head) + sum_cards(tail)
   in 
    accumulator(card_list, 0)
   end 

(* f *)


(* 

The objective is to end the game with a low score (0 is best). 

Scoring works as follows: 


1. Let sum be the sum of the values of the held-cards. 

2. If sum is greater than goal, the preliminary score is three times (sum−goal),

else the preliminary score is (goal − sum). The score is the preliminary score - 

unless all the held-cards are the same color, in which case the score is the preliminary score divided by 2 (and rounded down as usual
with integer division; use ML’s div operator). 

*)

fun score(cards, goal) = 
   let 
      val sum = sum_cards(cards) 
      val is_same_color = all_same_color(cards)
   in  
      if sum > goal andalso is_same_color
      then (3*(sum - goal)) div 2
      else if  sum > goal 
           then 3*(sum - goal)
           else if sum < goal andalso is_same_color
                then (goal - sum) div 2
                else (goal - sum) 
   end 



fun officiate(cards_held, move_list, goal) = 
    let 
    in 
    end 



   case (cards_held, move_list, goal) of 
        ([],moves,goal) => ([],moves,goal)
      | (cards, [], goal) => score(cards, goal)
      | (cards, moves, goal) => score(cards, goal)

