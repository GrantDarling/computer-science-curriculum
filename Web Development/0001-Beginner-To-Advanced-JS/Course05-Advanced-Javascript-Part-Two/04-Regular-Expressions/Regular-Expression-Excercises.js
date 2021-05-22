// Codewars Problem #1
/* 
Create a function that given a string, retains only the letters A-Z (upper and lowercase), 
0-9 digits, and whitespace characters. Also, returns "Not a string!" if the entry type is 
not a string.
*/


// My solution
function nothingSpecial(str) {
    if (typeof str !== "string" || null) return 'Not a string!';
    noSpecialCharacters = str.replace(/[_]/g, "").match(/\w|\s/g)
    return noSpecialCharacters === null ? "" : noSpecialCharacters.join('')
}

// Better solution
function nothingSpecial(str) {
    return typeof str === "string" ? str.replace(/[^a-z\d\s]+/ig, "") : "Not a string!"
}


// Codewars Problem #2
/* 
Create a function that will tell how many sentences are in a paragraph, based on the number
of periods ".", question marks "?" and "!" exclamation points that an input string contains.
*/

// My Solution
function isItBugged(code) {
    let correctDateFormat = code.match(/\d{2}-\d{2}-\d{4}\s{1}\d{2}:\d{2}/)
    return correctDateFormat !== null ? true : false
}

// Better Solution
function isItBugged(date) {
    return /\d{2}-\d{2}-\d{4} \d{2}:\d{2}/.test(date);
}



// Codewars Problem #3
/* 
Remove all exclamation marks from the end of words. Words are separated by spaces in the sentence.
*/

// My solution
function remove(s) {
    return s.replace(/!+\s/g, ' ').replace(/!+$/g, '')
}

// Better Solution
function remove(s){
    return s.replace(/\b!+/g, '');  
  }


