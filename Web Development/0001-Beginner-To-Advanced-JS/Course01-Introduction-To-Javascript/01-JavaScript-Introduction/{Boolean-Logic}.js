/* 1. Write down what the following statements will return. Try to figure this out before putting the commands in the chrome console. */

//2 == "2";
console.log(2 == "2") //true
//2 === 2;
console.log(2 === 2) //true
//10 % 3;
console.log(10 % 3) //1
//10 % 3 === 1;
console.log(10 % 3 === 1) //true
//true && false;
console.log(true && false) //false
//false || true;
console.log(false || true) //true
//true || false;
console.log(true || false) //true

/* part 2 and 3 where skipped because they were very simple. Just wanted to make sure my assumptions where correct about '==' and '===' */

// Difference between '==' and '==='
// '==' allows type coercion (moving the allowed type of a value to be changed. 
// '===' is much more strict in this sense and does not allow the type to change)