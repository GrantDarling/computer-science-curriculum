import anecdoteService from './services/anecdotes'
import anecdoteReducer from './reducers/anecdoteReducer'
import notificationsReducer from './reducers/notificationReducer'
import { composeWithDevTools } from 'redux-devtools-extension'
import { createStore, combineReducers } from 'redux'

const reducer = combineReducers({
  anecdotes: anecdoteReducer,
  notifications: notificationsReducer
})

const store = createStore(
  reducer,
  composeWithDevTools()
)

anecdoteService.getAll().then(anecdotes =>
  anecdotes.forEach(anecdote => {
    store.dispatch({ type: 'ADD_ANCEDOTE', data: anecdote })
  })
)

console.log(store.getState())

export default store