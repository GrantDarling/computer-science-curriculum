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
  return (
    <>
      {props.filteredCountry().length > 10 
      ? <p>too many countries, please narrow your search</p> 
      : props.filteredCountry().map((country) => {
        return <p key={(country.numericCode + Math.random().toString())}>{country.name}</p>
      })}
    </>
  )
}

const Country = (props) => {
  const country = props.filteredCountry()[0];
  return (
    <>
      <h1>{country.name}</h1>
      <p>capital: {country.capital}</p>
      <p>population: {country.population}</p>
      <h4>languages:</h4>
      <ul>
        {country.languages.map((language) => {
          return <li key={Math.random().toString()}>{language.name}</li>
        })}
      </ul>
      <img src={country.flag} alt="" />
    </>
  )
}

function App() {
  const [countries, setCountries] = useState([])
  const [ filter, setFilter ] = useState('')

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
       {filteredCountry().length !== 1
       ? <CountryList countries={countries} filter={filter} filteredCountry={filteredCountry} />
       : <Country country={countries} filteredCountry={filteredCountry} />}
     </div>
  );
}

export default App;
