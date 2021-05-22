/* 
Answer the following questions and make the tests pass.

1. What is the purpose of a constructor function?

    The purpose of constructor is to initialize the object of a 'class' in javascript and reducing the amount of code 

1. What does the new keyword do?

    The new keyword does 4 things. 

    1. initalizes an empty object 
    2. Assigns the value of 'this' to the object 
    3. It adds a 'return this' line to the end of the constructor function
    4. It adds a property called __proto__ to the empty object which links it to its constructor (which I believe is this (Object.create(ConstructorName.prototype)))

2. What does the keyword this refer to inside of a constructor function?
    The current object being initialized

3. What is a class? What is an instance?
    In object-oriented programming, a class is an extensible program-code-template for creating objects, providing initial values for state and implementations of behavior

    An Instance is a specific initialization or a object created from the class
*/

//Create a constructor function for a Person, each person should have a firstName, lastName, favoriteColor and favoriteNumber.

var Person = function(firstName, lastName, favoriteColor, favoriteNumber) {
    this.firstName = firstName
    this.lastName = lastName
    this.favoriteColor = favoriteColor
    this.favoriteNumber = favoriteNumber
}

//Write a method called multiplyFavoriteNumber that takes in a number and returns the product of the number and the Person's favorite number

Person.prototype.multiplyFavoriteNumber = function() {
    return this.favoriteColor + this.favoriteNumber
}

var kelly = new Person("kelly", 'Smitsch', "grey", '69')
kelly.multiplyFavoriteNumber() // "grey69"

//Refactor the following code so that there is no duplication inside the Child function.

//before 
function Parent(firstName, lastName, favoriteColor, favoriteFood){
    this.firstName = firstName;
    this.lastName = lastName;
    this.favoriteColor = favoriteColor;
    this.favoriteFood = favoriteFood;
}

function Child(firstName, lastName, favoriteColor, favoriteFood){
    this.firstName = firstName;
    this.lastName = lastName;
    this.favoriteColor = favoriteColor;
    this.favoriteFood = favoriteFood;
}

//after

function Parent(firstName, lastName, favoriteColor, favoriteFood){
    this.firstName = firstName;
    this.lastName = lastName;
    this.favoriteColor = favoriteColor;
    this.favoriteFood = favoriteFood;
}

var tom = new Child('tom', 'turner', 'light pink', 'burgers');


function Child(firstName, lastName, favoriteColor, favoriteFood, eyeColor) {
    Parent.apply(this, arguments)
    this.eyeColor = eyeColor
}

var timmy = new Child('timmy', 'turner', 'midnight blue', 'pizza', 'pink');

timmy.favoriteColor // 'midnight blue'
timmy.eyeColor //'pink'
tom.eyeColor // 'undefined'


