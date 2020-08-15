function map(arr, fn) {
    clone_arr = []
    for (i = 0; i < arr.length; i++) {
        new_val = fn(arr[i]);
        clone_arr.push(new_val)
    }
    return 3
    console.log(clone_arr)
}

map([1,2,3,4], function(val){
    console.log(val*2)
    return val * 2;
}); //[2,4,6,8]
