(* Assignment #1 *)

(* 1. Check which date is older *) 
fun is_older((date1:int*int*int), (date2:int*int*int)) =
    let 
        fun convertToDays(y, m, d) = y * 365 + m * 30 + d
    in 
        convertToDays(date1) < convertToDays(date2)
    end

(* 2. Checks how many dates are in the given month *)
fun number_in_month((list_of_dates: (int*int*int) list), (month: int)) =
    if null list_of_dates
    then 0
    else let
        val header = hd list_of_dates
        val header_month = (#2 header)
    in 
        if header_month = month
        then 1 + number_in_month(tl list_of_dates, month)
        else number_in_month(tl list_of_dates, month)
    end

(* 3. Checks how many dates are in the given months *)
fun number_in_months(list_of_dates: (int*int*int) list, months: int list) =
    if null months
    then 0
    else 
    let val tl_ans = number_in_month(list_of_dates, hd months)
    in  
        if  tl_ans > 0 
        then tl_ans+ number_in_months(list_of_dates, tl months)
        else number_in_months(list_of_dates, tl months)
    end

(* 4. Returns a list of dates that are in the given month *)
fun dates_in_month(list_of_dates: (int*int*int) list, month: int) = 
    if null list_of_dates
    then []
    else if #2 (hd list_of_dates) = month 
    then (hd list_of_dates) :: dates_in_month(tl list_of_dates, month)
    else dates_in_month(tl list_of_dates, month)

(* 5. Returns a list of dates that are in a list of months *)
fun dates_in_months(list_of_dates: (int*int*int) list, months: int list) = 
    if null list_of_dates orelse null months
    then []
    else dates_in_month(list_of_dates, (hd months))@dates_in_months(list_of_dates, tl months)
    
(* 6. Returns the string at position nth of list of strings *)
fun get_nth(list_of_strings: string list, position: int) =
    if position = 1
    then hd list_of_strings
    else get_nth(tl list_of_strings, position - 1)

(* 7.  Returns the given date as a string at positon nth of list of dates *)
fun date_to_string(date: (int*int*int)) =
    let 
        val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        val current_month = get_nth(months, ((#2 date) - 1));
        val current_day = Int.toString (#3 date)
        val current_year = Int.toString (#1 date)
    in
        current_month ^ " " ^ current_day ^ ", " ^ current_year
    end

(* 8.  Return the sum of numbers in list_of_nums before it hits the sum *)
fun number_before_reaching_sum(sum: int, list_of_nums: int list) = 
    if null list_of_nums
    then 0 
    else if sum > (hd list_of_nums)
    then let val tl_ans = number_before_reaching_sum(sum - (hd list_of_nums), tl list_of_nums)
    in 1 + tl_ans
    end
    else 0

(* 9. Takes a day of the year and returns a month *)
fun what_month(day_of_year: int) =
    let
        val months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        val current_month = number_before_reaching_sum(day_of_year, months)
    in
        1 + current_month
    end

(* 10. Returns a list of months between the two dates [m1,m2,...,mn] *)
fun month_range(day1: int, day2: int) =
    let 
        val first_month = what_month(day1) (* month in days *)
        val last_month  = what_month(day2) (* month in days *)
    in 
        if day1 = day2 orelse day1 > day2
        then [first_month]
        else month_range(day1, (day2 - 1))@[last_month]
    end 

(* 11. Returns the SOME oldest date if it exists or NONE if no date exists *)
fun oldest(dates: (int*int*int) list) = 
    if null dates 
    then NONE 
    else if null (tl dates)
    then SOME (hd dates)
    else if is_older((hd dates), (hd (tl dates)))
    then oldest((hd dates)::(tl (tl dates)))
    else oldest(tl dates)

(* 12. Challenge Problem: Remove duplicates and re-write problems #3 and #5 with these edge cases *)

(*  Helpers  *)
fun head_duplicates(list: (int*int*int) list) = 
    if null (tl list)
    then []
    else if (hd list) = (hd (tl list)) 
    then [(hd list)]
    else head_duplicates((hd list)::tl (tl list))

fun remove_duplicates(list: (int*int*int) list) =
    if null list 
    then []
    else if head_duplicates(list) = []
    then (hd list)::remove_duplicates(tl list)
    else remove_duplicates(tl list)

(* 12. Challenge functions *)
fun number_in_months_challenge((list_of_dates: (int*int*int) list), months: int list) = 
    let val filtered_dates = remove_duplicates(list_of_dates)
    in 
        number_in_months(filtered_dates, months)
    end 

fun dates_in_months_challenge(list_of_dates: (int*int*int) list, months: int list) = 
    let val filtered_dates = remove_duplicates(list_of_dates)
    in 
        dates_in_months(filtered_dates, months)
    end 

(* 13. Checks if the date is a reasonable date *)

(*  Helpers  *)
(*  1. Year is positive *)
fun year_is_positive(year: int) = 
    year > 0

(*  2. month between 1-12 *)
fun month_is_legit(month: int) = 
    month > 0 andalso month < 13

(*  4. Checks if leap year *)
fun is_leap_year(year: int) = 
let 
    val divisible_by_400 = (year mod 400) = 0 
    val divisible_by_4 = (year mod 4) = 0
    val not_divisible_by_100 = not (year mod 100 = 0)
in 
    divisible_by_400 orelse divisible_by_4 andalso not_divisible_by_100
end 

(*  5. Returns months based on leap year or not *)
fun months_given_year(leap_year: bool) = 
    if leap_year
    then ["31", "29", "31", "30", "31", "30", "31", "31", "30", "31", "30", "31"]
    else ["31", "28", "31", "30", "31", "30", "31", "31", "30", "31", "30", "31"]

(*  3. Day appropriate for the month *)
fun day_is_legit(year: int, month: int, day: int) = 
    let 
        val months = months_given_year(is_leap_year(year));
        val days_in_month_string = get_nth(months, month)
        val SOME days_in_month = Int.fromString days_in_month_string
    in 
        day > 0 andalso day <= days_in_month
    end 


(* 13 *)

fun reasonable_date(date: (int*int*int)) = 
    year_is_positive(#1 date) andalso month_is_legit(#2 date) andalso day_is_legit(#1 date, #2 date, #3 date)