import React from 'react'
import '@testing-library/jest-dom/extend-expect'
import { render } from '@testing-library/react'
import Blog from './Blog'

test('renders content', () => {
  const blog = {
    title: 'Component testing is done with react-testing-library',
    author: 'Grant Darling',
    url: 'url not shown',
    likes: 'likes not shown'
  }

  const component = render(
    <Blog blog={blog} />
  )

  expect(component.container).toHaveTextContent(
    'Component testing is done with react-testing-library'
  )

  expect(component.container).toHaveTextContent(
    'Grant Darling'
  )

  expect(component.container).not.toHaveTextContent(
    'url not shown'
  )
 expect(component.container).not.toHaveTextContent(
    'likes not shown'
  )

  // component.debug()

  
})