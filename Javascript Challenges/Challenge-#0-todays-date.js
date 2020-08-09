const weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']

const today = new Date();
const dd = weekdays[today.getDay()]
const mm = months[today.getMonth()]
const hh = today.getHours() % 12
const period = ((today.getHours() <= 12) ? 'AM' : 'PM')
const sec = today.getSeconds()
const milSec = Math.floor(today.getMilliseconds() / 10)

console.log(`Today is : ${dd}. \n Current time is ${hh} : ${period} : ${sec} : ${milSec}`);
