

const reducer = (state = [], action) => {
  console.log('state now: ', state)
  console.log('action', action)
  switch(action.type) {
      case 'CAST_VOTE':
        const filteredAnecdote = state.filter(anecdote => anecdote.id !== action.data.content.id);
        return [ ...filteredAnecdote, action.data.content].sort((a, b) => b.votes - a.votes)
      case 'ADD_ANCEDOTE':
        return [...state, action.data]
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
    data: content
  }
}



export default reducer