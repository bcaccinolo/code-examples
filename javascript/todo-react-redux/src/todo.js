import React from 'react';
import { connect } from 'react-redux';


class Todo extends React.Component {

    render() {
        console.log('rendering todo');
        console.log(this.props);
        return (
            <li>
                <input type='checkbox' ref={ (input) => this.checkbox = input  }
                                       checked={!this.props.todo.isActive && 'checked'}
                                       onChange={ (e) => this.props.onTodoClick(this.props.id) }
                                       />
                {this.props.todo.text}
            </li>
        );
    }

}

const mapDispatchToProps = (dispatch) => {
    return {
        onTodoClick: (id) => {
            dispatch({ type:'CHECK', index: id });
        }
    }
}

export default connect(state => state, mapDispatchToProps)(Todo);