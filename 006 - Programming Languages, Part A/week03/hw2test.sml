
use "./hw2.sml";

val f1 = remove_x_from_ys("2", ["1","2","2","3","4"]) (* SOME ["1","3","4"] *)
val f2 = remove_x_from_ys("2", ["1","2","3","4"])     (* SOME ["1","3","4"] *)
val f3 = remove_x_from_ys("2", ["2","2","3","4"])     (* SOME ["3","4"] *)
val f4 = remove_x_from_ys("2", ["1","3","4"])         (* NONE *)
val f5 = remove_x_from_ys("2", ["2"])                 (* NONE *)
val f6 = remove_x_from_ys("2", [])                    (* NONE *)

