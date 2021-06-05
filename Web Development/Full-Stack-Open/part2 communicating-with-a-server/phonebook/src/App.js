import React, { useState } from 'react'

const Filter = (props) => {
  const handleFilterChange = (e) => {
    props.setFilter(e.target.value)
  }
  return (
    <p>filter shown with <input value={props.filter} onChange={handleFilterChange} /></p>
  )
}

const PersonForm = (props) => {
  const [ newName, setNewName ] = useState('')
  const [ newNumber, setNewNumber ] = useState('')

  const addContact = (e) => {
    e.preventDefault();
    const newContact = { name: newName, number: newNumber }

    props.persons.some( person => person.name === newContact.name ) 
    ? alert(`${newContact.name} has already been added.`)
    : props.setPersons(props.persons.concat(newContact))
    
    setNewName('');
    setNewNumber('');
  }

  const handleNameChange = (e) => {
    setNewName(e.target.value)
  }

  const handleNumberChange = (e) => {
    setNewNumber(e.target.value)
  }

  return (
    <form onSubmit={addContact}>
      <div>
        name:   <input value={newName} onChange={handleNameChange} /> <br />
        number: <input value={newNumber} onChange={handleNumberChange} />
      </div>
      <div>
        <button type="submit">add</button>
      </div>
    </form>
  )
}

const Persons = (props) => {
  const filteredPeople = () => {
    return props.persons.filter(person => {
      return (person.name.includes(props.filter))
    }) 
  }

  return (
  <>
    {filteredPeople().map(person => {
      return <p key={person.name}>{person.name} {person.number}</p> 
    })}
  </>
  )
}

const App = () => {
  const [persons, setPersons] = useState([
    { name: 'Arto Hellas', number: '040-123456' },
    { name: 'Ada Lovelace', number: '39-44-5323523' },
    { name: 'Dan Abramov', number: '12-43-234345' },
    { name: 'Mary Poppendieck', number: '39-23-6423122' }
  ])
  
  const [ filter, setFilter ] = useState('')

  return (
    <div>
      <h2>Phonebook</h2>
      <Filter persons={persons} setFilter={setFilter} />
      <PersonForm persons={persons} setPersons={setPersons} />
      <h2>Numbers</h2>
      <Persons persons={persons} filter={filter} />
    </div>
  )
}

export default App