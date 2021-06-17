const dummy = (blogs) => {
  return 1
}

const totalLikes = (blogs) => {
	const likes = blogs.map(blog => blog.likes)
	return likes.reduce((total, acc) => {
		return total + acc
	}, 0)
}

const favouriteBlog = (blogs) => {
	const likes = blogs.map(blog => blog.likes)
	const highestLiked = Math.max(...likes)
	return blogs.filter(blog => blog.likes === highestLiked)
}
module.exports = {
  dummy,
  totalLikes,
  favouriteBlog
}