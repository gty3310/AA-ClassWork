import {RECEIVE_TODO, RECEIVE_TODOS, receiveTodo, receiveTodos} from '../actions/todo_actions';
import _ from 'lodash';


const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};


const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_TODOS:
      return arrayToObject(action.todos);
    case RECEIVE_TODO:
      // let object = {};
      // object[action.todo.id] = action.todo;
      let object = {[action.todo.id]: action.todo};
      return _.merge({}, state, object);
      // return Object.assign({}, state, object);

    default:
      return state;
  }
};

const arrayToObject = (todos)=>{
  let object = {};
  todos.forEach(el => {
    object[el.id] = el;
  });
  return object;
};

const todoToObject = (todo) => {
  let id = todo.id;
        return {id: todo};
};
window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;
export default todosReducer;
