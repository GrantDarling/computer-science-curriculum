const notificationAtStart = ['test message 1']

const getId = () => (100000 * Math.random()).toFixed(0)

const asObject = (notification) => {
  return {
    content: `You just added ${notification}`,
    id: getId()
  }
}

const initialState = notificationAtStart.map(asObject)

const reducer = (state = initialState, action) => {
  console.log('state now: ', state)
  console.log('action', action)
  switch(action.type) {
      case 'ADD_NOTIFICATION':
        const newNotification = { content: `You just added ${action.data.content}`, id: getId() }
        return [...state, newNotification]
      case 'REMOVE_NOTIFICATION':
	const filteredNotifications = state.filter((_, index) => index !== 0)
	return filteredNotifications
      default:
        return state
    }
}

export const addNotification = (content) => {
  return {
    type: 'ADD_NOTIFICATION',
    data: {
      content
    }
  }
}

export const removeNotification = (content) => {
  return {
    type: 'REMOVE_NOTIFICATION',
    data: {
      content
    }
  }
}



export default reducer