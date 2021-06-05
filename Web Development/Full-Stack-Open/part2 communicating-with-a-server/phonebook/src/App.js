import React, { useState } from 'react'

const App = () => {
  const [ persons, setPersons ] = useState([
    { name: 'Arto Hellas' }
  ]) 
  const [ newName, setNewName ] = useState('')

  const addContact = (e) => {
    e.preventDefault();
    const newContact = { name: newName }

    persons.some( person => person.name === newContact.name ) 
    ? alert(`${newContact.name} has already been added.`)
    : setPersons(persons.concat(newContact))
    
    setNewName('');
  }

  const handleNameChange = (e) => {
    setNewName(e.target.value)
  }

  return (
    <div>
      <h2>Phonebook</h2>
      <form onSubmit={addContact}>
        <div>debug: {persons[0].name}</div>
        <div>
          name: <input value={newName} onChange={handleNameChange} />
        </div>
        <div>
          <button type="submit">add</button>
        </div>
      </form>
      <h2>Numbers</h2>
      <div>
        {persons.map(person => {
          return <p key={person.name}>{person.name}</p>
        })}
      </div>
    </div>
  )
}

export default App