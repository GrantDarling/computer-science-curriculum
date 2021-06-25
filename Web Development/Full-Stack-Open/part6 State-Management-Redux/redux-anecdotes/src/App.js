import React from 'react'
import { useSelector, useDispatch } from 'react-redux'
import { castVote, addAncedote } from './reducers/anecdoteReducer'

const AnecdoteForm = (props) => {
    const submitAncedote = (event) => {
    event.preventDefault()
    const content = event.target.ancedote.value
    event.target.ancedote.value = ''
    props.dispatch(addAncedote(content))
  }

  return (
      <form onSubmit={submitAncedote}>
        <div><input name="ancedote" /></div>
        <button>create</button>
      </form>
  )
}

const App = () => {
  const anecdotes = useSelector(state => state)
  const dispatch = useDispatch()

  const vote = (content) => {
    console.log('vote', content)
    content.votes = content.votes + 1
    dispatch(castVote(content))
  }

  return (
    <div>
      <h2>Anecdotes</h2>
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
      <h2>create new</h2>
      <AnecdoteForm dispatch={dispatch} />
    </div>
  )
}

export default App