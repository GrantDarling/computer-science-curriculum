/* 
Part I:
Make the tests pass for the following tasks:

Create a constructor function for a Person. Each person should have a firstName, lastName, favoriteColor, favoriteNumber and favoriteFoods (which should be an array).
*/

//Add a function on the Person.prototype called fullName that returns the firstName and lastName property of an object created by the Person constructor concatenated together.

var Person = function(firstName, lastName, favColour, favNumber) {
    this.firstName = firstName
    this.lastName = lastName
    this.favColour = favColour
    this.favNumber = favNumber
    this.family = []
}

Person.prototype.fullName = function() {
    return this.firstName + ' ' + this.lastName;
}

var p = new Person("Shana", "Malarkin", "Green", 38);
p.fullName(); // Shana Malarkin

//Overwrite the toString method from the Object prototype by creating a toString method for Person. The toString method should return a string in the following format:

Person.prototype.toString = function() {
    return this.fullName() + ' Favourite Color: ' + this.favColour + ', Favourite Number: ' + this.favNumber;
}

p.toString(); // Shana Malarkin, Favorite Color: Green, Favorite Number: 38

//Add a property on the Person object called family which is an empty array.

/* 
Add a function on the Person.prototype called addToFamily which adds an object constructed from the Person constructor to the family array. To make sure that
the object you are adding is an object construced from the Person constructor - take a look at the instanceofoperator. Make sure that your family array does 
not include duplicates! This method should return the length of the family array.
*/

Person.prototype.addToFamily = function(familyMember) {
    for (currentMember in this.family) {
        if (familyMember === familyMember) {return "family member exists"}
    }
    return this.family.push(familyMember)
}

console.log(p.family); // []
console.log(p.addToFamily(p));// 1
console.log(p.family.length); // 1
console.log(p.addToFamily(p)); // 1 - No duplicates!
console.log(p.family.length); // Length should still be 1
