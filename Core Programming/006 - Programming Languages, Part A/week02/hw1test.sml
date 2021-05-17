
use "./hw1.sml";

(* 
val q1_test1 = is_older((1996,1,1), (2000,2,2));  (* true *)
val q1_test2 = is_older((1996,11,25), (1996,12,25)); (* true *)
val q1_test3 = is_older((1996,11,26), (1996,11,25)); (* false *)
val q1_test4 = is_older((2000,11,26), (1996,11,25)); (* false *)
val q1_test5 = is_older((1996,11,25), (1996,11,25)); (*false *)
 *)

(* 
val q2_test1 = number_in_month([(1996,11,30)], 11); (* 1 *)
val q2_test2 = number_in_month([(1996,5,30), (2000,5,30)], 11); (* 0 *)
val q2_test3 = number_in_month([(1996,5,30), (2000,5,30), (1496,11,30), (2000,11,30), (1496,11,30), (2000,11,30)], 11); 4
 *)

(*  
val q3_test1 = number_in_months([(1996,11,30)], [11, 10, 8]); (* 1 *)
val q3_test2 = number_in_months([(1996,11,30)], []); (* 0 *)
val q3_test3 = number_in_months([(1996,11,30), (1999,12,30), (2007,9,8)], [11, 12, 10]); (* 2 *)
val q3_test4 = number_in_months([(1996,11,30), (1999,12,30), (2007,9,8)], [11, 12, 9]); (* 3 *)
val q3_test5 = number_in_months([(1996,9,30), (1999,12,30), (2007,11,8)], [10, 12, 11]); (* 2 *)
val q3_test6 = number_in_months([(1,2,25),(3,5,26),(1,12,29),(3,2,28),(1,2,27),(1,2,25),(6,7,8)], [2]); (* 4 *)
val q3_test7 = number_in_months([(1,2,25),(3,2,28),(1,2,27),(1,2,25)], [2]); (* 4 *)
val q3_test8 = number_in_months([(1,2,25),(3,5,26),(1,12,29),(3,2,28),(1,2,27),(1,2,25),(6,7,8)], [2,12]); (* 5 *)
val q3_test9 = number_in_months([(1,2,25),(3,5,26),(1,12,29),(3,2,28),(1,2,27),(1,2,25),(6,7,8)], [2,7,5]); (* 6 *)
val q3_test10 = number_in_months([(1,2,25),(3,2,28),(1,2,27),(1,2,25)], [2,12]); (* 4 *)
 *)

(* 
val q4_test1 = dates_in_month([(1996,11,30)], 11); (* (1996,11,30) *)
val q4_test2 = dates_in_month([], 11); (* [] *)
val q4_test3 = dates_in_month([(1996,3,30), (1996,9,30), (2000,3,30), (1996,12,30)], 3); (* [(1996,3,30), (2000,3,30)] *)
 *)

(* 
val q5_test1 = dates_in_months([(1996,11,30)], [11]); (* [(1996,11,30)] *)
val q5_test2 = dates_in_months([], [11]); (* [] *)
val q5_test3 = dates_in_months([(1996,11,30)], []); (* [] *)
val q5_test4 = dates_in_months([(1996,1,30), (1996,11,30), (2000,1,25),(1206,4,30),(1977,8,10),(1996,11,30)], [1,4,8]); (* [(1996,1,30), (2000,1,25), (1206,4,30), (1977,8,10)] *)
 *)

(* 
val q6_test1 = get_nth(["hola world", "hello world", "bonjour world"], 1); (* "hola world" *)
val q6_test2 = get_nth(["hola world", "hello world", "bonjour world"], 2); (* "hello world" *)
val q6_test3 = get_nth(["hola world", "hello world", "bonjour world"], 3); (* "bonjour world" *)
val q6_test4 = get_nth(["STr"], 1);
val q6_test5 = get_nth(["1","2","3"], 3); (* "3" *)
val q6_test6 = get_nth(["1","2","3"], 2); (* "2" *)
val q6_test7 = get_nth(["1"], 1);         (* "1" *)
val q6_test8 = get_nth(["0","1"], 1);     (* 0 *)
val q6_test9 = get_nth(["0","1"], 2);     (* 1 *)
 *)

(* 
val q7_test1 = date_to_string((1996,1,30)); (* "January 30, 1996" *)
val q7_test2 = date_to_string((2000,11,25)); (* "November 25, 2000" *)
val q7_test3 = date_to_string((1988,5,19)); (* "May 5, 1988" *)
*)

(* 
val q8_test1 = number_before_reaching_sum((10,[1,2,3,4,5,6,7,8,9,10])); (* 6 *)
val q8_test2 = number_before_reaching_sum((10,[1,1,1,1,1,1,1,1,1,1, 1])); (* 9 *)
val q8_test3 = number_before_reaching_sum((10,[9,1])); (* 9 *)
val q8_test4 = number_before_reaching_sum((10,[2,2,2,2,2,1])); (* 8 *)
val q8_test5 = number_before_reaching_sum((60,[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31])); (* 59 *)
*)

