//https://github.com/rithmschool/intermediate_javascript_exercises/tree/master/call_apply_bind_exercise
// Call, Apply, Bind: https://www.rithmschool.com/courses/advanced-javascript/call-apply-bind
// The 'new' keyword: https://www.rithmschool.com/courses/advanced-javascript/new-keyword

//Part Two 

//Fix the following code:

var obj = {
    fullName: "Harry Potter",
    person: {
        sayHi: function(){
            return "This person's name is " + this.fullName
        }
    }
}

obj.person.sayHi.call(obj) //Will give Harry Potter


//List two examples of "array-like-objects" that we have seen.

// 1. The 'Arguments' keyword
// 2. ...

//Make the tests pass for the following functions

var sumEvenArguments = function(...arguments) {
    return arguments.filter(number => number % 2 == 0).reduce((accumulator, currentValue) => accumulator + currentValue);
}

console.log(sumEvenArguments(1,2,3,4)) // 6
console.log(sumEvenArguments(1,2,6)) // 8
console.log(sumEvenArguments(1,2)) // 2

//Write a function called arrayFrom which converts an array-like-object into an array.
var arrayFrom = function() {
    return [].slice.call(arguments)
}

function sample(){
    var arr = arrayFrom(arguments)
    if(!arr.reduce) throw "This is not an array!"
    return arr.reduce(function(acc,next){
        return acc+next;
    },0)
}

console.log(arrayFrom(1,2,3,4,5));

// Write a function called invokeMax which accepts a function and a maximum amount. invokeMax should return a function that when called
// increments a counter. If the counter is greater than the maximum amount, the inner function should return "Maxed Out!"

class invokeMax {
    constructor() {
        let counter = 0;

        this.increment = (fn, max) => {
            counter++;
            return counter > max ? "Maxed out!" : fn
        }
        this.getCounter = () => "counter " + counter;
    }
}

const add = function (a, b) {
    return a + b;
}

const newInvokeMax = new invokeMax();

//This works
console.log(newInvokeMax.increment(add(7,9), 3))
console.log(newInvokeMax.increment(add(7,9), 3))
console.log(newInvokeMax.increment(add(7,9), 3))
console.log(newInvokeMax.increment(add(7,9), 3))

//This doesn't...

var addOnlyThreeTimes = newInvokeMax.increment(add, 3)

/* console.log(addOnlyThreeTimes(1, 2)); // returns 3
console.log(newInvokeMax.getCounter()); 
console.log(addOnlyThreeTimes(2, 3)); // returns 5
console.log(newInvokeMax.getCounter()); 
console.log(addOnlyThreeTimes(3, 4)); // returns 7
console.log(newInvokeMax.getCounter()); 
console.log(addOnlyThreeTimes(4, 5)); // returns 9, should be 'Maxed out!'
console.log(addOnlyThreeTimes(1, 2)); // returns 3, should be 'Maxed out!' */

/*
Write a function called guessingGame which takes in one parameter amount. The function should return another function 
that takes in a parameter called guess. In the outer function, you should create a variable called answer which is the 
result of a random number between 0 and 10 as well as a variable called guesses which should be set to 0.

In the inner function, if the guess passed in is the same as the random number (defined in the outer function) - 
you should return the string "You got it!". If the guess is too high return "You're too high!" and if it is too low, 
return "You're too low!". You should stop the user from guessing if the amount of guesses they have made is greater 
than the initial amount passed to the outer function.

You will have to make use of closure to solve this problem.
*/

var game = guessingGame(5)
game(1) // "You're too low!" 
game(8) // "You're too high!"
game(5) // "You're too low!"
game(7) // "You got it!" 
game(1) // "You are all done playing!" 

var game2 = guessingGame(3)
game2(5) // "You're too low!" 
game2(3) // "You're too low!"
game2(1) // "No more guesses the answer was 0" 
game2(1) // "You are all done playing!" 