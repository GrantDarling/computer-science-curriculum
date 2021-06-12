const mongoose = require('mongoose');

if (process.argv.length < 5) {
  console.log('Please provide the password and person as an argument: node mongo.js <password> <name> <area> <number?')
  process.exit(1)
}

const password = process.argv[2]

const url = `mongodb+srv://grantdarling:${password}@cluster0.hhlqh.mongodb.net/phonebook-app?retryWrites=true&w=majority`

mongoose.connect(url, { useNewUrlParser: true, useUnifiedTopology: true, useFindAndModify: false, useCreateIndex: true })

const personSchema = new mongoose.Schema({
  name: String,
  date: Date,
  area: Number,
  number: Number,
})

const Person = mongoose.model('person', personSchema)

const person = new Person({
  name: process.argv[3],
  date: new Date(),
  area: process.argv[4],
  number: process.argv[5],
})

person.save().then(result => {
  console.log(`added ${result.name} number ${result.area}-${result.number} to phonebook`)
  mongoose.connection.close()
})