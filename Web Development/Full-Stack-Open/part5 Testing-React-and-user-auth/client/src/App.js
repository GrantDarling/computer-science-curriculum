import React, { useState, useEffect } from 'react'
import Blog from './components/Blog'
import blogService from './services/blogs'
import loginService from './services/login' 

const LoginForm = (props) => {
  return (
    <div>
      <h2>Login</h2>
      <form onSubmit={props.handleSubmit}>
        <div>
          username
          <input
            value={props.username}
            onChange={props.onChangeUsername}
            name="username"
          />
        </div>
         password
          <input
            value={props.password}
            onChange={props.onChangePassword}
            name="password"
          />
        <button type="submit">login</button>
      </form>
    </div>
  )
}


const App = () => {
  const [blogs, setBlogs] = useState([])
  const [username, setUsername] = useState('') 
  const [password, setPassword] = useState('') 
  const [errorMessage, setErrorMessage] = useState(null)
  const [user, setUser] = useState(null) 
  const [title, setTitle] = useState('') 
  const [author, setAuthor] = useState('') 
  const [url, setUrl] = useState('') 
  const [loginVisible, setLoginVisible] = useState(false)

  useEffect(() => {
    blogService.getAll().then(blogs =>
      setBlogs( blogs )
    )
  }, [])

  useEffect(() => {
    const loggedUserJSON = window.localStorage.getItem('loggedBlogAppUser')
      if (loggedUserJSON) {
        const user = JSON.parse(loggedUserJSON)
        setUser(user)
        blogService.setToken(user.token)
      }
  }, [])

  const onChangeUsername = (e) => {
    setUsername(e.target.value)
  }

  const onChangePassword = (e) => {
    setPassword(e.target.value)
  }

  const onChangeTitle = (e) => {
    setTitle(e.target.value)
  }

  const onChangeAuthor = (e) => {
    setAuthor(e.target.value)
  }

  const onChangeUrl = (e) => {
    setUrl(e.target.value)
  }

  const onSubmit = async (e) => {
    e.preventDefault();
    console.log(`${username}, ${password}`)

    try {
      const user = await loginService.login({username, password})

      window.localStorage.setItem(
        'loggedBlogAppUser', JSON.stringify(user)
      ) 
      blogService.setToken(user.token)
      setUser(user)
      setUsername('')
      setPassword('')
    } catch (exception) {
      setErrorMessage('Wrong credentials')
      console.log(errorMessage)
      setTimeout(() => {
        setErrorMessage(null)
      }, 5000)
    }
  }

  const logOut = () => {
    setUser(null); 
    window.localStorage.removeItem('loggedBlogAppUser');
  }

  if (user === null) {
    const hideWhenVisible = { display: loginVisible ? 'none' : '' }
    const showWhenVisible = { display: loginVisible ? '' : 'none' }

    return (
      <div>
        <div style={hideWhenVisible}>
          <button onClick={() => setLoginVisible(true)}>log in</button>
        </div>
        <div style={showWhenVisible}>
          <LoginForm
            username={username}
            password={password}
            handleUsernameChange={({ target }) => setUsername(target.value)}
            handlePasswordChange={({ target }) => setPassword(target.value)}
            handleSubmit={onSubmit}
            onChangeUsername={onChangeUsername}
            onChangePassword={onChangePassword}
          />
          <button onClick={() => setLoginVisible(false)}>cancel</button>
        </div>
      </div>
    )
  }

  const addBlog = async (e) => {
    e.preventDefault();
    console.log(`${title}, ${author}, ${url}`)

    try {
      await blogService.create({title, author, url})

      setTitle('')
      setAuthor('')
      setUrl('')
      const blogs = await blogService.getAll()
      setBlogs( blogs )
    } catch (exception) {
      setErrorMessage('Wrong credentials')
      console.log(errorMessage)
      setTimeout(() => {
        setErrorMessage(null)
      }, 5000)
    }   
  }

    const loginForm = () => {

  }

  return (
    <div>
      <h2>blogs</h2>
      {blogs.map(blog =>
        <Blog key={blog.id} blog={blog} />
      )}
      {/* <h7>{user.name} logged in</h7> */}
      <button onClick={() => logOut()}>log out</button>
      <form onSubmit={addBlog}>
          <input 
            type="text"
            placeholder="title"
            value={title}
            onChange={onChangeTitle} />
            <input 
            type="text"
            placeholder="author"
            value={author}
            onChange={onChangeAuthor} />
            <input 
            type="text"
            placeholder="url"
            value={url}
            onChange={onChangeUrl} />
        <button type="submit">save</button>
      </form>  
    </div>
  )
}

export default App