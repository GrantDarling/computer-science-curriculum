/*** Exercises ****/
/* 1. Create the following variables:
     name, which is a string set to your current name
     dayOfBirth, which is a number set to the day of your birth month */

var name = "Grant" 
var dayOfBirth = 25

/* 2. See what happens when you have multiple variables of the same name. 
      Which one takes precedence?  */

var word = "yeet"
var word = "yikes"

var word = "yonk"
console.log(word); // "yonk"

/* 3. Write some JavaScript that prompt's the user for their favorite color. 
   Once the user has submitted a favorite color, log that color to the console 
   along with a friendly message. */

//var fav_color = prompt()

//console.log(`Your favourite color is ${fav_color}`);

/* 4. create a string that contains both single quotes and double quotes. */

var wordSingleQuotes = "yonk's"
console.log(wordSingleQuotes); // "yonk"

/* 5. What is the difference between null and undefined? */

//In JavaScript, undefined is a type, whereas null is an object. It means a 
//variable declared, but no value has been assigned a value. Whereas, null 
//in JavaScript is an assignment value. You can assign it to a variable as a placeholder

//Null is an object 
//ex. console.log(typeof(null)) //object
//*/


/*6. What is NaN in JavaScript? What is the typeof NaN? */

//NaN = "Not a number". This shows that a number is not a legal number in javascript

console.log(typeof(NaN)) //number
console.log(isNaN("3")) //false

/*7. You can declare a variable by typing var thing;. What is the value of thing?*/

//This will return undefined because we have not set the value to null

var thing;
console.log(typeof(thing)) //undefined


/* 8. Quickly parse to number and check bolean value */

console.log(Number("3")) //3
console.log(+"4") //4

Number("3") //3
+"2"; // 2
+"3.14"; // 3.14
+"2.3alkweflakwe"; // NaN 
+"w2.3alkweflakwe"; // NaN

var greeting = "hi";
var nothing = 0;

!!greeting; // true
!!nothing; // false

