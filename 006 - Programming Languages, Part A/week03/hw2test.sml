
use "./hw2.sml";

(* 1 *)

(* 
(* a *)
val f1_1 = all_except_option("str", ["1","str","str","3","4"]) (* SOME ["1","3","4"] *)
val f1_2 = all_except_option("str", ["1","3","4","str"])       (* SOME ["1","3","4"] *)
val f1_3 = all_except_option("str", ["str","str","3","4"])     (* SOME ["3","4"] *)
val f1_4 = all_except_option("str", ["1","3","4"])             (* NONE *)
val f1_5 = all_except_option("str", ["str"])                   (* [] *)
val f1_6 = all_except_option("str", [])                        (* NONE *)
val f1_7 = all_except_option("str", ["1","str","str","3"])     (* SOME ["1","3"] *)
 *)

(* 
(* b *)
val f2_1 = get_substitutions1 ([["foo"],["there"]], "foo") 
val f2_2 = get_substitutions1 ([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff")
*)

(* 
(* c *)
val f3_1 = get_substitutions2 ([["foo"],["there"]], "foo") 
val f3_2 = get_substitutions2 ([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff")
 *)


(* d *)
(* 
val f4_1 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
{first="Fred", middle="W", last="Smith"})

val f4_2 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty", "Cool_Guy_J"],["Freddie","Fred","F"]],
{first="Cool_Guy_J", middle="Dave", last="Honer"})

val f4_3 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
{first="Tinkles", middle="Dave", last="Honer"})
 *)

(* 2 *)

(* a *)
(* 
val f5_1 = card_color(Spades, Ace)
val f5_2 = card_color(Clubs, King)
val f5_3 = card_color(Hearts, 10)
val f5_4 = card_color(Diamonds, Jack)
 *)

(* b *)
(* 
val f6_1 = card_value(Spades, Ace)
val f6_2 = card_value(Clubs, King)
val f6_3 = card_value(Diamonds, Jack)
val f6_4 = card_value(Hearts, Num 8)
val f6_5 = card_value(Hearts, Num 3)
 *)

(* c *)
(* 
val f7_1 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) (* [] *)
val f7_2 = remove_card ([(Hearts, Ace),(Hearts, King)], (Hearts, Ace), IllegalMove) (* [(Hearts, King)] *)
val f7_3 = remove_card ([(Hearts, Ace),(Hearts, Ace)], (Hearts, Ace), IllegalMove) (* [(Hearts, Ace)] *)
val f7_4 = remove_card ([(Hearts, Ace),(Hearts, King),(Hearts, Ace)], (Hearts, Ace), IllegalMove) (* [(Hearts, King),(Hearts, Ace)] *)
(* Throw exception *)
(* val f7_3 = remove_card ([(Hearts, Queen),(Hearts, King)], (Hearts, Ace), IllegalMove) [] *)
 *)

(* d *)

val f8_1 = all_same_color [(Hearts, Ace), (Hearts, Ace)] (* true *)
val f8_2 = all_same_color [(Hearts, Ace), (Diamonds, King)] (* true *)
val f8_3 = all_same_color [(Spades, Num 10), (Clubs, Num 3), (Hearts, Ace), (Hearts, King)] (* true *)
