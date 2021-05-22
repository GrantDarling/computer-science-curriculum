var nestedData = {
    innerData: {
      order: ["first", "second", "third"],
      snacks: ["chips", "fruit", "crackers"],
      numberData: {
          primeNumbers: [2,3,5,7,11],
          fibonnaci: [1,1,2,3,5,8,13]
      },
      addSnack: function(snack){
          this.snacks.push(snack);
          return this;
      }
    }
  }

/* 
Using a for loop, console.log all of the numbers in the primeNumbers array.
Using a for loop, console.log all of the even Fibonnaci numbers.
Console.log the value "second" inside the order array.
Invoke the addSnack function and add the snack "chocolate".
Inside of the addSnack function there is a special keyword called this. What does the word this refer to inside the addSnack function?
^^ in this instance it is referencing the nestedData object because it is a method of that object
*/

var primeNums = nestedData.innerData.numberData.primeNumbers
for (number in primeNums) {
    continue;
    /* console.log(primeNums[number]) */
}

var fibonnaciNums = nestedData.innerData.numberData.fibonnaci
for (number in fibonnaciNums) {
    if (fibonnaciNums[number] % 2 == 0){
        continue;
        /* console.log(fibonnaciNums[number]) */
    }
}

var orderNum = nestedData.innerData.order;

/* console.log(orderNum[1]); */

var innerData = nestedData.innerData


/* console.log(innerData.addSnack("chocolate")); */


var nestedObject = {
    speakers: [{name:"Elie"},{name:"Tim"},{name:"Matt"}],
    data: {
      continents: {
        europe: {
          countries: {
            switzerland: {
              capital: "Bern",
              population: 8000000
            }
          }
        }
      },
      languages: {
        spanish: {
            hello: "Hola"
        },
        french: {
            hello: "Bonjour"
        }
      }
    }
  }

  function addSpeaker(speaker) {
     nestedObject.speakers.push({"name": speaker})
  }

  addSpeaker("gawy");

/* console.log(nestedObject.speakers) */

function addLanguage(lang, translation) {
    nestedObject.data.languages[lang]= {hello: translation}
 }

 addLanguage("polish", "Oscha!");

/* console.log(nestedObject.data.languages) */


function addCountry(country, capital, population) {
    var EuropeanCountry = nestedObject.data.continents.europe.countries

    EuropeanCountry[country] = {
        "capital": capital, 
        "population": population
    }
    /* console.log(EuropeanCountry)  */
}

addCountry('colombia', 'Bogota', 230000)








