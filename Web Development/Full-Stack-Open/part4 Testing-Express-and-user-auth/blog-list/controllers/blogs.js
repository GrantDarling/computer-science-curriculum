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

module.exports = blogRouter
