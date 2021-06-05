import React from 'react'

const Header = ({ course }) => {
  return (
    <h1>{course.name}</h1>
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

export default Courses;