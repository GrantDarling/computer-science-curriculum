import React, { useState, useEffect } from 'react'
import Blog from './components/Blog'
import blogService from './services/blogs'
import loginService from './services/login' 

const App = () => {
  const [blogs, setBlogs] = useState([])
  const [username, setUsername] = useState('') 
  const [password, setPassword] = useState('') 
  const [errorMessage, setErrorMessage] = useState(null)
  const [user, setUser] = useState(null) 
  const [title, setTitle] = useState('') 
  const [author, setAuthor] = useState('') 
  const [url, setUrl] = useState('') 

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
    return (
      <div>
        <h2>Log in to application</h2>
        <form onSubmit={onSubmit}>
          <p>Name:</p>
          <input 
            type="text"
            placeholder="name"
            value={username}
            onChange={onChangeUsername} />
          <p>Password:</p>
          <input 
            type="text"
            placeholder="password"
            value={password}
            onChange={onChangePassword} /> <br /><br />
          <button>login</button>
        </form>
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
    <div>
      <h2>blogs</h2>
      {blogs.map(blog =>
        <Blog key={blog.id} blog={blog} />
      )}
      <h7>{user.name} logged in</h7>
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