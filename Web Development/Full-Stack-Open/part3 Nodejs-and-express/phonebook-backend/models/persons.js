const mongoose = require('mongoose');
const password = process.argv[3]

//const url = `mongodb+srv://grantdarling:<password>@cluster0.hhlqh.mongodb.net/phonebook-app?retryWrites=true&w=majority`

const url = process.env.MONGODB_URI

mongoose.connect(url, { useNewUrlParser: true, useUnifiedTopology: true, useFindAndModify: false, useCreateIndex: true })

const personSchema = new mongoose.Schema({
  name: String,
  date: Date,
  area: Number,
  number: Number,
})

personSchema.set('toJSON', {
  transform: (document, returnedObject) => {
    returnedObject.id = returnedObject._id.toString()
    delete returnedObject._id
    delete returnedObject.__v
  }
})

module.exports = mongoose.model('Person', personSchema)
