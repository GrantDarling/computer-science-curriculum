const mongoose = require('mongoose')
const Blog = require('../models/blogs');
const supertest = require('supertest')
const app = require('../app')

const api = supertest(app)

const listWithNoBlogs = [];

const listWithOneBlog = [
  {
    id: '134567867543',
    title: 'My Title',
    author: 'Danny Brown',
    url:
      'www.myURL.com',
    likes: 59,
    __v: 0
  }
];

const listWithManyBlogs = [
{
    id: '134567867543',
    title: 'My Title',
    author: 'Danny Brown',
    url:
      'www.myURL.com',
    likes: 59,
    __v: 0
  },
  {
    id: '134567867543',
    title: 'My Other Title',
    author: 'Thomas Wright',
    url:
      'www.myURL2.com',
    likes: 590,
    __v: 0
  },
  {
    id: '67667898765567890',
    title: 'Clean Code',
    author: 'Robert C. Martin',
    url:
      'http://cleancode.com',
    likes: 12,
    __v: 0
  },
];

const validBlog = {
    id: '134567867543',
    title: 'My Title',
    author: 'Danny Brown',
    url:
      'www.myURL.com',
    likes: 59,
    __v: 0
  };
 
beforeEach(async () => {
  await Blog.deleteMany({});
  const blogs = listWithManyBlogs.map((blog) => new Blog(blog));
  const promiseArray = blogs.map((blog) => blog.save());
  await Promise.all(promiseArray);
});

test('blogs are returned as json', async () => {
  await api
    .get('/api/blogs')
    .expect(200)
    .expect('Content-Type', /application\/json/)
})

test('blogs contain the transformed id', async () => {
    const response = await api.get('/api/blogs')
    
    expect(response.body[0].id).toBeDefined()
})

afterAll(() => {
  mongoose.connection.close()
})