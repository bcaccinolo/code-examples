import React from 'react';
import { connect } from 'react-redux';
import Todo from './todo';

class TodoList extends React.Component {
    render() {
    console.log(this.props);

        return (
            <ul>
                {this.props.todos.map((todo, index) => <Todo key={index} id={index} todo={todo} />)}
            </ul>
        );
    }
}

const mapStateToProps = (state) => {
    return { todos: state.todos }
}

export default connect(mapStateToProps)(TodoList);