require('dotenv').config()

const mongoUrl = process.env.NODE_ENV === 'test' 
  ? process.env.MONGO_TEST_URI
  : process.env.MONGO_URI

const PORT = 3003

module.exports = {
  mongoUrl,
  PORT
}