/* 1. Create an object that has your firstName, lastName, and occupation as keys. */

var me = {
    firstName: "Grant",
    lastName: "Darling",
    occupation: "Developer"
}

/* 2. Access each value from your object using both dot notation and bracket notation. */

// console.log(me.firstName)
// console.log(me["firstName"])

// console.log(me.occupation)
// console.log(me["occupation"])

/* 3. Add a key for hobby to your object. Remove the key and value for occupation. */

me.hobby = "Programming"
delete me.occupation 

// console.log(me);

/* 4. What is the difference between dot notation and bracket notation? */

// Both bracket notation and dot notation work similarily, it is preferable to use dot 
// notation but sometimes bracket notation is necessary. Mainly if the key is a number
// or if you need to pass in the variable to get the name of the key
