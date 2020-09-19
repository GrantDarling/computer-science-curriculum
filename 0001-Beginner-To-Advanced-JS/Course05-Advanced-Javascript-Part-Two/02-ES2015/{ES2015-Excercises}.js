//Convert the following es5 code blocks into es2015 code:

//Problem #1 

//ES5

var person = {
    fullName: "Harry Potter",
    sayHi: function(){
        setTimeout(function(){
            console.log("Your name is " + this.fullName)
        }.bind(this),1000)
    }
}

// console.log(person);

//ES6

var person = {
    fullName: "Harry Potter",
    sayHi: () => {
        setTimeout(() => {
            console.log("Your name is " + this.fullName)
        },1000)
    }
}

// console.log(person);

//Problem #2 

//ES5
var name = "Josie"
// console.log("When " + name + " comes home, so good")

//ES6
var name = "Josie"
// console.log(`When ${name} comes home, so good`)

//Problem #3 

//ES5
var DO_NOT_CHANGE = 42;
DO_NOT_CHANGE = 50; // stop me from doing this!

//ES6
//const DO_NOT_CHANGE = 42;
//DO_NOT_CHANGE = 50; // stop me from doing this!

//Problem #4 

//ES5 
var arr = [1,2]
var temp = arr[0]
arr[0] = arr[1]
arr[1] = temp

//console.log(arr)

//ES6
var [a, b] = [1, 2];
[a, b] = [b, a];
var arr2 = [a,b]
//console.log(arr2)

//Problem #5 

function double(arr){
    return arr.map(function(val){
        return val*2
    });
}
//console.log(double([5,5,6]))

let double2 = arr => arr.map(val => val *2)

//console.log(double2([5,5,6]))


//Problem #6 

var obj = {
    numbers: {
        e: 1,
        f: 2
    } 
}

//ES5
var e = obj.numbers.e;
var f = obj.numbers.f;

//ES6
var {e,f} = obj.numbers;

//console.log(e,f)

//Problem 7

//ES5
function add(a,b){
    if(a === 0) a = 0
    else {
        a = a || 10    
    }
    if(b === 0) b = 0
    else {
        b = b || 10    
    }
    return a+b
}

// console.log(add(5,4))
// console.log(add(0,0))

//ES6
let add2 = (a=10,b=10) => a+b;

// console.log(add2(5,4))
// console.log(add2(0,0))


//Research the following functions - what do they do?

//1. Array.from

/* 
The Array.from() static method creates a new, shallow-copied Array instance 
from an array-like or iterable object
*/

console.log(Array.from('foo'));
// expected output: Array ["f", "o", "o"]

console.log(Array.from([1, 2, 3], x => x + x));
// expected output: Array [2, 4, 6]



//2. Object.assign

/* 
The Object.assign() method copies all enumerable own properties from one or more 
source objects to a target object. It returns the target object.
*/

const target = { a: 1, b: 2 };
const source = { b: 4, c: 5 };

const returnedTarget = Object.assign(target, source);

console.log(target);
// expected output: Object { a: 1, b: 4, c: 5 }

console.log(returnedTarget);
// expected output: Object { a: 1, b: 4, c: 5 }


//3. Array.includes

/* 
The includes() method determines whether an array includes a certain value among its entries, 
returning true or false as appropriate.
*/

const array1 = [1, 2, 3];

console.log(array1.includes(2));
// expected output: true

const pets = ['cat', 'dog', 'bat'];

console.log(pets.includes('cat'));
// expected output: true

console.log(pets.includes('at'));
// expected output: false


//4. String.startsWith

/* 
The startsWith() method determines whether a string begins with the characters of a specified 
string, returning true or false as appropriate.
*/
const str1 = 'Saturday night plans';

console.log(str1.startsWith('Sat'));
// expected output: true

console.log(str1.startsWith('Sat', 3));
// expected output: false

console.log(str1.startsWith('urday', 3));
// expected output: true
