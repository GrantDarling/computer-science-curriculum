//Write a function called replaceWith that takes in a string, a character to replace and a 
//character to replace it with and returns the string with the replacements. Write tests to make 
//sure this is case sensitive

var replaceWith = function(arr, currChar, replacedChar) {
    if (typeof currChar === "number" || typeof replacedChar === "number") {return "Doesn't work like that."}
    return arr.map(function(element) {
        return element == currChar ? replacedChar : element;
    })
}

//Write a function called expand which takes an array and a number and returns a copy of the array with 
//as many numbers as specified

var expand = function(arr, copies) {
    expanded = []
    for(var i=0; i<copies; i++) {
        expanded.push(...arr);
    }
    return expanded;
}

//Write a function called acceptNumbersOnly which takes in any number of arguments and returns true if all 
//of them are numbers. Watch out for NaN - it is a typeof "number"!

var acceptNumbersOnly = function(arr) {
    return arr.every(function(currentValue) {
        return (typeof currentValue === 'number' && !Number.isNaN(currentValue) || (currentValue instanceof Array))
    })
}

//Write a function called mergeArrays which takes in two arrays and returns one array with the values sorted

var mergeArrays = function(arr) {
    if(!acceptNumbersOnly(arr)) {return "The array can only contain numbers"}

    return [].concat.apply([],arr).sort(function(a, b){return a-b})
}

/* Write a function called mergeObjects which takes in two objects and return an object with the keys and values 
combined. If the second parameter has the same key - it should override first one. There is a built in function 
called Object.assign - research it, but do not use it, try to do this on your own! */

var mergeObjects = function(target, source) {
    Object.keys(source).forEach(sourceKey => {
        Object.keys(target).forEach(targetKey => {
            if (targetKey === sourceKey) {
                target[targetKey] = source[sourceKey];
            }
            
            if (!Object.keys(target).includes(sourceKey)) {
                target[sourceKey] = source[sourceKey]
            }
        });
    });
    return target
}

module.exports = {
    replaceWith, 
    expand, 
    acceptNumbersOnly, 
    mergeArrays,
    mergeObjects
}