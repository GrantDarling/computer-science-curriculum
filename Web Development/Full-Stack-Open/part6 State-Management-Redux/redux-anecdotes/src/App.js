import React, { useEffect } from 'react'
import { useSelector, useDispatch } from 'react-redux'
import { castVote, addAncedote } from './reducers/anecdoteReducer'
import { addNotification } from './reducers/notificationReducer'
import { initialize } from './reducers/anecdoteReducer'

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
    event.target.ancedote.value = ''
    await anecdoteService.createNew(content)
    dispatch(addAncedote(content))
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
  const dispatch = useDispatch()
  useEffect(() => {
    dispatch(initialize())
  }, [dispatch])

  return (
    <div>
      <h2>Anecdotes</h2>
      <Notification />
      <AnecdoteList />
      <AnecdoteForm />
    </div>
  )
}

export default App