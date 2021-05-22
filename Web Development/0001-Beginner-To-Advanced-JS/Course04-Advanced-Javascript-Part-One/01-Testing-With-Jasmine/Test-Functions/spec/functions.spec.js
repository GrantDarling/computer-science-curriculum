var myFunctions = require("../functions");


//replaceWith function tests

describe("replace functionality", function() {
    it("takes [a,b,c] replaces 'b' with 'c' = acc", function() {
        expect(myFunctions.replaceWith(['a','b','c'], 'b','c')).toEqual(['a','c','c'])
    });

    it("takes [a,b,c] replaces 'b' with 7 = 'Doesn't work like that.'", function() {
        expect(myFunctions.replaceWith(['a','b','c'], 'b',7)).toEqual("Doesn't work like that.")
    });
})
//expand function tests

describe("expanding an array functionality", function() {
    it("takes ['foo','bar'] in 3 iterations", function() {
        expect(myFunctions.expand(['foo','bar'], 3)).toEqual(['foo','bar','foo','bar','foo','bar'])
    });

    it("takes ['foo','bar'] and 3 iterations", function() {
        expect(myFunctions.expand(['1','2', '3'], 3)).toEqual(['1','2', '3','1','2', '3','1','2', '3'])
    });
})

//acceptNumbersOnly function tests
describe("acceptNumbersOnly function", function() {
    it("takes ['foo',1,3,4]", function() {
        expect(myFunctions.acceptNumbersOnly(['foo',1,3,4])).toEqual(false)
    });
    it("takes [10,1,3,4]", function() {
        expect(myFunctions.acceptNumbersOnly([10,1,3,4])).toEqual(true)
    });
    it("takes [NaN,Undefined,3,4]", function() {
        expect(myFunctions.acceptNumbersOnly([NaN,undefined,3,4])).toEqual(false)
    });
    it("takes [NaN,18,3,4]", function() {
        expect(myFunctions.acceptNumbersOnly([NaN,18,3,4])).toEqual(false)
    });
    it("takes [NaN,18,3,function(){alert('hi');}]", function() {
        expect(myFunctions.acceptNumbersOnly([NaN,18,3,function(){alert('hi');}])).toEqual(false)
    });
})


//mergeArrays function tests
describe("mergeArrays function", function() {
    it("takes [[1,3,4],[6,2,40],[50,6,-5,-2]]", function() {
        expect(myFunctions.mergeArrays([[1,3,4],[6,2,40],[50,6,-5,-2]])).toEqual([-5,-2,1,2,3,4,6,6,40,50])
    });
    it("takes [10,1,3,4]", function() {
        expect(myFunctions.mergeArrays([10,1,3,4])).toEqual([1,3,4,10])
    });
    it("takes [NaN,undefined,3,4]", function() {
        expect(myFunctions.mergeArrays([NaN,undefined,3,4])).toEqual('The array can only contain numbers')
    });
    it("takes [NaN,18,3,4]", function() {
        expect(myFunctions.mergeArrays([NaN,18,3,4])).toEqual('The array can only contain numbers')
    });
    it("takes [NaN,18,3,function(){alert('hi');}]", function() {
        expect(myFunctions.mergeArrays([NaN,18,3,function(){alert('hi');}])).toEqual('The array can only contain numbers')
    });
})

//mergeObject function tests
describe("mergeObject function", function() {
    it("takes { a: 1, b: 2 }, { b: 4, c: 5 }", function() {
        expect(myFunctions.mergeObjects({ a: 1, b: 2 }, { b: 4, c: 5 })).toEqual({ a: 1, b: 4, c: 5 })
    });

    it("takes { a: 1, b: 2, f:7 }, { b: 4, c: 5 }", function() {
        expect(myFunctions.mergeObjects({ a: 1, b: 2, f:7 }, { b: 4, c: 5 })).toEqual({ a: 1, b: 4, c: 5, f:7  })
    });

    it("takes { a: 1, b: 2, c: 8}, { b: 4, c: 5, y:0, a:'a'}", function() {
        expect(myFunctions.mergeObjects({ a: 1, b: 2, c: 8}, { b: 4, c: 5, y:0, a:'a'})).toEqual({ a: 'a', b: 4, c: 5, y:0})
    });
})


console.info("\x1b[35m", "CHECK FOOBAR: " + myFunctions.acceptNumbersOnly(['1','2','3'], 3))
