import React, { Component } from 'react';
import { BrowserRouter as Router, Link, Route } from 'react-router-dom';
import './App.css';

class  Menu extends Component {
  render() {
    const list = this.props.list;
    return (
      <div className='menu'>
        <ul>
          <li><Link to='/'>Home</Link></li>
          {list.map((e) => <li><Link to={e}>{e}</Link></li>)}
        </ul>
      </div>)
  }
}

const Home = (props) => {
  return (
    <div>Ici la liste des ingrédients</div>
  )
}

const Pizza = (props) => {
  return (
    <div>Ici la bonne recette de la pizza</div>
  )
}

const Kebab = (props) => {
  return (
    <div>Ici la bonne recette de la kebab</div>
  )
}

const Salad = (props) => {
  return (
    <div>Ici la bonne recette de la salad</div>
  )
}

const Main = (props) => {
  return (
    <div className='main'>
      <Route exact path='/' component={Home}/>
      <Route path='/pizza' component={Pizza}/>
      <Route path='/kebab' component={Kebab}/>
      <Route path='/salad' component={Salad}/>
    </div>)
}

class App extends Component {
  state = {list: ['pizza', 'kebab', 'salad']}

  render() {
    const { list } = this.state;
    return (
      <Router>
        <div className="App">
          <Menu list={list}/>
          <Main />
        </div>
      </Router>
    );
  }
}

export default App;
