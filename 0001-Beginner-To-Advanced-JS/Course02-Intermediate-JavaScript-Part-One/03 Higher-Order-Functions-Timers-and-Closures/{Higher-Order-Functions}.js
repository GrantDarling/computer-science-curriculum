/* 
    1. write a function called each which accepts two parameters: an array and a callback function. 
   The each function should loop over the array passed to it and run the callback function on each 
   element in it 
*/

function each(arr, fn) {
    for (i = 0; i < arr.length; i++) {
        fn(arr[i]);
    }
}


each([1, 2, 3, 4], function (val) {
    //console.log(val);
});
// Here is what should be output if you wrote the function correctly

// 1
// 2
// 3
// 4

each([1, 2, 3, 4], function (val) {
    //console.log(val * 2);
});

// Here is what should be output if you wrote the function correctly

// 2
// 4
// 6
// 8




/* 
   2. Write a function called map which accepts two parameters: an array and a callback. 
   The map function should return a new array with the result of each value being passed 
   to the callback function. Here's an example: 
*/

function map(arr, fn) {
    clone_arr = []
    for (i = 0; i < arr.length; i++) {
        new_val = fn(arr[i]);
        clone_arr.push(new_val)
    }
    //console.log(clone_arr)
}

map([1,2,3,4], function(val){
    console.log(val*2)
    return val * 2;
}); // [2,4,6,8]


/* 
   3. Write a function called reject which accepts two parameters an array 
   and a callback. The function should return a new array with all of the 
   values that do not return true to the callback.
*/


function reject(arr, callback) {
    rejected = []
    for(i=0;i<arr.length;i++) {
        cond = callback(arr[i])
        if (cond === false) { rejected.push(arr[i]) }
    }
    console.log(rejected)
}

reject([1,2,3,4], function(val){
    return val > 2;
}); // [1,2]

reject([2,3,4,5], function(val){
    return val % 2 === 0;
}); // [3,5]
