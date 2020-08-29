var Add = require("../app");

// 'describe' is a test suite 
describe("add functionality", function() {
    it("calculates x + y = z", function() {
        expect(Add(10,5)).toEqual(16);
    })

    it("calculates x + y != z", function() {
        expect(Add(10,5)).not.toEqual(15);
    })
})