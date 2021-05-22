/* 1. Let, Const */

    // Main difference between Let, Const and Var is that they both respect block scope.

/* 2. Template Strings */

    // Template strings are pretty straight forward

    `Now we can do string interpolation like ${1 + 1}`;

    var person = "Elie";

    `My name is ${person}`;

    var firstName = "Matt";
    var lastName = "Lane";
    var title = "instructor";
    var employer = "Rithm";

    // ughhh, so much concatenation...
    var greeting1 = "Hi, my name is " + firstName + " " + lastName + ", and I am an " + title + " at " + employer + "!";

    // much better
    var greeting2 = `Hi, my name is ${firstName} ${lastName}, and I am an ${title} at ${employer}!`;

    /* for of loop */

    let arr = ['a', 2, 3, 4, 5];

    for (let val in arr) {
        console.log(val);
    }

    // 0
    // 1
    // 2
    // 3
    // 4

    for (let val of arr) {
        console.log(val);
    }

    // a
    // 2
    // 3
    // 4
    // 5

/* 3. Arrow Functions */

    // basic examples: 
    var add = (a, b) => a + b;
    var shout = str => str.toUpperCase();
    var multilineArrowFunction = a => {
        let b = a * a;
        return b + a;
    }

    // callback examples:
    var arr = [1, 2, 3, 4];

    // function keyword syntax
    arr.map(function (val) {
        return val * 2;
    })

    // arrow function syntax
    arr.map(val => val * 2)

    /*
    Until arrow functions, every new function defined its own this value
    (a new object in case of a constructor, undefined in strict mode function calls,
    the context object if the function is called as an "object method", etc.).
    This proved to be annoying with an object-oriented style of programming.
    */

    var obj = {
        firstName: "Elie",
        sayHi: function(){
            setTimeout(function(){
                console.log("Hi, I am " + this.firstName);
            },1000)
        }
    }

    // 'this' is undefined


    var objES2015 = {
        firstName: "Elie",
        sayHi: function(){
            setTimeout(() => {
                console.log(`Hi, I am ${this.firstName}`);
            },1000)
        }
    }

    // 'this' is "Elie", because the function does not encapsulate 'this' with arrow functions


/* 4. Default Parameters */

    //Another nice ES2015 feature is the ability to add default values to parameters in our functions

    // OLD - causes unintended issues because 0 is falsey!

    function add(a, b){
        a = a || 12
        b = b || 13
        return a + b;
    }

    add() // 25
    add(0) // 25 - WHY IS THIS??
    add(0,0) // 25 - WHAT IS HAPPENING??

    // NEW
    function add(a=12,b=13){
        return a+b
    }

    add() // 25 - CORRECT!
    add(0) // 13 - CORRECT!
    add(10,10) // 20

/* 5. Rest */

    // The '...variable' will take the sum of the rest of the arguments and put them into an array

    function data(a,b,...c){
        console.log(a,b,c);
    }

    data(1,2,3,4,5); // 1, 2, [3,4,5]

    /* 
    Using the rest operator is often a useful way to avoid dealing with the arguments array-like 
    object. arguments can be a little tricky to deal with, since it's not actually an array and 
    therefore doesn't have access to common array methods. However, when you use the rest operator, 
    what you get access to inside of your function is a bona fide array. 
    */

   function checkArguments() {
    return Array.isArray(arguments)
    }

    function checkArgumentsES2015(...args) {
        return Array.isArray(args);
    }

    checkArguments(1, 2, 3); // false
    checkArgumentsES2015(1, 2, 3); // true

    //Refactoring example

    function multiply() {
        let product = 1;
        for (let i = 0; i < arguments.length; i++) {
            product *= arguments[i];
        }
        return product;
    }
    
    function multiplyES2015(...nums) {
        return nums.reduce((product, num) => product * num, 1);
    }
    
    multiply(1, 2, 3, 4); // 24
    multiplyES2015(1, 2, 3, 4);

/* 6. Spread */

    /* 
    The spread operator sort of does the inverse of the rest operator: instead of 
    converting a comma-separated list of values into an array, it spreads an array into 
    a comma-separated list of values. Because of this, the spread operator is used when 
    invoking a function, unlike the rest operator, which is used when defining a function 
    */

   var arr = [1,2,3,4];
   function addFourNumbers(a,b,c,d){
       return a + b + c + d;
   }
   addFourNumbers(...arr); //arr = (1,2,3,4)

/* 7. Object shorthand notation and destructuring */

   /* 
   in ES2015, when you're adding a method to an object, you can eliminate the colon and the 
   function keyword. In other words, these two are essentially equivalent 
   */

  var o1 = {
    sayYo: function() {
      console.log("Yo!");
    }
  };
  
  var o2 = {
    sayYo() {
      console.log("Yo!");
    }
  }

  /* 
  This other example shows that you can pass a variable into an object instead of a key-value 
  pair, and JavaScript will convert the variable name into the key for you
  */


    var person = "Elie";
    var es5Object = {person: person};
    es5Object; // {person: "Elie"}

    var es2015Object = {person};
    es2015Object; // {person: "Elie"}

/* 8. Destructuring Objects & Arrays */

/* 
The destructuring assignment syntax is a JavaScript expression that makes it possible to extract 
data from arrays or objects into distinct variables. This can be useful if you want to assign multiple 
variables at once
*/

    // object destructuring

    var obj = {
        a:1,
        b:2,
        c:3
    };

    var {a,b,c} = obj;

    a; // 1
    b; // 2
    c; // 3

    // array destructuring 

    var arr = [1,2,3,4];
    var [a,b,c,d] = arr;

    a; // 1
    b; // 2
    c; // 3
    d; // 4

    var [first,second] = [1,2];

    first; // 1
    second; // 2

/* 8. Class Syntax */


    //ES5

    function Person(firstName, lastName){
        this.firstName = firstName;
        this.lastName = lastName;
    }
    
    Person.prototype.sayHi = function(){
        return this.firstName + " " + this.lastName + " says hello!";   
    }
    
    Person.isPerson = function(person){
        return person.constructor === Person;
    }


    //ES6

    class Person {
        constructor(firstName, lastName){
            this.firstName = firstName;
            this.lastName = lastName;
        }
        sayHi(){
            return `${this.firstName} ${this.lastName} says hello!`;
        }
        static isPerson(person){
            return person.constructor === Person;
        }
    }

    
