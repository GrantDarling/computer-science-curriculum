import React, { useState } from 'react'

const App = () => {
  const [persons, setPersons] = useState([
    { name: 'Arto Hellas', number: '040-123456' },
    { name: 'Ada Lovelace', number: '39-44-5323523' },
    { name: 'Dan Abramov', number: '12-43-234345' },
    { name: 'Mary Poppendieck', number: '39-23-6423122' }
  ])
  const [ newName, setNewName ] = useState('')
  const [ newNumber, setNewNumber ] = useState('')
  const [ filter, setFilter ] = useState('')

  const addContact = (e) => {
    e.preventDefault();
    const newContact = { name: newName, number: newNumber }

    persons.some( person => person.name === newContact.name ) 
    ? alert(`${newContact.name} has already been added.`)
    : setPersons(persons.concat(newContact))
    
    setNewName('');
    setNewNumber('');
  }

  const handleNameChange = (e) => {
    setNewName(e.target.value)
  }

  const handleNumberChange = (e) => {
    setNewNumber(e.target.value)
  }

  const handleFilterChange = (e) => {
    setFilter(e.target.value)
  }

  const filteredPeople = () => {
    return persons.filter(person => {
      return (person.name.includes(filter))
    }) 
  }

  return (
    <div>
      <h2>Phonebook</h2>
      <p>filter shown with <input value={filter} onChange={handleFilterChange} /></p>
      <form onSubmit={addContact}>
        <div>
          name:   <input value={newName} onChange={handleNameChange} /> <br />
          number: <input value={newNumber} onChange={handleNumberChange} />
        </div>
        <div>
          <button type="submit">add</button>
        </div>
      </form>
      <h2>Numbers</h2>
      <div>
        {filteredPeople().map(person => {
          return <p key={person.name}>{person.name} {person.number}</p> 
        })}
      </div>
    </div>
  )
}

export default App