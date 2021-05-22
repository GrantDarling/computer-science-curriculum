/* 
      1. Write a function called displayFullName, which should accept two parameters, 
      firstName and lastName. The function should be immediately invoked and return 
      the firstName + lastName. You should NOT have to call this function, it should 
      invoke right away. 
*/

(function displayFullName(firstName, lastName) {
    return firstName + ' ' + lastName;
})("Gawy", "Smitsch");


/* 
      2. Write a function called createCalculator, which should return an object that has 
      four methods, add, subtract, multiply and divide.
*/


var createCalculator = {
    add: function(num1, num2) {
        return num1 + num2
    },
    subtract: function(num1, num2) {
        return num1 - num2
    },
    multiply: function(num1, num2) {
        return num1 * num2
    },
    divide: function(num1, num2) {
        return num1 / num2
    },
    
}

createCalculator.add(1, 88)
