/* 1. some
To figure out if ANY single value satisfies a condition in an array, we can use the some function. 
This will return true if ANY value passes a condition specified in the callback, and false if all 
values fail the condition. */

let arr = [1,2,3,4];

let anythingGreaterThanTwo = arr.some(function(val){
    return val > 2;
});

let anyStrings = arr.some(function(val){
    return typeof val === "string";
});

console.log("The 'some' iterator");
console.log(anythingGreaterThanTwo); // true
console.log(anyStrings + '\n'); // false


/* 2. every
To figure out if ALL values satisfy a condition in an array, we can use the every function. This 
will return true if ALL values pass a condition specified in the callback. If even one value fails 
the condition, every will return false. */

let arr2 = [1,2,3,4];

let everythingGreaterThanTwo = arr2.every(function(val){
    return val > 2;
});

let everythingLessThanFive = arr2.every(function(val){
    return val < 5;
});

console.log("The 'every' iterator");
console.log(everythingGreaterThanTwo); // false
console.log(everythingLessThanFive + '\n'); // true


/* 3. find
find was added to JavaScript in ES2015 to make it easier to find an element in an array based on 
some condition. This iterator will return the first value in an array that satisfies a condition 
(an expression that returns true in the callback). */

let arr3 = [-3,1,8,4];
let firstValueGreaterThanTwo = arr3.find(function(val){
    return val > 2;
});

console.log("The 'find' iterator");
console.log(firstValueGreaterThanTwo + '\n'); // 8


/* 4. findIndex
To find the first index in an array that satisfies a condition (an expression that returns true in the callback) 
- we can use the findIndex function. */

let arr4 = [-3,1,8,4];
let firstIndexOfElementGreaterThanTwo = arr4.findIndex(function(val){
    return val > 2;
});

console.log("The 'findIndex' iterator");

console.log(firstIndexOfElementGreaterThanTwo + '\n'); // 2


/* 5. Combining Iterators
By combining iterators, you can often manipulate arrays using a sequence of very simple functions, rather than one 
larger, more complex loop. For example, suppose you wanted to take an array of numbers, filter out the even ones, 
double the remaining values, and then add everything up. We can do this by chaining three iterators together: */

let arr5 = [1,2,3,4,5]
let chain = arr5.filter(function(val){
    return val % 2 !== 0; // only keep odd numbers
}).map(function(val){
    return val * 2; // double remaining values
}).reduce(function(acc,next){
    return acc + next; // add everything up
},0) // 18


//make things more readable 

let arr6 = [1,2,3,4,5];

function isNumberOdd(val) {
    return val % 2 === 1;
}

function doubleValue(val) {
    return val * 2;
}

function sum(a,b) {
    return a + b;
}

arr6.filter(isNumberOdd)
    .map(doubleValue)
    .reduce(sum,0); // 18

console.log("Chaining iterators");
console.log(chain); //18