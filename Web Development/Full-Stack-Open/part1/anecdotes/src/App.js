import React, { useState } from 'react'

const App = () => {
  const anecdotes = [
    'If it hurts, do it more often',
    'Adding manpower to a late software project makes it later!',
    'The first 90 percent of the code accounts for the first 90 percent of the development time...The remaining 10 percent of the code accounts for the other 90 percent of the development time.',
    'Any fool can write code that a computer can understand. Good programmers write code that humans can understand.',
    'Premature optimization is the root of all evil.',
    'Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it.',
    'Programming without an extremely heavy use of console.log is same as if a doctor would refuse to use x-rays or blod tests when dianosing patients'
  ]

  const ancedoteVotes = Array.apply(null, new Array(anecdotes.length)).map(Number.prototype.valueOf,0)
   
  const [selected, setSelected] = useState(0)
  const [highest, sethighestVote] = useState(0)
  const [votes, setVotes] = useState(ancedoteVotes)

  const rotateAnecdotes = () => () => {
    setSelected((selected + 1) % anecdotes.length)
  }

  const incrementVotes = () => () => {
    let copyVotes = [...votes]
    copyVotes[selected] += 1;
    setHighestVoted(copyVotes);
    return setVotes(copyVotes);
  }

  const setHighestVoted = (array) => {
    let highestVote = Math.max(...array);
    let indexOfHighestVote = array.indexOf(highestVote)
    return sethighestVote(indexOfHighestVote)
  }

  return (
    <div>
      <h1>Anecdote of The Day</h1> <br />
      {anecdotes[selected]} <br/>
      <p>has {votes[selected]} votes</p>
      <button onClick={incrementVotes()}>vote</button>
      <button onClick={rotateAnecdotes()}>next anecdote</button>
      
      <h1>Ancedote with Most Votes</h1> <br />
      {anecdotes[highest]}
    </div>
  )
}

export default App