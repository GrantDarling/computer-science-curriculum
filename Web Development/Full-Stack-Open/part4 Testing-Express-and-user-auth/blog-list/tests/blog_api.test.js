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
    title: 'My Valid Blog',
    author: 'Danny Brown',
    url:
      'www.myURL.com',
    likes: 59,
    __v: 0
  };
 
const blogWithoutLikes = {
    id: '134567867543',
    title: 'My Valid Blog',
    author: 'Danny Brown',
    url:
      'www.myURL.com',
    __v: 0
};

const blogWithoutUrlAndTitle = {
    id: '134567867543',
    author: 'Danny Brown',
    likes: 70,
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

test('blogs can be added', async () => {
  await api
    .post('/api/blogs')
    .send(validBlog)
    .expect(201)
    .expect('Content-Type', /application\/json/)

  const response = await api.get('/api/blogs')

  const titles = response.body.map(r => r.title)

  expect(response.body).toHaveLength(listWithManyBlogs.length + 1)
  expect(titles).toContain(
    'My Valid Blog'
  )
})

test('blog without likes defaults to 0', async () => {
  await api
  .post('/api/blogs')
  .send(blogWithoutLikes)
  
  const response = await api.get('/api/blogs')

  const invalidBlog = response.body.find(r => r.likes === 0)
  expect(invalidBlog.likes).toEqual(0)
})

test('blog without url and title return 404', async () => {
  await api
  .post('/api/blogs')
  .send(blogWithoutUrlAndTitle)
  .expect(400)
})

afterAll(() => {
  mongoose.connection.close()
})