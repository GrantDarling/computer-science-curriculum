let arr = [1,2,3,4];
const example = arr.reduce(function(acc,next){
    if(next >= 2){
        acc['key' + next] = next;
    }
    return acc;
},{});

// Think about what acc and next are for each step in the iteration!
// Ultimately, this reduce will return the following:
// Object {key2: 2, key3: 3, key4: 4}

console.log(example);

/* 1. Write a function called extractKey which accepts two parameters, an array of objects, 
and the name of a key and returns an array with just the values for that key: */

const extractKey = function (objects, filterKey) {
    const ans = objects.reduce(function (accumulator, next) {
        for (key in next) {
            if (key === filterKey) { accumulator.push(next[key]) }
        }
        return accumulator;
    }, []);
    return ans
};
console.log(extractKey([{ name: "Elie", isInstructor: true }, { name: "Tim", isInstructor: true }, { name: "Matt", isInstructor: true }], "name"));

// ["Elie", "Tim", "Matt"]

/* 2. Write a function called filterLetters which accepts an array of letters and returns 
the number of occurrences of a specific letter. This function should be case insensitive */

const filterLetters = function (array, char) {
    counter = 0;
    ans = array.reduce(function (acc, next) {
        if (next.toLowerCase() === char.toLowerCase()) { acc ++; }
        return acc;
    }, 0);
    return ans
};
console.log(filterLetters(["a", "a", "b", "c", "A"], "a")); // 3
console.log(filterLetters(["a", "a", "b", "c", "A"], "z")); // 0
console.log(filterLetters(["a", "a", "b", "c", "A"], "B")); // 1