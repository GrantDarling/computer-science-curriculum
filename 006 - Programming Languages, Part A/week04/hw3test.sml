
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


(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

(*
val test1 = only_capitals ["A","B","C"] = ["A","B","C"]

val test2 = longest_string1 ["A","bc","C"] = "bc"

val test3 = longest_string2 ["A","bc","C"] = "bc"

val test4a = longest_string3 ["A","bc","C"] = "bc"

val test4b = longest_string4 ["A","B","C"] = "C"

val test5 = longest_capitalized ["A","bc","C"] = "A"

val test6 = rev_string "abc" = "cba"

val test7 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4

val test8 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE

val test9a = count_wildcards Wildcard = 1

val test9b = count_wild_and_variable_lengths (Variable("a")) = 1

val test9c = count_some_var ("x", Variable("x")) = 1

val test10 = check_pat (Variable("x")) = true

val test11 = match (Const(1), UnitP) = NONE

val test12 = first_match Unit [UnitP] = SOME []
*)
