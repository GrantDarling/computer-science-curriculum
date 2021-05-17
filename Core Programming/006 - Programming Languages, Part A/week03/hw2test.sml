
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
(* 
val f8_1 = all_same_color [(Hearts, Ace), (Hearts, Ace)] (* true *)
val f8_2 = all_same_color [(Hearts, Ace), (Diamonds, King)] (* true *)
val f8_3 = all_same_color [(Spades, Num 10), (Clubs, Num 3), (Hearts, Ace), (Hearts, King)] (* false *)
val f8_4 = all_same_color [(Spades, Num 10), (Clubs, Num 3), (Spades, Ace), (Clubs, King)] (* true *)
 *)

(* e *)
(* 
val f9_1 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)]  (* 4 *)
val f9_2 = sum_cards [(Clubs, Num 2),(Clubs, King)]  (* 12 *)
val f9_3 = sum_cards [(Clubs, Ace),(Clubs, King)]  (* 21 *)
 *)

(* f *)
(* 
val f10_1 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) (* 4 *)
val f10_2 = score ([(Hearts, Num 2),(Clubs, Num 4)],1) (* 15 *)
val f10_3 = score ([(Hearts, Num 2),(Hearts, Num 4)],10) (* 2 *)
val f10_4 = score ([(Hearts, Num 2),(Diamonds, Num 4)],1) (* 7*)
 *)

 (* g *)
(* 
val f11_0 = officiate ([],[], 15) = 7
val f11_1 = officiate ([(Hearts, Ace)],[Draw], 10) = 5
val f11_2 = officiate ([(Hearts, Queen)],[Draw], 11) = 0
val f11_3 = officiate ([(Hearts, Queen)],[Draw], 20) = 5
val f11_4 = officiate ([(Hearts, Queen),(Clubs, Ace)],[Draw, Discard((Hearts, Queen)), Draw], 20) = 4
val f11_5 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true)
val f11_6 = officiate ([(Hearts, Queen),(Clubs, Ace)],[Draw, Draw, Draw, Discard(Spades, Ace)], 40) = 19
val f11_7 = officiate ([(Hearts, Queen),(Clubs, Ace)],[Draw, Draw, Draw, Discard(Spades, Ace)], 20)  = 5
 *)

val f12_0 = score_challenge([(Hearts, Num 2),(Clubs, Num 4)],10)  (* 4 *)
val f12_2 = score_challenge ([(Hearts, Num 2),(Clubs, Num 4)],1) (* 15 *)
val f12_3 = score_challenge ([(Hearts, Num 2),(Hearts, Num 4)],10) (* 2 *)
val f12_4 = score_challenge ([(Hearts, Num 2),(Diamonds, Num 4)],1) (* 7*)
val f12_5 = score_challenge ([(Diamonds, Ace),(Diamonds, Ace),(Diamonds, Ace)],100) (* *)

