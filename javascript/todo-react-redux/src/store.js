import { createStore } from 'redux';
var dotProp = require('dot-prop-immutable');

const initialState = () => {
    return { todos: [
                {text: 'todo1', isActive: true},
                {text: 'todo2', isActive: false},
                {text: 'todo3', isActive: true}
            ]
           }
}

const reducer = (state = initialState(), action) => {
    console.log(action);

    let todos = state.todos;

    switch(action.type) {
        case 'CHECK':
            let todo = todos[action.index];
            if(todo.isActive) {
                state = dotProp.set(state, `todos.${action.index}.isActive`, false)
            } else {
                state = dotProp.set(state, `todos.${action.index}.isActive`, true)
            }
            break;
        case 'ADD_TODO':
            let new_todo = {text: action.text, isActive:true};
            state = {...state, todos: [...state.todos, new_todo]};
            break;
        default:
            console.log('nothing to do');
    }

    console.log(state);

    return state;
}

let store = createStore(reducer);

export default store;
