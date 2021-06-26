import React from 'react'
import { useSelector, useDispatch } from 'react-redux'
import { castVote, addAncedote } from './reducers/anecdoteReducer'
import { addNotification } from './reducers/notificationReducer'

import Notification from './components/Notification'
import anecdoteService from './services/anecdotes'

const AnecdoteList = () => {
  const anecdotes = useSelector(state => state.anecdotes)
  const dispatch = useDispatch()

  const vote = (content) => {
    console.log('vote', content)
    content.votes = content.votes + 1
    dispatch(castVote(content))
  }

  console.log("anecdotes", anecdotes)

  return (
  <>
    {anecdotes.map(anecdote =>
      <div key={anecdote.id}>
        <div>
          {anecdote.content}
        </div>
        <div>
          has {anecdote.votes}
          <button onClick={() => vote(anecdote)}>vote</button>
        </div>
      </div>
    )}
  </>
  )
}

const AnecdoteForm = () => {
    const dispatch = useDispatch()

  const submitAncedote = async (event) => {
    event.preventDefault()
    const content = event.target.ancedote.value
    const getId = () => (100000 * Math.random()).toFixed(0)
    const newAncedote = { content: event.target.ancedote.value, id: getId(), votes: 0 }

    event.target.ancedote.value = ''
    await anecdoteService.createNew(newAncedote)


    dispatch(addAncedote(newAncedote))
    dispatch(addNotification(content))
  }

  return (
    <>
      <h2>create new</h2>
      <form onSubmit={submitAncedote}>
        <div><input name="ancedote" /></div>
        <button>create</button>
      </form>
    </>
  )
}

const App = () => {
  return (
    <div>
      <Notification />
      <h2>Anecdotes</h2>
      <AnecdoteList />
      <AnecdoteForm />
    </div>
  )
}

export default App