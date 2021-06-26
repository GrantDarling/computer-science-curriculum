import anecdoteService from './services/anecdotes'
import anecdoteReducer from './reducers/anecdoteReducer'
import notificationsReducer from './reducers/notificationReducer'
import { composeWithDevTools } from 'redux-devtools-extension'
import { createStore, combineReducers, applyMiddleware } from 'redux'
import thunk from 'redux-thunk'


const reducer = combineReducers({
  anecdotes: anecdoteReducer,
  notifications: notificationsReducer
})

const store = createStore(
  reducer,
  composeWithDevTools(
        applyMiddleware(thunk)
  )
)

console.log(store.getState())

export default store