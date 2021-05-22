// PART ONE: Regular Expression Syntax

//One way to create a regular expression is to place the pattern between two forward slashes //

var pattern = /Elie/;

//Now that we have created our first pattern, let's get started with our first string method, match. 
//Match will return an array of matches, or null if a match is not found.

var str = "My name is Elie, is your name Elie?";
var matches = str.match(/Elie/);
matches; // // ["Elie"]

/* 
Notice here, that matches is an array of the pattern we are trying to match. But it only returns the first occurance 
of Elie to us! If we would like to match all occurances accross a string, we need to add what is called a flag. We 
place our flags after the closing / in a regular expression and then specify the type of flag with a single character. 
The flag we will be using is g, which is the global flag and finds all matches in the entire string.
*/

var str = "My name is Elie, is your name Elie?";
var matches = str.match(/Elie/g);
matches; // ["Elie", "Elie"]

//To make the search case INsensitive, add the i flag

var str = "My name is Elie, is your name Elie?";
var matches = str.match(/elie/gi);
matches // ["Elie", "Elie"]

/* The Wildcard Character */

/* 
Sometimes, we have an idea of what characters we want to match in a string or word, 
but don't care about other characters in that string or word. If we want to match 
anything we can use the special character . - this is known as the "wildcard" character, 
and will match anything except for the newline character. Let's take a look at an example:
*/

var str = "The cat in the hat deserves a pat";
var matches = str.match(/.at/g);
matches; // ["cat", "hat", "pat"]

var str = "shape tape grape";
var matches = str.match(/..a.e/gi) // better ways of doing this
matches; // ["shape", " tape", grape"]

var numbers = '123 321 121 111 428 888';
var matches = numbers.match(/.2./g);
matches // ["123", "321", "121", "428"]

/* Characteer Sets */

/* 
Let's now imagine that we want to match a string that has four characters, but the first character has to be 
"a", "b", "c" or "d". We need some way of specifying all of those characters. This is where character sets 
come in - and they are denoted by placing characters inside of []. You can specify a range with character 
sets using the - character.
*/

var str = 'amen bean cups deer pear';
var matches = str.match(/[a-d].../g); 
matches // ["amen", "bean", "cups", "deer"]

/* Greedy matching */

// ? - This matches at most 1 of the previous match. In other words, it marks the previous match as optional.

var match1 = "cookies".match(/cookies?/) // ['cookies']
var match2 = "cookie".match(/cookies?/) // ['cookie']
var match3 = "cookies".match(/cookiess?/) // ['cookies']
var match4 = "cookies".match(/cookiesss?/) // null

// + - This matches one or more of the previous match.

var match1 = "cookiessssssssss".match(/cookies+/) // ["cookiessssssssss"]
var match2 = "cookies".match(/cookies+/) // ['cookies']
var match3 = "cookie".match(/cookies+/) // null

// * - This matches zero or more of the previous match.

var match1 = "cookiessssssssss".match(/cookies*/) // ["cookiessssssssss"]
var match2 = "cookies".match(/cookies*/) // ['cookies']
var match3 = "cookie".match(/cookies*/) // ['cookie']

// We can also use the wildcard character . and the * character to match zero or more of anything.

// match anything that starts with, ends with or has the letter e inside of it

"elie".match(/.*e.*/gi); // ['elie']
"elephants are everywhere".match(/.*e.*/gi); // ['elephants are everywhere']
"can you think of a string containing almost all non-consonants?".match(/.*e.*/g); // null

/* Character Ranges */

/* 
When we want a specific quantity of characters we can use the character range which is denoted by {}. e{2} 
will match the letter 'e' exactly two times. You can even specify a range with a minimum and maximum value 
e{1,3} will match the letter 'e' one to three times. If you omit the second number in the character range, 
but include a ,, it will match an infinite amount. For example, e{2,} will match the character "e" two 
times or more.
*/

// only match when there is more than 1 'l'
var str = "helo hello hellllo hellllllllllo"
str.match(/hel{2,}o/g) // ["hello", "hellllo", "hellllllllllo"]

// count how many words have two or more o's or two d's in the middle 
var str = "noodle caboodle testing fiddle person diddle muddle booooombox"
str.match(/[od]{2,}/g).length // 6

/* Escaping Characters */

// let's try to find the number of periods in a sentence.
var str = "Hello. I'm Elie."
str.match(/./g) // ["H", "e", "l", "l", "o", ".", " ", "I", "'", "m", " ", "E", "l", "i", "e", "."] - think about why this might happen?

//When we are trying to find special characters in a string, we need to escape them with a backslash (\) character. Here is what that would look like:

// let's try to find the number of periods in a sentence.
var str = "Hello. I'm Elie."
str.match(/\./g) // [".", "."] - much better!

