var replaceWith = require("../functions");

// 'describe' is a test suite 
describe("add functionality", function() {
    it("calculates x + y = z", function() {
        expect(replaceWith(10,5)).toEqual(16);
    })

    it("calculates x + y != z", function() {
        expect(replaceWith(10,5)).not.toEqual(15);
    })
})

//Make sure it is case sensitive
//make sure it doesn't accept integers

describe("replace functionality", function() {
    it("takes [a,b,c] replaces 'b' with 'c' = acc", function() {
        expect(replaceWith(['a','b','c'], 'b','c')).toEqual(['a','c','c'])
    });
    it("takes [a,b,c] replaces 'b' with 7 = 'Doesn't work like that.'", function() {
        expect(replaceWith(['a','b','c'], 'b',7)).toEqual("Doesn't work like that.")
    });
})