(* 
val q8_test6 = number_before_reaching_sum((5,[3,1,2])); (* 2 *)
val q8_test7 = number_before_reaching_sum((5,[3,2,2])); (* 1 *)
val q8_test8 = number_before_reaching_sum((6,[4,1,1,1])); (* 2 *)
val q8_test9 = number_before_reaching_sum((10,[1,2,3,4,5])); (* 3 *)
 *)
 
(* 
val q9_test1 = what_month(1);   (* 1 *)
val q9_test2 = what_month(31);  (* 1 *)
val q9_test3 = what_month(32);  (* 2 *)
val q9_test4 = what_month(59);  (* 2 *)
val q9_test5 = what_month(60);  (* 3 *)
val q9_test6 = what_month(90);  (* 3 *)
val q9_test7 = what_month(120); (* 4 *)
val q9_test8 = what_month(365); (* 12 *)
val q9_test9 = what_month(182); (* 7 *)
val q9_test10 = what_month(181); (* 6 *)
 *)

(* 
val q10_test1 = month_range(31, 31);   (* [1] *)
val q10_test2 = month_range(1, 31);   (* [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]  *)
val q10_test3 = month_range(88, 93);   (* [3,3,3,4,4,4]  *)
val q10_test4 = month_range(1, 365);   (* [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12] *)
val q10_test5 = month_range(85, 145);   (* [3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]  *)
 *)

(* 
val q11_test1 = oldest([(1930,11,30), (1999,12,30), (2007,9,8)]); (* (1930,11,30) *)
val q11_test2 = oldest([(1996,11,30), (1999,12,30), (1007,9,8)]); (* (1007,9,8) *)
val q11_test3 = oldest([]);  (* NONE *)
val q11_test4 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) (* SOME (2011,3,31) *)
val q11_test5 = oldest([(2012,2,28),(2011,3,31),(2011,4,28),(2012,2,28),(2011,3,31),(2011,4,28),(2000,2,28),(2011,3,31),(2011,4,28)]) (* SOME (2000,2,28) *)
*)

 (* CHALLENGE PROBLEMS *)
(* 
val q12_test1 = head_duplicates([(2011,3,31),(2011,3,31),(2011,4,28)]) (* [(2011,3,31)] *)
val q12_test2 = head_duplicates([(2012,2,28),(2011,3,31),(2011,4,28)]) (* [] *)
val q12_test3 = head_duplicates([(2012,2,28),(2011,3,31),(2011,4,28), (2011,3,31),(2011,4,28), (2012,2,28)]) (* [(2012,2,28)] *)  (* [(2012,2,28)] *)
 *)
(* 
val q12_test1 = check_if_duplicate([(2011,3,31),(2011,3,31),(2011,4,28)]) (* true *)
val q12_test2 = check_if_duplicate([(2012,2,28),(2011,3,31),(2011,4,28)]) (* false *)
val q12_test3 = check_if_duplicate([(2012,2,28),(2011,3,31),(2011,4,28), (2011,3,31),(2011,4,28), (2012,2,28)]) (* true *)
*)
(* 
val q12_test1 = remove_duplicates([(2011,3,31),(2011,3,31),(2011,4,28)]) (* [(2011,3,31), (2011,4,28)] *)
val q12_test2 = remove_duplicates([(2012,2,28),(2011,3,31),(2011,4,28)]) (* [(2012,2,28),(2011,3,31),(2011,4,28)] *)
val q12_test3 = remove_duplicates([(2012,2,28),(2011,3,31),(2011,4,28), (2011,3,31),(2011,4,28), (2012,2,28)]) (* [(2012,2,28),(2011,3,31),(2011,4,28)] *)
 *)

(* CHALLENGE TESTS *)
  