/* Replace, Search and Split */

var str = "awesome"
str.replace('e','z') // "awzsome" - it does not get the last e!

var str = "awesome"
str.replace(/e/g,'z') // "awzsomz" - much better!

// using a callback
var str = "awesome"
str.replace(/[aeiou]/g, function(match) {
    return match.toUpperCase();
}); // "AwEsOmE";

var str = "awesome"
str.search('awe') // 0
str.search('z') // -1

// using a regular expression
var str = "awesome"
str.search(/..e/) // 0
str.search(/p/) // -1

var str = "My name is elie"
str.split(/e/g);

/* Using the RegExp constructor */

/* 
So far we have seen how to create a regular expression using the // notation. This notation is quite easy to use, 
but is a problem when we need to dynamically create it and we don't know what the pattern will be beforehand. 
Let's examine the following function countLetters, which accepts a word and letter and returns the number of times 
the letter appears
*/

function countLetters(word, letter){
    var regex = new RegExp(letter, 'gi')
    var matches = word.match(regex)
    if(matches){
        return matches.length
    }
    return 0;
}

countLetters('awesome', 'e') // 2



//PART 2: Metacharacters and Grouping


/* Metacharacters */

// \d
// This matches a digit character. Instead of using [0-9], we can use \d:

var simplePhoneRegex = /[0-9]{3}-[0-9]{3}-[0-9]{4} /
var betterPhoneRegex = /\d{3}-\d{3}-\d{4}/
var str = "My number is 201-867-5309"
str.match(betterPhoneRegex) // ["201-867-5309"]

// \D
// This matches a non-digit character. We will see that the capitalized versions of metacharacters are equivalent to the not of the lower case metacharacter.

var noNumbers = /\D+/g
var str = "H3ll0"
str.match(noNumbers) // ["H", "ll"]

// \n, \r and \t
// These characters match newlines, carriage return, and tab characters, respectively:

"this is \n a string \n on many \n lines".match(/\n/g) // returns an array of three newlines

// \s
// This character matches any whitespace character:

"please remove all the white space now".replace(/\s/g,'') // "pleaseremoveallthewhitespacenow"

// \S
// This character matches any non-whitespace character:

"please remove everything but the white space now".replace(/\S/g,'') // "       "

// \w
// This character matches any word character. Notice what is defined as a word character below. In particullar, numbers count as word characters!

"pl3ease r3mov3 ALL 12the 44word characters__. So what is left? Maybe [] or {} or () or !@#$%^&*".replace(/\w/g,'') // "     .    ?  []  {}

// \W
// This characters matches any non-word character which includes spaces, special characters (.!@#$%*() and whitespace characters):

"j ".replace(/\W/g,'wow') // "jwow"



/* Special Characters */

// starting - ^
// If we want to match starting from the beginning of a string, we can use the ^ character:

"this is great".match(/^t.*/) // ["this is great"]
"now this is not great".match(/^t.*/) // null


// ending - $
// If we want to match something that specifically ends with a character we use $:

"first.test.js".match(/.*\.test.js$/) // ["first.test.js"]
"first.js".match(/.*\.test.js$/) // null

// excluding ^ (inside [])
// If we want to exclude something in a character set we use ^ inside []:

"let's get rid of everything that is not a vowel".replace(/[^aeiou]/gi,'') // "eeioeeiaioaoe"

// or - |
// If we want to handle multiple conditions we can use the or operator with a |. If you find yourself using multiple | operators, there is usually a better regular expression for the job.

"banana bread".match('bread|pancakes$') // ["bread"]
"banana pancakes".match('bread|pancakes$') // ["pancakes"]

// word boundaries - \b
// The metacharacter \b matches the boundary between a word and a non-word character. It is used commonly when capturing entire words between non character words. The pattern for that is /\w+\b/.

"my email is. . . . . . .elie@rithmschool.com".match(/\b/g).length // 12 - why does this return 12? Count each start and end of a word (between non character word)

// my
// email
// is
// elie
// rithmschool
// com

// => 6 * 2 = 12

// Now let's use word boundaries a bit better!

"my email is. . . . . . . elie@rithmschool.com".match(/\w+\b/g) // ["my", "email", "is", "elie", "rithmschool", "com"]

"http://www.google.com".match(/\w+\b/g) // ["http", "www", "google", "com"]

/* Groupings */

// A more advanced concept in regular expressions is the idea of creating groups which you can later access. To create a group, we use the () characters. We can then refer to these groups as $1, $2, and so on.

var tweet = "This is the best tweet #amazing #perfect #sogood";
var regex = /#([\S]+)/ig;

var matches = tweet.match(regex);

matches.map(v => v.replace(regex, 'hashtag: $1')) // ["hashtag: amazing", "hashtag: perfect", "hashtag: sogood"]