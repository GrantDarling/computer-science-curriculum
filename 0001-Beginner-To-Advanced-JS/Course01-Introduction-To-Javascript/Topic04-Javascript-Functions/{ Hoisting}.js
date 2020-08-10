/* 1. What does the following code output? Why? */

var firstName = 'Elie';

function displayFirstName(){
    var firstName = 'Tim';
    return firstName;
}

displayFirstName(); // 'Tim' is returned since the name variable defined in the function scope is return. JavaScript always starts from in (the closest function) and works its way out (to outer functions and eventually the global scope)

/* 2. What does the following code output? Why? */

function displayFirstName(){
    var firstName = 'Tim';
    return firstName;
}

displayFirstName();

console.log(firstName) // // ReferenceError - firstName is not defined. We get an error because we are trying to access a variable defined in a function outside of its scope.

/* 3. What does the following code output? Why? */

console.log(firstName) // undefined
var firstName = "Elie"

// undefined is output because the var firstName; is hoisted to the top of the code so it actually looks like this under the hood

var firstName;
console.log(firstName);
firstName = "Elie"

/* 4. What does the following code output? Why? */

console.log(firstName) // since variables that do not use the var keyword are NOT hoisted, this will return a ReferenceError - firstName is not defined.
firstName = 'Elie'

/* 5. What does the following code output? Why? */

function sayHi(){
    return 'Hi ' + firstName;
    var firstName = 'Elie'
}

sayHi(); // "Hi undefined", since the firstName variable uses the var keyword, it is hoisted to the top and it's value is initialized to undefined. It looks a bit like this:

function sayHi(){
    var firstName; // the value of firstName is now undefined
    return 'Hi ' + firstName;
    firstName = 'Elie' // the value of firstName has been re-assigned to 'Elie'
}


/* 6. What does the following code output? Why? */

function sayHi(){
    return 'Hi ' + firstName; 
    firstName = 'Elie'
}

sayHi(); // ReferenceError - firstName is not defined. Since we are not using the var keyword, the firstName variable does not get hoisted and JavaScript has no reference to the firstName variable.

/* 7. What does the following code output? Why? */

sayHi() // since function declarations are always hoisted, this will simple return "Hi!"

function sayHi(){
    return 'Hi!';
}

/* 8. What does the following code output? Why? */

sayHi(); // undefined

var sayHi = function(){
    return 'Hi!';
}

// TypeError: sayHi is not a function. Since we are using the var keyword, the declaration of the variable get's hoisted, but not its definition so the code looks like this:

var sayHi; // the value of sayHi is undefined

sayHi();

sayHi = function(){
    return 'Hi!';
}  