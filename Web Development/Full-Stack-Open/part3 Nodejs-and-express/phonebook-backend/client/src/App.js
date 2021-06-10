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

const Notification = ({ message, alertType }) => {
  const success = {
    color: 'green',
    fontStyle: 'italic',
    fontSize: 16,
    background: 'grey'
  }

  const error = {
    color: 'red',
    fontStyle: 'italic',
    fontSize: 16,
    background: ''
  }

  if (alertType === '') {
    return null
  } 
  
  if (alertType === "success") {
    return (
      <div style={success}>
       {message}
      </div>
    )
  } 
  
  if (alertType === "error") {
    return (
      <div style={error}>
       {message}
      </div>
    )
  }
}

const PersonForm = (props) => {
  const [ newName, setNewName ] = useState('')
  const [ newNumber, setNewNumber ] = useState('')
  const newContact = { name: newName, number: newNumber, id:'' }

  const updateContact = (id, existingContact) => {
    const updatedPerson = { name: existingContact.name, number: newContact.number}
    const originalPerson = JSON.stringify({ name: existingContact.name, number: existingContact.number})
    console.log(updatedPerson);
    if (window.confirm("Contact already exists, replace the contacts number?")) {
      personService
        .updatePerson(id, updatedPerson)
        .then(() => {
          personService
          .getAll()
          .then(initialPersons => props.setPersons(initialPersons)) 
        })
        .catch((error) => {
          props.setAlertMessage(error);
          props.setAlertType("error");

          setTimeout(function(){ props.setAlertType('') }, 3000);
        })

    } else {
      personService
        .updatePerson(id, originalPerson)
        .catch((error) => {
          console.log(`this: ${error}`)
        })
    }
  }

  const addContact = (e) => {
    e.preventDefault();
    const existingContact = props.persons.find( person => person.name === newContact.name ); 

    props.persons.some( person => person.name === newContact.name ) 
    ? updateContact(existingContact.id, existingContact)
    : personService
        .create(newContact)
        .then(res => {
          props.setPersons(props.persons.concat(newContact))

          props.setAlertMessage(`New contact ${newContact.name} added!`);
          props.setAlertType('success')

          setTimeout(function(){ props.setAlertType('') }, 3000);
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
      return person.name !== undefined 
      ? (person.name.includes(props.filter))
      : ''
    }) 
  }

  return (
  <>
    {filteredPeople().map(person => {
      return <p key={person.id}>{person.name} {person.number} <button onClick={() => props.deletePerson(person.id)}>delete</button></p> 
    })}
  </>
  )
}

const App = () => {

  const [persons, setPersons] = useState([])
  const [ filter, setFilter ] = useState('')
  const [ alertMessage, setAlertMessage ] = useState('')
  const [ alertType, setAlertType ] = useState('')

  const deletePerson = (id) => {
    if (window.confirm("Delete contact?")) {
      personService
      .deletePerson(id)
      .then(() => {
          personService
          .getAll()
          .then(initialPersons => setPersons(initialPersons)) 
      })
    }
  }

  useEffect(() => {
    personService
      .getAll()
      .then(initialPersons => setPersons(initialPersons))
  }, [])

  return (
    <div>
      <Notification message={alertMessage} alertType={alertType} />
      
      <h2>Phonebook</h2>
      <Filter persons={persons} setFilter={setFilter} />
      <PersonForm persons={persons} setPersons={setPersons} setAlertMessage={setAlertMessage} setAlertType={setAlertType} />
      <h2>Numbers</h2>
      <Persons persons={persons} filter={filter} deletePerson={(id) => deletePerson(id)} />
    </div>
  )
}

export default App