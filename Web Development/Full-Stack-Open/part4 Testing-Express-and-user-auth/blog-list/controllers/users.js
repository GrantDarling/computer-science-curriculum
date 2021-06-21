const userRouter = require('express').Router()
const bcrypt = require('bcrypt')
const express = require('express')
const User = require('../models/users')

userRouter.use(express.json())

userRouter.get('/', (request, response) => {
  User
    .find({})
    .then(users => {
      response.json(users)
    })
})

userRouter.post('/', async (request, response) => {
  let body = request.body

  try {
    const saltRounds = 10
    const passwordHash = await bcrypt.hash(body.password, saltRounds)
    
    const user = new User({
    username: body.username,
    name: body.name,
    password: passwordHash,
    })

    const result = await user.save()
    response.status(201).json(result) 
  } catch (error) {
    response.status(400).json(error)
  }
})

// userRouter.delete('/:id', async (request, response, next) => {
//   try {
//     await Blog.findByIdAndRemove(request.params.id)
//     response.status(204).end() 
//   } catch (error) {
//     next(error)
//   }
// })

// userRouter.get('/:id', (request, response, next) => {
//   Blog.findById(request.params.id)
//     .then(blog => {
//       if (blog) {
//         response.json(blog.toJSON())
//       } else {
//         response.status(404).end()
//       }
//     })
//     .catch(error => next(error))
// })

// userRouter.put('/:id', async (request, response, next) => {

//   try {
//     const body = request.body
//     const blog = {
//       "likes": body.likes
//     } 

//     console.log(blog)

//     const updatedBlog = await Blog.findByIdAndUpdate(
//       request.params.id, blog, { new: true }
//     )
//     response.json(updatedBlog.toJSON())
//   } catch {
//     next(error)
//   }
// })

module.exports =userRouter 
