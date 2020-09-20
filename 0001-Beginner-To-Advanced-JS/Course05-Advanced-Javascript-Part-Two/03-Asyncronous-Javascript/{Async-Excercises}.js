

// one
// two

//1. Write inOrder using callbacks. One will always come first. 

let inOrder = () => {
    return logOne = setTimeout(function () {
        console.log("one!");
        logTwo = setTimeout(function () {
            console.log("two!");
            logThree = setTimeout(function () {
                console.log("three!");
            }, 100)
        }, 5000)
    }, 1000);
}

//inOrder();

// 2. Promise refactor of callbacks
//Change initial if statement to see the difference
let promiseRefactor = () => {
    return new Promise(function (resolve, reject) {
        if (true) {
            setTimeout(() => {
                resolve("hello")
            }, 1000);
        } else {
            reject("goodbye")
        }
    }).then((result) => {
        console.log(result); // hello
        return new Promise((resolve, reject) => {
            setTimeout(() => resolve(result + " + world"), 100);
        });
    }).then((result) => {
        console.log(result); //hello + world
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                setTimeout(() => resolve(result + " + world"), 1000);
            })
        })
    }).then((result) => {
        console.log(result); //hello + world + world
    }).catch((err) => {
        console.log(err + " world") //This gives us the error
    })
}

//promiseRefactor()

//async and await

function sync() {
    console.log("I am on the main thread.")
}

function timeout(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function sleep() {
    console.log('0')
    await timeout(0);
    console.log('1')
    await timeout(6000);
    console.log('2')
    await timeout(100);
    console.log('3')
}

sleep()
sync()
