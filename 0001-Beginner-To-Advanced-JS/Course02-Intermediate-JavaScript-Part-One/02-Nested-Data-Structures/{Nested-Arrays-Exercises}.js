/* Write a function called rotate which takes an array and a number, and moves each element however many spaces 
the number is to the right. For the value at the end of the array, rotate should move it back to the beginning. */

function rotate(arr, num) {
    var clone = arr.slice(0);
    var amount = num % arr.length;

    for (var i = 0; i < amount; i++) {
        clone.unshift(clone.pop());
    }
    /* console.log(`[${clone}] \n`) */
}

rotate([1, 6, 3, 5, 7], 3) // [7,5,3,1,6]
//7,1,6,3,5
//5,7,1,6,3

rotate([1, 2, 3], 1) // [3,1,2]
rotate([1, 2, 3], 2) // [2,3,1]
rotate([1, 2, 3], 3) // [1,2,3]




/* 
Write a function called makeXOGrid which takes in two parameters, rows and columns, 
and returns an array of arrays with the number of values in each subarray equal to 
the columns parameter and the number of subarrays equal to the rows parameter. The values 
in the sub-arrays should switch between "X" and "O".
*/

//Not a great solution but much better than the solution provided soo.. good enough.
function makeXOGrid(rows, cols) {
    grid = [];
    for (var i=0; i < rows; i++) {
        grid.push([]);
        for (var j=0; j < cols; j++) {
            var cell = (cell == 'x') ? 'o' : 'x';
            grid[i].push(cell);
        }
    }
    return grid
}

makeXOGrid(1,4) 

/*/
[["X","O","X","O"]]
/*/

makeXOGrid(3,2) 

/*/
[["X","O"],["X","O"],["X","O"]]
/*/

makeXOGrid(3,3) 
/*/
[["X","O","X"],["O","X","O"],["X","O","X"]]
/*/