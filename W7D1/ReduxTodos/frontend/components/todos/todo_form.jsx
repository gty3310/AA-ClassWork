import React from 'react';
import {uniqueId} from '../../util/api_util.js';

class TodoForm extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      inputVal: ""
    };
    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput(event){
    this.setState({inputVal: event.target.value});
  }

  handleSubmit(event){
    event.preventDefault();
    let newTodo = {
      id: uniqueId(),
      title: this.state.inputVal,
      body: "test",
      done: false
    };
    this.props.receiveTodo(newTodo);
    this.setState({inputVal: ""});
  }
  render(){
    return (
      <div>
        <input value ={this.state.inputVal} onChange={this.handleInput} ></input>
        <button onClick={this.handleSubmit}>Add TODO Item</button>
      </div>
    );
  }
}

export default TodoForm;
