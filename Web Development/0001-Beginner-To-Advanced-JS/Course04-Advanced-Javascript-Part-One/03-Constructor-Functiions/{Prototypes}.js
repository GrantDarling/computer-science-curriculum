var Vehicle = function(make, model, year) {
    this.make = make
    this.model = model
    this.year = year
    this.isRunning = true;
}

Vehicle.prototype.turnOff = function() {
    this.isRunning = false
};

Vehicle.prototype.turnOn = function() {
    this.isRunning = true
};

Vehicle.prototype.honk = function() {
    if(this.isRunning == true) return "beep!"
};

var car = new Vehicle("f15", "ford", 1996);

console.log(car.isRunning)
console.log(car.turnOff())
console.log(car.isRunning)
console.log(car.honk())
console.log(car.turnOn())
console.log(car.honk())

