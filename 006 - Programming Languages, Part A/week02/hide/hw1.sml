(* You will write 11 functions *)
(* In SML, a "date" is a int*int*int value. The first part is the year, the second is the month (between 1-12) and the third part is the day (between 1-31) *)
(* Solutions only need to work for reasonable dates! *)

fun pow (x:int, y:int) = (* correct only for y >= 0 *)
if y=0
then 1
else x * pow(x,y-1)

fun is_older ((a:int, b:int, c:int), (x:int, y:int, z:int)) =
    if a = x
    then if b = y 
    then if true
    else 
    
    if b > y
    then true
    else false

    if b > c
    then false 
    else true

(*This should be done recursively. Going through all 3 ints and comparing them against each other. *)


    
