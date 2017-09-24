import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

// a function component
function Coucou(props) {
  return <span>Coucou le monde {props.qui}</span>;
}

// a class component
class Coucou2 extends React.Component {
  render() {
    return (
      <span>Coucou le monde 2</span>
    );
  }
}

class App extends Component {
  render() {
    return (
      <div className="App">
        <div className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h2>Welcome to React</h2>
        </div>
        <p className="App-intro">
          To get started, edit <code>src/App.js</code> and save to reload.
        </p>
        <Coucou qui='tout le monde' />
        <Coucou2 qui='tout le monde' />
      </div>
    );
  }
}

export default App;
