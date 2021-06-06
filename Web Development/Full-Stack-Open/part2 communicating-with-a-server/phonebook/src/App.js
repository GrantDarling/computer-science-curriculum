import React, { useEffect, useState } from 'react';
import personService from './services/persons'

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
  const newContact = { name: newName, number: newNumber, id:'' }

  const addContact = (e) => {
    e.preventDefault();

    props.persons.some( person => person.name === newContact.name ) 
    ? alert(`${newContact.name} has already been added.`)
    : props.setPersons(props.persons.concat(newContact))

    personService
      .create(newContact)
      .then(returnedContacts => {
        props.setPersons(props.persons.concat(returnedContacts))
    })
    
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

  const deletePerson = (id) => {
    if (window.confirm("Delete contact?")) {
      personService.deletePerson(id);
    }
  }

  return (
  <>
    {filteredPeople().map(person => {
      return <p key={person.id}>{person.name} {person.number} <button onClick={() => deletePerson(person.id)}>delete</button></p> 
    })}
  </>
  )
}

const App = () => {

  const [persons, setPersons] = useState([
    { id:'1', name: 'Arto Hellas', number: '040-123456' },
  ])
  
  const [ filter, setFilter ] = useState('')

  useEffect(() => {
    personService
      .getAll()
      .then(initialPersons => setPersons(initialPersons))
  }, [])

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