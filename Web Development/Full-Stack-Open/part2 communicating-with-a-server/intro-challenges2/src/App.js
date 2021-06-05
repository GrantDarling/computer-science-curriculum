import React from 'react'

const Header = ({ course }) => {
  return (
    <h1>{course.name}</h1>
  )
}

const Total = ({ course }) => {
  const sum = Object.values(course.parts).reduce((acc, part) => acc + part.exercises, 0);
  return(
    <p><b>Number of exercises {sum}</b></p>
  ) 
}

const Part = (props) => {
  return (
    <p>
      {props.part.name} {props.part.exercises}
    </p>    
  )
}

const Content = ({ course }) => {
  return (
    <div>
      {course.parts.map((part) => {
        return <Part key={part.id} part={part} />
    } )}
    </div>
  )
}

const Course = (props) => {
  return (
   <>
      <Header course={props.course} />
      <Content course={props.course} />
  </>
  )
}

const Courses = (props) => {
  return (
    <>
      <Course course={props.courses[0]}/> 
      <Course course={props.courses[1]} /> 
    </>
  )
}
const App = () => {
const courses = [
    {
      name: 'Half Stack application development',
      id: 1,
      parts: [
        {
          name: 'Fundamentals of React',
          exercises: 10,
          id: 1
        },
        {
          name: 'Using props to pass data',
          exercises: 7,
          id: 2
        },
        {
          name: 'State of a component',
          exercises: 14,
          id: 3
        },
        {
          name: 'Redux',
          exercises: 11,
          id: 4
        }
      ]
    }, 
    {
      name: 'Node.js',
      id: 2,
      parts: [
        {
          name: 'Routing',
          exercises: 3,
          id: 1
        },
        {
          name: 'Middlewares',
          exercises: 7,
          id: 2
        }
      ]
    }
  ]
  return (
    <div>
      <Courses courses={courses}/>
      <Total course={courses[1]} />
    </div>
  )
}

export default App;