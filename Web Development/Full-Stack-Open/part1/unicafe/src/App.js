import React, { useState } from 'react'

const Statistic = (props) => {
  return (
    <>
      <p>{props.name} {props.stat}</p>
    </>

  )

}


const Statistics = (props) => {
  if ((props.good || props.neutral || props.bad) === 0) {
    return (
      <>
        <h1>statistics</h1>
        <div>
          no feedback given.
        </div>
      </>
    )
  }

  return (
    <>
      <h1>statistics</h1>
      <Statistic name="good" stat={props.good} />
      <Statistic name="neutral" stat={props.neutral} />
      <Statistic name="bad" stat={props.bad} />    
      <Statistic name="average" stat={props.average} />
      <Statistic name="percentage positive" stat={props.percentage_positive} />
    </>
  )
}

const Button = (props) => {
  return (
    <>
      <button onClick={props.setToValue(props.setGood, props.good)}>good</button>
      <button onClick={props.setToValue(props.setNeutral, props.neutral)}>neutral</button>
      <button onClick={props.setToValue(props.setBad, props.bad)}>bad</button>
    </>
    )
}

function App() {
  const [good, setGood] = useState(0);
  const [neutral, setNeutral] = useState(0);
  const [bad, setBad] = useState(0);

  const setToValue = (setReview, review) => () => {
    setReview(review + 1);
  }

  const average = () => {
    return ((good - bad)/(good + neutral + bad));
  }

  const percentage_positive = () => {
    return (good/(good + neutral + bad)*100); 
  }

   return (
    <div className="App">
      <h1>give feedback</h1>
      <Button good={good} setGood={setGood} neutral={neutral} setNeutral={setNeutral} bad={bad} setBad={setBad} setToValue={(setReview, review) => setToValue(setReview, review)}/>
      <Statistics good={good} neutral={neutral} bad={bad}  average={average()} percentage_positive={percentage_positive()} />
    </div>
  );
 }

export default App;
