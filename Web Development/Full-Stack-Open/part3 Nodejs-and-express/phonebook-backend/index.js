const express = require('express')
const morgan = require('morgan')
const app = express()
const cors = require('cors')
const Person = require('./models/persons')

// frontend build
//app.use(express.static('build'))

// cross origin 
app.use(cors());

// body parser
app.use(express.json());
app.use(express.urlencoded({
  extended: true
}));

// morgan logger
morgan.token('posted', function (req, res) { return req.posted })
app.use(morgan(':method :url :status :res[content-length] - :response-time ms :posted'))

let persons = [
  {
    id: 1,
    name: "Arto Hellas",
    number: "040-123456",
  },
  {
    id: 2,
    name: "Ada Lovelace",
    number: "89-32-543211",
  },
  {
    id: 3,
    name: "Dan Abramov",
    number: "12-43-234234",
  },
  {
    id: 4,
    name: "Mary Poppendick",
    number: "39-23-6423122",
  }  
]

// Connect DB

// routes 
app.get('/persons', (req, res) => {
    Person.find({}).then(persons => {
      res.json(persons)
    })
})

app.get('/persons/:id', (req, res) => {
  const id = Number(req.params.id)
  const person = persons.find(person => person.id === id)

  if (person) {
    res.json(person)
  } else {
    res.status(404).end()
  }
})

app.get('/info', (req, res) => {
    const totalPersons = Object.keys(persons).length
    res.send(`<p>total people in phonebook: ${totalPersons.toString()}</p>
              <p> ${Date().toLocaleString()} </p>`);
})

app.delete('/persons/:id', (req, res) => {
    const id = Number(req.params.id);
    persons = persons.filter(person => person.id !== id)

    res.status(204).end();
})

app.post('/persons/', (req, res, next) => {
    req.posted = JSON.stringify(req.body)
    next()
  }, (req, res) => {
    const person = req.body
    person["id"] = Math.floor(Math.random() * 10000)
    const nameExists = persons.find(person => person.name === req.body.name)

    if(person.name === undefined || person.number === undefined || nameExists) {
      res.status(400).send({ error: 'name must be unique' });
    } else {
      persons = persons.concat(person)
      res.sendStatus(200);
    }
    
})

const PORT = process.env.PORT || 3001
app.listen(PORT, () => { console.log(`Server running on port ${PORT}`) })
