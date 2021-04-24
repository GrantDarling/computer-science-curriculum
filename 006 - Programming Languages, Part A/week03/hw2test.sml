
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
(* val f4_1 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
{first="Fred", middle="W", last="Smith"}) *)

val f4_1 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
{first="Fred", middle="W", last="Smith"})

(* d *)
