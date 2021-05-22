/* Promises */

/* 
Promises are almost always preferred over callbacks when managing asynchronous code. 
Promises make use of callback functions, but help avoid deep nesting of callbacks and 
improve readability. Another advantage of promises is that they are immutable, so once 
a promise is done, you can not accidentally call it again (something you can do accidentally 
with callbacks).
*/

function firstPromise() {
  return new Promise(function (resolve, reject) {
    var x = Math.random();
    if (x > 0.5) {
      resolve(`Hooray! Your promise was resolved with value ${x}.`);
    } else {
      reject(`Oh no, your promise was rejected with value ${x}`);
    }
  });
}

firstPromise()
  .then(function (data) {
    return data;
  })
  .catch(function (error) {
    return error;
  });

/* 
Promises and asynchronous code

In our example above, the promise returned by firstPromise resolves or rejects immediately. But in most situations, 
this won't happen. Instead, you'll often use promises when dealing with some sort of asynchronous operation, like 
making an AJAX request.

We can mimic this behavior using a setTimeout. Let's see what this looks like, so that we can examine another example of promises.
*/

function secondPromise() {
  return new Promise(function (resolve, reject) {
    var timeToResolve = Math.random() * 5000;
    var maxTime = 3000;
    if (timeToResolve < maxTime) {
      setTimeout(function () {
        resolve(
          `Hooray! I completed your request after ${timeToResolve} milliseconds.`
        );
      }, timeToResolve);
    } else {
      setTimeout(function () {
        reject(
          `Sorry, this is taking too long. Stopping after ${maxTime} milliseconds. Please try again.`
        );
      }, maxTime);
    }
  });
}

secondPromise()
  .then(function (data) {
    console.log(data);
  })
  .catch(function (error) {
    console.log(error);
  });

/* Promises in jQuery */

/* 
As of version 3, jQuery has built-in support for promises! This means that when you use methods 
like $.get, $.getJSON, or $.ajax, you can chain .then and .catch methods to the end of them.
*/

function getJokesAbout(term) {
  return $.getJSON(`https://icanhazdadjoke.com/search?term=${term}`);
}

getJokesAbout("spider")
  .then(function (data) {
    console.log("Here is our joke data!", data);
  })
  .catch(function (err) {
    console.log("Oops, something went wrong", err);
  });

/* Promise.all */

//The other nice thing about Promises is that you can wait for multiple promises to resolve with the Promise.all function

function getJokesAbout(term) {
  return $.getJSON(`https://icanhazdadjoke.com/search?term=${term}`);
}

Promise.all([
  getJokesAbout("spider"),
  getJokesAbout("ghost"),
  getJokesAbout("pizza"),
])
  .then(function (data) {
    console.log("Woah check out all this data", data);
  })
  .catch(function (err) {
    console.log("Oops, something went wrong!");
  });
