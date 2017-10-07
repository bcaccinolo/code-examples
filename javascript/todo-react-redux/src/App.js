import React, { Component } from 'react';
import { Provider } from 'react-redux';
import store from './store.js';
import TodoList from './todolist';
import AddTodo from './addtodo'
import './App.css';

class App extends Component {
  render() {
    return (
      <Provider store={store} >
      <div className="App">
        <TodoList />
        <AddTodo />
      </div>
      </Provider>
    );
  }
}

export default App;
