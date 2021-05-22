Array.prototype.map = function(callback) {
    const newArray = [];

    // 'this' refers to the array
    for (let i = 0; i < this.length; i++) {
        newArray[i] = callback(this[i], i);
    }

    return newArray;
}

var array = [6,8,0]

console.log(array.map((element) => ++element));