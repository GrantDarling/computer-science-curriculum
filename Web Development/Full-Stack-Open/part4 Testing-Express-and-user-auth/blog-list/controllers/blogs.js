const blogRouter = require('express').Router()
const express = require('express')
const Blog = require('../models/blogs')

blogRouter.use(express.json())

blogRouter.get('/', (request, response) => {
  Blog
    .find({})
    .then(blogs => {
      response.json(blogs)
    })
})

blogRouter.post('/', async (request, response) => {
  let blog = new Blog(request.body)
  if (blog.likes === undefined) 
    blog.likes = 0;

  try {
    if(blog.url === undefined && blog.title === undefined) 
      throw error
    
    const result = await blog.save()
    response.status(201).json(result) 

  } catch (error) {
    response.status(400).json(error)
  }
})

blogRouter.delete('/:id', async (request, response, next) => {
  try {
    await Blog.findByIdAndRemove(request.params.id)
    response.status(204).end() 
  } catch (error) {
    next(error)
  }
})

blogRouter.get('/:id', (request, response, next) => {
  Blog.findById(request.params.id)
    .then(blog => {
      if (blog) {
        response.json(blog.toJSON())
      } else {
        response.status(404).end()
      }
    })
    .catch(error => next(error))
})

blogRouter.put('/:id', async (request, response, next) => {

  try {
    const body = request.body
    const blog = {
      "likes": body.likes
    } 

    console.log(blog)

    const updatedBlog = await Blog.findByIdAndUpdate(
      request.params.id, blog, { new: true }
    )
    response.json(updatedBlog.toJSON())
  } catch {
    next(error)
  }
})

module.exports = blogRouter
