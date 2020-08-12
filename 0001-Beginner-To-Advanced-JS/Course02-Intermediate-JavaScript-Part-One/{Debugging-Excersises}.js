
/* 1. What does the throw keyword do? 
The throw keyword allows you to return an error/exception of your choice */

/* 2. What is the difference between a TypeError and ReferenceError TypeErrors?
   occur when JavaScript is unable to perform a certain operation on a data type 
   (invoking something that is not a function, accessing properties on something 
    that is not an object). ReferenceErrors occur when JavaScript does not have 
    a reference to the variable in memory (accessing a variable that is not defined 
        or not in the current or outer scope) */

/* 3. How do you create a snippet in the chrome dev tools? 
   Open the sources tab, head to the left hand panel and click on snippets, 
   then right click inside the tab and click 'new' */

/* 4. In the chrome dev tools, inside the sources tab, there is a "pause" button which 
   allows you to "pause on caught exceptions". What is an exception? An exception is an 
   error that occurs in your program. Caught exceptions are errors that are evaluated in 
   a try/catch block */

/* 5. How do we "catch" errors in JavaScript? Give an example with code for what that might 
   look like We catch errors using a try/catch block */

try {
    undefined()
 } catch(e){
     console.log("We just made a TypeError, we can learn more using the error object returned to us:", e);
 }

function displayEvenNumbers(){
    var numbers = [1,2,3,4,5,6,7,8];
    var evenNumbers = [];
    for(var i=0; i<numbers.length; i++){
        debugger
        if(numbers[i] % 2 == 0) {
            evenNumbers.push(numbers[i]);
        }
    }
    return evenNumbers;
}
displayEvenNumbers(); // should return [2,4,6,8] 