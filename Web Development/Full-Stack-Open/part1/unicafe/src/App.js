import React, { useState } from 'react'

function App() {
  const [good, setGood] = useState(0);
  const [neutral, setNeutral] = useState(0);
  const [bad, setBad] = useState(0);

  const setToValue = (setReview, review) => () => {
    setReview(review + 1);
  }

  const average = () => {
    if( (good + neutral + bad) == 0) return 0;
    return ((good - bad)/(good + neutral + bad));
  }

  const percentage_positive = () => {
    if( (good + neutral + bad) == 0) return 0;
    return (good/(good + neutral + bad)*100); 
  }

   return (
    <div className="App">
      <h1>give feedback</h1>

      <button onClick={setToValue(setGood, good)}>good</button>
      <button onClick={setToValue(setNeutral, neutral)}>neutral</button>
      <button onClick={setToValue(setBad, bad)}>bad</button>
      <h1>statistics</h1>
      <p>good {good}</p>
      <p>neutral {neutral}</p>
      <p>bad {bad}</p>
      <p>average {average()}</p>
      <p>positive {percentage_positive()}%</p>
    </div>
  );
 }
 

export default App;
