import React from 'react';
import {TodoListItem} from './todo_list_item';
//added
import TodoForm from './todo_form';

//class Component
class TodoList extends React.Component{
  render(){
    console.log("i am rendering");
    // let todos = this.props.todos.map(todo => (
    //   <TodoListItem key={todo.id} title={todo.title} />
    //   )
    // );
    return(
      <ul>
        <TodoForm receiveTodo={this.props.receiveTodo}/>
        {this.props.todos.map(todo => (<TodoListItem key={todo.id} title={todo.title} />))}
      </ul>);
    }
}
//should have information from props since Container is connected to the store
export default TodoList;
