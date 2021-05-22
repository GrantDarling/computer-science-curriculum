/* 1. Currying */

/* 
Currying is the process of breaking down a function that takes multiple arguments into a 
series of functions that take some subset of the arguments. Let's examine a very simple 
curry function. We will partially apply a function's arguments one at a time.
*/

function simpleCurry(fn, ...outerArgs) {
  return function (...innerArgs) {
    return fn.apply(this, outerArgs.concat(innerArgs));
  }
}

function add(a, b) {
  return a + b;
}

var a1 = simpleCurry(add, 2);
a1(10); // 12



function complexCurry(fn) {
  return function f1(...f1innerArgs) {
    if (f1innerArgs.length >= fn.length) {
      return fn.apply(this, f1innerArgs);
    } else {
      return function f2(...f2innerArgs) {
        return f1.apply(this, f1innerArgs.concat(f2innerArgs));
      }
    }
  };
}
complexCurry(add)()()()(2)()()()(4); // 6

/* Constructor Patterns */

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

var matt = new Person("Matt", "Lane");
var elie = new Person("Elie", "Schoppik");
var tim = new Person("Tim", "Garcia");

matt.__proto__ === elie.__proto__ // true
tim.constructor === Person // true

/* Module Pattern */

var myModule = (function () {

  // A private variable inside the scope of the IIFE that is 
  var privateVariable = "secret";

  // A private function inside the scope of the IIFE
  function privateFunction() {
    console.log("You just called the private function!");
  };

  // everything returned in the object is accessible publicly  
  return {
    // A public variable
    publicVariable: "You can see me!",

    // A public function utilizing privates
    displayPrivateVariable: function () {
      console.log(privateVariable);
    },
    invokePrivateFunction: function () {
      privateFunction();
    }
  };
})();

myModule.publicVariable; // "You can see me!"
myModule.displayPrivateVariable(); // "secret"

myModule.privateFunction; // undefined
myModule.privateVariable; // undefined
myModule.invokePrivateFunction(); // "You just called the private function!"


/* Facade Pattern */

/*
The Facade pattern is used quite heavily in jQuery and involves presenting an outward appearance
that hides underlying complexity. The idea is that using this pattern, we can provide a simple
looking API and obscure the complexity from others. Some examples of the Facade pattern in jQuery
are .css(),.animate() and other abstractions like .getJSON(), .get(), and .post(). Take a look at
one of the potential implementations of $(document).ready here and you can see just how much
complexity is hidden from what appears to be a simple method.
*/

// and much more 

/* Anti Patterns */

/* 
Just like we have seen design patterns, there are certain ways that we should strive to not write 
JavaScript. We call those anti-patterns. Let's examine some!
*/

// 1. Global Variables 
// 2. Using 'eval'
// 3. Memory Leaks (not really an anti-pattern)

/* Strict Mode */

"use strict"

noVarKeyword = "bad idea" // ReferenceError 

//

"use strict"

function badIdea(){
    this.data = "done"
}

badIdea() // TypeError

//

"use strict";
delete Array.prototype; // TypeError

function sum(a, a, c) { // !!! syntax error
  "use strict";
  return a + b + c; // wrong if this code ran
}

false.awesome = "yes"
false.awesome // undefined

//

"use strict"
false.awesome = "no" // TypeError


