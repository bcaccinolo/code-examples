import React from 'react'
import { connect } from 'react-redux';

class AddTodo extends React.Component {
    render() {
        return (
            <div>
                <h3>Add Todo</h3>

                <form onSubmit={ (e) => this.props.addTodo(e, this.new_todo) }>
                    <input type='text' ref={ (input) => this.new_todo = input } />
                    <input type="submit" value='add' />
                </form>

            </div>
        )
    }
}

const mapDispatchToProps = (dispatch) => {
    return {
        addTodo: (e, new_todo) => {
            e.preventDefault();
            dispatch({type:"ADD_TODO", text: new_todo.value})
            new_todo.value = ''
        }
    }
}

export default connect((state) => state, mapDispatchToProps)(AddTodo);
