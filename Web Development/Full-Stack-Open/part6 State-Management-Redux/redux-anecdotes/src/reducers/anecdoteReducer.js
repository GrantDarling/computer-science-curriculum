import service from '../services/anecdotes'

const reducer = (state = [], action) => {
  console.log('state now: ', state)
  console.log('action', action)
  switch(action.type) {
      case 'INIT':
        return action.data
      case 'CAST_VOTE':
        const filteredAnecdote = state.filter(anecdote => anecdote.id !== action.data.content.id);
        return [ ...filteredAnecdote, action.data.content].sort((a, b) => b.votes - a.votes)
      case 'ADD_ANCEDOTE':
        return [...state, action.data]
      default:
        return state
    }
}

export const initialize = () => {
  return async dispatch => {
    const data = await service.getAll()
    dispatch({
      'type': 'INIT',
      data,
    })
  }
}

export const castVote = (content) => {
  return async dispatch => {
    const data = await service.updateVotes(content)
    dispatch({
      'type': 'CAST_VOTE',
      data
    })
  }
}

export const addAncedote = (content) => {
  return async dispatch => {
    const newAncedote = await service.createNew(content)
    dispatch({
      type: 'ADD_ANCEDOTE',
      data: newAncedote
    })
  }
}

export default reducer