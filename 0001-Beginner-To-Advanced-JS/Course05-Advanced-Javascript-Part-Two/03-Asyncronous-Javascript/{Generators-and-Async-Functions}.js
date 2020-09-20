/* Generators */
/* 
In ES2015, a special type of function called a generator was introduced. 
Generator functions are functions that can return multiple values using the 
yield keyword. Previously, we have only seen functions that return once, 
but generators can change that for us. Let's start with a simple generator 
example (generator functions are denoted using a *):
*/

function* firstGenerator() {
    for (var i = 0; i < 5; i++) {
        yield i;
    }
}

var gen = firstGenerator();
gen.next(); // {value: 0, done: false}
gen.next(); // {value: 1, done: false}
gen.next(); // {value: 2, done: false}
gen.next(); // {value: 3, done: false}
gen.next(); // {value: 4, done: false}
gen.next(); // {value: 5, done: true}

// we can also iterate over a generator using a for..of loop

for (var data of firstGenerator()) {
    console.log(data);
}

// 0
// 1
// 2
// 3
// 4


/* 
While this may seem simple to look at, generators are not always the easiest to read and can add a great deal of complexity quickly.

A better option is to use ES2017 async functions. 
*/

/* ES2017 Async Functions */


async function asyncExample() {
    return 1;
}

asyncExample(); // Promise {<resolved>: 1}


// Using Promises alone
async function logJokesAbout(term) {
    var data = await $.getJSON(`https://icanhazdadjoke.com/search?term=${term}`);
    console.log("Here is the joke data!", data);
}

logJokesAbout("spider");
logJokesAbout("pizza");
  // etc.

