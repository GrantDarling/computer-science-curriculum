
use "./hw3.sml";

(* 1 *)
(* 
val f1_1 = only_capitals ["A","B","C"] = ["A","B","C"]
val f1_2 = only_capitals ["a","B","C"] = ["B","C"]
val f1_3 = only_capitals ["A","B","C"] = ["A","B","C"]
val f1_4 = only_capitals ["Abc","bCD","Cdefg"] = ["Abc","Cdefg"]
*)

(* 2 *)
(* 
val f2_1 = longest_string1 ["A","bc","C"] = "bc"
val f2_2 = longest_string1 ["A","bc","Caaaa"] = "Caaaa"
val f2_3 = longest_string1 [] = ""
val f2_4 = longest_string1 ["Caaaa","bc","Cbbbb"] = "Caaaa"
*)

(* 3 *)
(* 
val f3_1 = longest_string2 ["A","bc","C"] = "bc"
val f3_2 = longest_string2 ["A","bc","Caaaa"] = "Caaaa"
val f3_3 = longest_string2 [] = ""
val f3_4 = longest_string2 ["Caaaa","bc","Cbbbb"] = "Cbbbb"
*)

(* 4 *)
(* 
val f4_1_1 = longest_string3 ["A","bc","C"] = "bc"
val f4_1_2 = longest_string3 ["A","bc","Caaaa"] = "Caaaa"
val f4_1_3 = longest_string3 [] = ""
val f4_1_4 = longest_string3 ["Caaaa","bc","Cbbbb"] = "Caaaa"

val f4_2_1 = longest_string2 ["A","bc","C"] = "bc"
val f4_2_2 = longest_string2 ["A","bc","Caaaa"] = "Caaaa"
val f4_2_3 = longest_string2 [] = ""
val f4_2_4 = longest_string2 ["Caaaa","bc","Cbbbb"] = "Cbbbb"
*)

(* 5 *)
(* 
val f5_1 = longest_capitalized ["A","bc","C"] = "A"
val f5_2 = longest_capitalized ["r","bc","x"] = ""
val f5_3 = longest_capitalized ["r","bc","Xxxxxx", "xxxxxx"] = "Xxxxxx"
val f5_4 = longest_capitalized ["R","Bc","Xxxxxx", "Cx"] = "Xxxxxx"
*)

(* 6 *)
(* 
val f6_1 = rev_string "abc"
val f6_2 = rev_string "a1B2c3d4E"
 *)

(* 7 *)
(* 
val f7_1 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val f7_2 = first_answer (fn x => if x = 5 then SOME x else NONE) [1,2,3,4,5] = 5
val f7_3 = first_answer (fn x => if x = "2" then SOME x else NONE) ["1","2"] = "2"
(* val f7_4 = first_answer (fn x => if x > 6 then SOME x else NONE) [1,2,3,4,5]  *) (* Raises exception *)
 *)

(* 8 *)
(* 
val f8_1 = all_answers (fn x => if x > 1 then SOME [x] else NONE) [2,3,4,5,6,7] 
val f8_2 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] 
*)

(* 9 *) 
(*  
(* a *)
val f9a_1 = count_wildcards Wildcard = 1

(* b *)
val f9b_1 = count_wild_and_variable_lengths (Variable("art")) = 3
val f9b_2 = count_wild_and_variable_lengths (Variable("a")) = 1
val f9b_3 = count_wild_and_variable_lengths (Variable("")) = 0

(* c *)
val f9c_1 = count_some_var ("x", Variable("x")) = 1

*)

(* 10 *)
(* 
val f10_2 = check_pat(TupleP [Wildcard, Wildcard, Variable("x"), Variable("xy")])
val f10_3 = check_pat(TupleP [Wildcard, Variable("x"), Variable("x"), Variable("xy")])
val f10_4 = check_pat(Variable("xy"))
val f10_5 = check_pat(ConstructorP ("egg",ConstructorP ("egg",ConstP 4)))
val f10_6 = check_pat(TupleP [Wildcard,Wildcard, Variable("x")])
val f10_7 = check_pat(TupleP[ConstP 17,Wildcard,ConstP 4,ConstructorP ("egg",ConstP 4),ConstructorP ("egg",ConstructorP ("egg",ConstP 4))])
val f10_8 = check_pat(TupleP[Wildcard,Wildcard])
val f10_9 = check_pat(TupleP[ConstructorP ("egg",ConstP 4),ConstructorP ("egg",ConstP 4)])
val f10_10 = check_pat(TupleP[ConstP 17,Wildcard,ConstP 4,ConstructorP ("egg",ConstP 4),ConstructorP ("egg",ConstructorP ("egg",ConstP 4)),TupleP[ConstP 17,Wildcard,ConstP 4,ConstructorP ("egg",ConstP 4),ConstructorP ("egg",ConstructorP ("egg",ConstP 4))],TupleP[Wildcard,Wildcard],TupleP[ConstP 17,ConstP 4],TupleP[ConstructorP ("egg",ConstP 4),ConstructorP ("egg",ConstP 4)]])
val f10_11 = check_pat(ConstructorP ("hi",TupleP[Variable "x",Variable "x"])) = false
val f10_12 = check_pat(ConstructorP ("hi",TupleP[Variable "x",ConstructorP ("yo",TupleP[Variable "x",UnitP])])) = true
 *)

(* 11 *)
(* 
val f11_1 = match (Const 17,ConstP 17)
val f11_2 = first_match Unit [UnitP] = SOME [] 
*)

