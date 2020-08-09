const weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
const today = new Date();
const dd = weekdays[today.getDay()]
const hh = today.getHours() % 12
const period = ((today.getHours() <= 12) ? 'AM' : 'PM')
const sec = today.getSeconds()
const milSec = Math.floor(today.getMilliseconds() / 10)

console.log(`Today is : ${dd}. \n Current time is ${hh} : ${period} : ${sec} : ${milSec}`);
