var nestedArr = [[1, 2, 3], [4, 5, 6], [7, 8, 9, 10, 11, 12]];

for (arrays in nestedArr) {
    //console.log(arrays);
    for (array in nestedArr[arrays]) {
        //console.log(nestedArr[arrays][array]);
    }
}

//Same thing but the way they should in the tutorial
for (var i = 0; i < nestedArr.length; i++) {
    //console.log(i);
    for (var j = 0; j < nestedArr[i].length; j++) {
        //console.log(nestedArr[i][j]);
    }
}

//Given the following array, write a function called printEvens that console.logs all of the even numbers

var nestedArr = [[1, 2, 3], [4, 5, 6], [7, 8], [9, 10, 11, 12]];

function printEvens() {
    for (var i = 0; i < nestedArr.length; i++) {
        //console.log(i);
        for (var j = 0; j < nestedArr[i].length; j++) {
            if (nestedArr[i][j] % 2 == 0) {
                //console.log(nestedArr[i][j]);
            }
        }
    }
}

printEvens();

// 2
// 4
// 6
// 8
// 10
// 12


// Given the following array, write a function called sumTotal returns the sum of all numbers in the array
var nestedArr = [[1, 2], [3, 4], [5, 6]];

function sumTotal() {
    sum = 0;
    for (var i = 0; i < nestedArr.length; i++) {
        for (var j = 0; j < nestedArr[i].length; j++) {
            sum += nestedArr[i][j]
        }
    }
    console.log(sum);
}

sumTotal(); // 21
