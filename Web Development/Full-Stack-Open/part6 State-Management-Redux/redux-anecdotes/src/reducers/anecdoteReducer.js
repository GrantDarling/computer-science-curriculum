const anecdotesAtStart = [
  'If it hurts, do it more often',
  'Adding manpower to a late software project makes it later!',
  'The first 90 percent of the code accounts for the first 90 percent of the development time...The remaining 10 percent of the code accounts for the other 90 percent of the development time.',
  'Any fool can write code that a computer can understand. Good programmers write code that humans can understand.',
  'Premature optimization is the root of all evil.',
  'Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it.'
]

const getId = () => (100000 * Math.random()).toFixed(0)

const asObject = (anecdote) => {
  return {
    content: anecdote,
    id: getId(),
    votes: 0
  }
}

const initialState = anecdotesAtStart.map(asObject)

const reducer = (state = initialState, action) => {
  console.log('state now: ', state)
  console.log('action', action)
  switch(action.type) {
      case 'CAST_VOTE':
        const filteredAnecdote = state.filter(anecdote => anecdote.id !== action.data.content.id);
        return [ ...filteredAnecdote, action.data.content].sort((a, b) => b.votes - a.votes)
      case 'ADD_ANCEDOTE':
        const newAncedote = { content: action.data.content, id: getId(), votes: 0 }
        return [...state, newAncedote]
      default:
        return state
    }
}

export const castVote = (content) => {
  return {
    type: 'CAST_VOTE',
    data: {
      content
    }
  }
}

export const addAncedote = (content) => {
  return {
    type: 'ADD_ANCEDOTE',
    data: {
      content
    }
  }
}

export default reducer