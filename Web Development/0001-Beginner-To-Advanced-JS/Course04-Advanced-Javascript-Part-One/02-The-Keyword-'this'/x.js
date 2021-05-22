class invokeMax {
    constructor() {
        let counter = 0;

        this.increment = (fn, max) => {
            counter++;
            return counter > max ? "Maxed out!" : fn
        }
        this.getCounter = () => "counter " + counter;
    }
}

const newInvokeMax = new invokeMax();

const add = function (a, b) {
    return a + b;
}

//This works
console.log(newInvokeMax.increment(add(7,9), 3))
console.log(newInvokeMax.increment(add(7,9), 3))
console.log(newInvokeMax.increment(add(7,9), 3))
console.log(newInvokeMax.increment(add(7,9), 3))

//This doesn't...

var addOnlyThreeTimes = newInvokeMax.increment(add, 3)

/* console.log(addOnlyThreeTimes(1, 2)); // returns 3
console.log(newInvokeMax.getCounter()); 
console.log(addOnlyThreeTimes(2, 3)); // returns 5
console.log(newInvokeMax.getCounter()); 
console.log(addOnlyThreeTimes(3, 4)); // returns 7
console.log(newInvokeMax.getCounter()); 
console.log(addOnlyThreeTimes(4, 5)); // returns 9, should be 'Maxed out!'
console.log(addOnlyThreeTimes(1, 2)); // returns 3, should be 'Maxed out!' */