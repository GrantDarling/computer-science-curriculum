//Data 

let users = [
    {
      username: 'larry',
      email: 'larry@foo.com',
      yearsExperience: 22.1,
      favoriteLanguages: ['Perl', 'Java', 'C++'],
      favoriteEditor: 'Vim',
      hobbies: ['Fishing', 'Sailing', 'Hiking'],
      hometown: {
        city: 'San Francisco',
        state: 'CA'
      }
    },
    {
      username: 'jane',
      email: 'jane@test.com',
      yearsExperience: 33.9,
      favoriteLanguages: ['Haskell', 'Clojure', 'PHP'],
      favoriteEditor: 'Emacs',
      hobbies: ['Swimming', 'Biking', 'Hiking'],
      hometown: {
        city: 'New York',
        state: 'NY'
      }
    },
    {
      username: 'sam',
      email: 'sam@test.com',
      yearsExperience: 8.2,
      favoriteLanguages: ['JavaScript', 'Ruby', 'Python', 'Go'],
      favoriteEditor: 'Atom',
      hobbies: ['Golf', 'Cooking', 'Archery'],
      hometown: {
        city: 'Fargo',
        state: 'SD'
      }
    },
    {
      username: 'anne',
      email: 'anne@test.com',
      yearsExperience: 4,
      favoriteLanguages: ['C#', 'C++', 'F#'],
      favoriteEditor: 'Visual Studio Code',
      hobbies: ['Tennis', 'Biking', 'Archery'],
      hometown: {
        city: 'Albany',
        state: 'NY'
      }
    },
    {
      username: 'david',
      email: 'david@test.com',
      yearsExperience: 12.5,
      favoriteLanguages: ['JavaScript', 'C#', 'Swift'],
      favoriteEditor: 'VS Code',
      hobbies: ['Volunteering', 'Biking', 'Coding'],
      hometown: {
        city: 'Los Angeles',
        state: 'CA'
      }
    }
  ];

//PART I

//Write a function called printEmails which console.log's each email for the users.

const printEmail = function(objects) {
    objects.forEach(function(obj) {
        console.log(obj.email);
    });
}


//printEmail(users)

//Write a function called printHobbies which console.log's each hobby for each user.
const printHobbies = function(objects) {
    objects.forEach(function(obj) {
        for(i=0;i<obj.hobbies.length;i++) {
            console.log(obj.hobbies[i])
        }
    });
}

//printHobbies(users)


// Write a function called findHometownByState which returns the first user which has a hometown of the state that is passed in

const findHometownByState = function(objects, state) {
    const ans = objects.find(function(object) {
            return object.hometown.state.toLowerCase() === state.toLowerCase()
    })
    return ans;
}


//console.log(findHometownByState(users, "CA"));

//Write a function called allLanguages which returns an array of all of the unique values
/* const allLanguages = function() {
    languages = []
    const ans = users.filter(function(object){
        for (lang in object.favoriteLanguages) {
            languages.push(object.favoriteLanguages[lang]);
        }
        return languages
    })
    return ans
}; */

//throw all languages into an array, 
//filter the array for duplicates 
const allLanguages = function() {
    languages = []
    users.forEach(function(obj) {
        obj.favoriteLanguages.forEach(function(lang) {
            languages.push(lang);
        })
    });
    return languages.filter(function(element,idx) {
        return languages.indexOf(element) == idx
    })
}

//console.log(allLanguages());
// ["Perl", "Scala", "C++","Haskell", "PHP","JavaScript","Ruby", "Python", "Go","C#", "F#", "Swift"]


//Write a function called hasFavoriteEditor which returns a boolean if any of the users have the editor passed in

const hasFavoriteEditor = function(editor) {
    return users.map(function(obj) {
        return obj.favoriteEditor
    }).some(function(val) {
        return val == editor
    })
}

//console.log(hasFavoriteEditor('VS Code')); // true
//console.log(hasFavoriteEditor('Eclipse')); // false

//Write a function called findByUsername which takes in a string and returns an object in the users array that has that username

const findByUsername = function(userName) {
    
}
findByUsername('david');
/*/
{
    username: "david",
    email: "david@test.com",
    years_experience: 12.5,
    favorite_languages: ["JavaScript", "C#", "Swift"],
    favorite_editor: "VS Code",
    hobbies: ["Volunteering", "Biking", "Coding"],
    hometown: {
        city: "Los Angeles",
        state: "CA"
    }
}
/*/


