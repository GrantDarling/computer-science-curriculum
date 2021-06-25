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

console.log(store.getState())

export default store