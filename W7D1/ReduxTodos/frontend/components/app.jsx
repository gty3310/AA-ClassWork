import React from 'react';
import TodoListContainer from './todos/todo_list_container.jsx';

class App extends React.Component {
  constructor(props){
    super(props);
  }
  render(){
    return(
      <TodoListContainer />
    );
  }
}
//call TodoListContainer (receives props from the provider?)
export default App;
