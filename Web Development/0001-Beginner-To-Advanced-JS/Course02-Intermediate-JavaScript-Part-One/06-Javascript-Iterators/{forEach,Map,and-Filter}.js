// forEach

/* 1. Write a function called printFirstAndLast which accepts an array 
(of objects) and console.logs a new string with the first character 
and the last character of each value. */

const printFirstAndLast = function (array) {

    array.forEach(function (val, index, arr) { //index, arr aren't actually needed, just for reference
        valArray = val.split('')
        //console.log(`${valArray[0]}${valArray[(valArray.length-1)]}`)
    });

}


printFirstAndLast(['awesome', 'example', 'of', 'forEach'])

// ae
// ee
// of
// fh

/* 2. Write a function called addKeyAndValue which accepts three parameters, 
an array (of objects), a key and a value. This function should return the array 
of objects after each key and value have been added to each object in the array */

const addKeyAndValue = function (objects, key, value) {
    objects.forEach(function (object, index, allobjects) { //index, allobjects aren't actually needed, just for reference
        object[key] = value;
    });
    //console.log(objects);
}


addKeyAndValue([{ name: 'Elie' }, { name: 'Tim' }, { name: 'Elie' }], "isInstructor", true)

/*
[
    {
        name: 'Elie',
        isInstructor: true
    },
    {
        name: 'Tim',
        isInstructor: true
    },
    {
        name: 'Elie',
        isInstructor: true
    }
]
*/




// map


/* 3. Write a function called valTimesIndex which accepts an array of numbers 
and returns a new array with each value multiplied by the index it is at in the array */

const valTimesIndex = function (array) {
    array.map(function (val, idx) {
        return val * idx;
    })
}
valTimesIndex([1, 2, 3]) // [0,2,6]
valTimesIndex([5, 10, 15]) // [0,10,30]

/* 4. Write a function called extractKey which accepts two parameters, an array of objects, 
and the name of a key and returns an array with just the values for that key: */

const extractKey = function (objects, chosenKey) {
    chosenKeyValues = []
    objects.map(function (obj, idx) {
        for (currKey in obj) {
            if (currKey === chosenKey) {
                chosenKeyValues.push(obj[currKey])
            }
        }
    });
    //console.log(chosenKeyValues)
    return chosenKeyValues
}

extractKey([{ name: "Elie", isInstructor: true }, { name: "Tim", isInstructor: true }, { name: "Matt", isInstructor: true }], "name")

// ["Elie", "Tim", "Matt"]



/* 5. Write a function called filterLetters which accepts an array of letters and returns the 
number of occurrences of a specific letter. This function should be case insensitive */

const filterLetters = function(array, char) {
    const filtered = array.filter(function(val) {
        return val.toLowerCase() === char.toLowerCase();
    });
    return filtered.length;
}

filterLetters(["a","a","b","c","A"], "a"); // 3
filterLetters(["a","a","b","c","A"], "z"); // 0
filterLetters(["a","a","b","c","A"], "B"); // 1


/* 6. Write a function called filterKey which accepts two parameters, an array of objects, and 
the name of a key and returns an array with only those objects which have truthy values for that key: */

const filterKey = function(objects, filterKey) {
    const filtered = objects.filter(function(obj, idx) {
        for (key in obj) {
            if(key === filterKey) {
                return obj[key] === true
            }
        }
    });
    return filtered
}

console.log(filterKey([{name: "Elie", isInstructor:true, isHilarious: false},{name: "Tim", isInstructor:true, isHilarious: true},{name: "Matt", isInstructor:true}, {name: "Greg", isInstructor:true, isHilarious: true}], "isHilarious"));

//[{name: "Tim", isInstructor:true, isHilarious:true}, { name: 'Greg', isInstructor: true, isHilarious: true }]