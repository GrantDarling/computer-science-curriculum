/* 
1. What is a closure?
Closure is when a function is able to access a variable from a parent function that has already been returned 

2. List two reasons why closures are useful

One major reason closures are valuable is because you can create private variables that cannot be accessed outside 
of its current scope by other functions 

Another key benefit of closures can be to clean up the outer function and allow easier calling. Instead of returning an 
object in the outer function with the outer variable as a property, you can just use the outer variable inside the inner function.
You could now call the outer then inner function like this : outefun()()

3. What is a module?

A module in a small piece of code that can be encapsulated and re-used easily. The pattern we use here to create a module 
is called the module pattern. It's a great way to wrap everything in an IIFE that contains private data that can not be accessed globally.


var instructorModule = (function createInstructors(){
    var instructors = ["Elie", "Matt", "Tim"];
    return {
        showInstructors: function displayAllInstructors(){
            return instructors;
        },
        addInstructor: function addNewInstructor(instructor){
            instructors.push(instructor)
            return instructors;
        }
    }
})();


4. What is the arguments array-like object?

This object returns the arguments within the parameter given. Which is valuable if you do not know how many 
arguments will be given in the params. 

function add() {
    var total = 0;
    for (var i = 0; i < arguments.length; i++) {
        total += arguments[i]; // this is shorthand for total = total + arguments[i]
    }
    return total;
}

add(1,2,3); // 6
add(1,-2,3,-4); // -2
add(); // 0

5. Why do we call arguments an array-like-object?

Because its not a true array (although it looks like it). You can't treat it like a normal array. For example, you can't push 
new values into it.

6. Write a function called createCounter. This function should contain a variable count that is initialized to 0. 
   This function should return another function that when invoked, increments the counter by 1 and returns the count 
   variable. You should be able to create multiple counters with the createCounter function and they should all have 
   their own private variable called count.
*/


function createCounter() {
    var count = 0;
    return function() {
        count ++;
        console.log(count);
    }
}

var firstCounter = createCounter();

firstCounter(); // 1
firstCounter(); // 2
firstCounter(); // 3
firstCounter(); // 4

var secondCounter = createCounter();

secondCounter(); // 1
secondCounter(); // 2
secondCounter(); // 3

firstCounter(); // 5
firstCounter(); // 6

secondCounter(); // 4

