import { useEffect, useState } from 'react';
import axios from 'axios';

const Filter = (props) => {
  const handleFilterChange = (e) => {
    props.setFilter(e.target.value)
  }

  return (
    <p>filter shown with <input value={props.filter} onChange={handleFilterChange} /></p>
  )
}

const CountryList = (props) => {
  const handleClick = (thisCountry) => {
    props.setSelectedCountry(thisCountry)
    props.setShowCountry(true)

  }
  return (
    <>
      {props.filteredCountry().length > 10 
      ? <p>too many countries, please narrow your search</p> 
      : props.filteredCountry().map((country) => {
        return (
          <p key={(country.numericCode + Math.random().toString())}>{country.name}
          <button key={(country.callingCodes + Math.random().toString())} onClick={() => handleClick(country)}>show</button></p>)
      })}
    </>
  )
}

const Country = (props) => {
  const country = props.selectedCountry;
  const [ weather, setWeather ] = useState({ weather_icons: [] });

  useEffect(() => {
    axios
      .get(`http://api.weatherstack.com/current?access_key=${process.env.REACT_APP_API_KEY}&query=${props.selectedCountry.name}`)
      .then(response => {
        setWeather(response.data.current)
        console.log(response.data.current);
    })
  }, [props.selectedCountry.name])
  return (
    <>
      <button onClick={()=> props.setShowCountry(false) }>hide</button>
      <h1>{country.name}</h1>
      <p>capital: {country.capital}</p>
      <p>population: {country.population}</p>
      <h4>languages:</h4>
      <ul>
        {country.languages.map((language) => {
          return <li key={(country.numericCode + Math.random().toString())}>{language.name}</li>
        })}
      </ul>
      <h4>Weather</h4>
      <p>Current Temperature: {weather.temperature} Celcius</p>
      {weather.weather_icons.map((icon, pos) => {
        return <img key={pos} src={icon} alt="" />
      })}
      <p>wind: {weather.wind_speed} mph & {weather.wind_dir} direction</p>
      <br />
      <img src={country.flag} alt="" />
    </>
  )
}

function App() {
  const [countries, setCountries] = useState([])
  const [ filter, setFilter ] = useState('')
  const [ showCountry, setShowCountry] = useState(false)
  const [ selectedCountry, setSelectedCountry ] = useState({})

  useEffect(() => {
    axios
      .get('https://restcountries.eu/rest/v2/all')
      .then(response => {
        setCountries(response.data)
      })
  }, [])

  const filteredCountry = () => {
    return countries.filter(country => (country.name.includes(filter) || country.name.toLowerCase().includes(filter)));
  }

  return(
     <div>
       <h1>find countries</h1>
       <Filter countries={countries} setFilter={setFilter} />
       {showCountry === false
       ? <CountryList countries={countries} filter={filter} filteredCountry={filteredCountry} setShowCountry={setShowCountry} setSelectedCountry={setSelectedCountry} />
       : <Country setShowCountry={setShowCountry} selectedCountry={selectedCountry} />}
     </div>
  );
}

export default App;
