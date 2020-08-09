/* 1. Given the following object below, write code to print the value then the key to the console separated by '=>': */

var namesAndHobbies = {
    elie: "JavaScript",
    matt: "jogging",
    janey: "table building",
    tim: "sailing",
}

/* 2. Add a key for your name, and a value for your favorite hobby to the namesAndHobbies object. */
namesAndHobbies.grant = "programming";

for (name in namesAndHobbies) {
    console.log(`${namesAndHobbies[name]} => ${name}`);
}

// Output should be:
// JavaScript => elie
// jogging => matt
// table building => janey
// sailing => tim

/* 3. Write an if statement that console.logs your name and hobby to the console if the key of your name is contained in the object. */

if ("grant" in namesAndHobbies) {
    console.log(`${namesAndHobbies.grant} => grant`);
} 

