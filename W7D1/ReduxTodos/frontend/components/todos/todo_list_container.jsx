//this is where we left off
import {connect} from 'react-redux';
import TodoList from './todo_list.jsx';
import {receiveTodo, receiveTodos} from '../../actions/todo_actions';
import allTodos from '../../reducers/selectors.js';

const mapStateToProps = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
