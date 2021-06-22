import React, { useState, useEffect } from 'react'
import Blog from './components/Blog'
import blogService from './services/blogs'
import loginService from './services/login' 
import PropTypes from 'prop-types'

const LoginForm = (props) => {
  return (
    <div>
      <h2>Login</h2>
      <form onSubmit={props.handleSubmit}>
        <div>
          username
          <input
            id='username'
            value={props.username}
            onChange={props.onChangeUsername}
            name="username"
          />
        </div>
         password
          <input
            id='password'
            value={props.password}
            onChange={props.onChangePassword}
            name="password"
          />
        <button id="login-button" type="submit">login</button>
      </form>
    </div>
  )
}

const CreateBlogForm = (props) => {
  return (
      <form onSubmit={props.addBlog}>
          <input 
            id='title'
            type="text"
            placeholder="title"
            value={props.title}
            onChange={props.onChangeTitle} />
            <input 
            id='author'
            type="text"
            placeholder="author"
            value={props.uthor}
            onChange={props.onChangeAuthor} />
            <input 
            id='url'
            type="text"
            placeholder="url"
            value={props.url}
            onChange={props.onChangeUrl} />
        <button id='save' type="submit">save</button>
      </form>  
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

  return (
    <div className="blog">
      <h2>blogs</h2>
      {blogs.map(blog =>
        <Blog key={blog.id} blog={blog} />
      )}
      {/* <h7>{user.name} logged in</h7> */}
      <button onClick={() => logOut()}>log out</button>
      <CreateBlogForm
        onChangeTitle={onChangeTitle}
        onChangeAuthor={onChangeAuthor}
        onChangePassword={onChangePassword}
        onChangeUrl={onChangeUrl}
        addBlog={addBlog} />
    </div>
  )
}

  LoginForm.propTypes = {
    password: PropTypes.string.isRequired
  } 


export default App