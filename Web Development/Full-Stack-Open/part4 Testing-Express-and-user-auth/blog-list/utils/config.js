require('dotenv').config()

const mongoUrl = process.env.MONGO_URI
const PORT = 3003

module.exports = {
  mongoUrl,
  PORT
}