(* 12 *)
(* 
val q12_test1 = number_in_months_challenge([(1996,11,30),(1996,11,30),(1996,11,30),(1996,11,30)], [11, 10, 8]); (* 1 *)
val q12_test2 = number_in_months_challenge([(1996,11,30),(1996,11,30),(1996,11,30)], []); (* 0 *)
val q12_test3 = number_in_months_challenge([(1996,11,30), (1999,12,30), (2007,9,8), (1996,11,30), (1999,12,30), (2007,9,8), (1996,11,30), (1999,12,30), (2007,9,8)], [11, 12, 10]); (* 2 *)
val q12_test4 = number_in_months_challenge([(1996,11,30), (1996,11,30), (1999,12,30), (2007,9,8), (2007,9,8), (2007,9,8)], [11, 12, 9]); (* 3 *)
val q12_test5 = number_in_months_challenge([(1996,9,30), (1999,12,30), (2007,11,8)], [10, 12, 11]); (* 2 *)
val q12_test6 = number_in_months_challenge([(1,2,25),(3,5,26),(1,12,29),(3,2,28),(1,2,27),(1,2,25),(6,7,8)], [2]); (* 3 *)
val q12_test7 = number_in_months_challenge([(1,2,25),(3,2,28),(1,2,27),(1,2,25)], [2]); (* 3 *)
*)
(* 
val q12_2_test1 = dates_in_months_challenge([(1996,11,30)], [11]); (* [(1996,11,30)] *)
val q12_2_test2 = dates_in_months_challenge([], [11]); (* [] *)
val q12_2_test3 = dates_in_months_challenge([(1996,11,30),(1996,11,30),(1996,11,30),(1996,11,30)], []); (* [] *)
val q12_2_test4 = dates_in_months_challenge([(1996,1,30), (1996,11,30), (2000,1,25),(1206,4,30), (1996,11,30), (2000,1,25),(1206,4,30),(1977,8,10),(1996,11,30), (1996,11,30), (2000,1,25),(1206,4,30)], [1,4,8]); (* [(1996,1,30), (2000,1,25), (1206,4,30), (1977,8,10)] *)
 *)

(* 13 *)

(*  1. Year is positive *)
(* 
val q13_1_test1 = year_is_positive((1996)) (* true *)
val q13_1_test2 = year_is_positive((~1996)) (* false *)
 *)
 (*  2. month between 1-12 *)
(* 
val q13_2_test1 = month_is_legit((~50)) (* false *)
val q13_2_test2 = month_is_legit((0)) (* false *)
val q13_2_test3 = month_is_legit((1)) (* true *)
val q13_2_test4 = month_is_legit((5)) (* true *)
val q13_2_test5 = month_is_legit((12)) (* true *)
val q13_2_test6 = month_is_legit((13)) (* false *)
val q13_2_test7 = month_is_legit((100)) (* false *)
 *)

(*  3. Day appropriate for the month *)
(* 
val q13_3_test1 = day_is_legit(11, 31) (* false *)
val q13_3_test2 = day_is_legit(10, 20) (* true *)
val q13_3_test3 = day_is_legit(5, 0) (* false *)
val q13_3_test4 = day_is_legit(5, 1) (* true *)
val q13_3_test5 = day_is_legit(5, 31) (* true *)
val q13_3_test6 = day_is_legit(5, 32) (* false *)
 *)

(*  4. Check if leap year *)
(* 
val q13_4_test1 = is_leap_year(2000) (* true *)
val q13_4_test2 = is_leap_year(1804) (* true *)
val q13_4_test3 = is_leap_year(1904) (* true *)
val q13_4_test4 = is_leap_year(2108) (* true *)
val q13_4_test5 = is_leap_year(2442) (* false *)
val q13_4_test6 = is_leap_year(18) (* false *)
val q13_4_test67= is_leap_year(1800) (* false *)
 *)

(*  5. Return list of months given specific year *)
(* 
val q13_5_test1 = months_given_year(true) (* ["31","28","31","30","31","30","31","31","30","31","30","31"] *)
val q13_5_test2 = months_given_year(false) (* ["31","29","31","30","31","30","31","31","30","31","30","31"] *)
 *)
(* 
val q13_test1 = reasonable_date((1996,5,25)) (* true *)
val q13_test2 = reasonable_date((~1996,5,25)) (* false *)
 *)

 (* 13 *)
(* 
(* Checks Positive Year *)
val q13_test1 = reasonable_date((1996, 11, 25)) (* true *)
val q13_test2 = reasonable_date((~1996, 11, 25)) (* false *)
val q13_test3 = reasonable_date((0, 11, 25)) (* false *)

(* Checks month is between 1-12 *)
val q13_test4 = reasonable_date((1996, ~50, 25)) (* false *)
val q13_test5 = reasonable_date((1996, 0, 25)) (* false *)
val q13_test6 = reasonable_date((1996, 1, 25)) (* true *)
val q13_test7 = reasonable_date((1996, 5, 25)) (* true *)
val q13_test8 = reasonable_date((1996, 12, 25)) (* true *)
val q13_test9 = reasonable_date((1996, 13, 25)) (* false *)
val q13_test10 = reasonable_date((1996, 100, 25)) (* false *)
 *)

(* Checks if day is within month range *)
val q13_test11 = reasonable_date((1996, 11, 31)) (* false *)
val q13_test12 = reasonable_date((2000, 2, 29)) (* true *)
val q13_test13 = reasonable_date((2000, 2, 28)) (* true *)
val q13_test17 = reasonable_date((2001, 2, 29)) (* false *)
val q13_test14 = reasonable_date((1996, 5, 1)) (* true *)
val q13_test15 = reasonable_date((1996, 5, 31)) (* true *)
val q13_test16 = reasonable_date((1996, 5, 32)) (* false *)

