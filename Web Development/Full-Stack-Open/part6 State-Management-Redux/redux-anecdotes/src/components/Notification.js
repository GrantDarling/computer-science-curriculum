import React, { useEffect } from 'react'
import { useSelector, useDispatch } from 'react-redux'
import { removeNotification } from '../reducers/notificationReducer'

const Notification = () => {
    const dispatch = useDispatch()
  const notifications = useSelector(state => state.notifications)
  const style = {
    border: 'solid',
    padding: 10,
    borderWidth: 1
  }

  return (
    <div style={style}>
      {notifications.map(notification => {
        setTimeout(
            function() {
                dispatch(removeNotification(notifications.filter((_,index) => index !== 0)))
            },5000
        ); clearTimeout()
      
        return <div key={notification.id}>{notification.content}</div>
      })}
    </div>
  )
}

export default Notification