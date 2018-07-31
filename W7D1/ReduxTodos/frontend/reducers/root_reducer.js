import {combineReducers} from 'redux';
import todosReducer from './todos_reducer.js';

const rootReducer = combineReducers({
  todos: todosReducer,
  todos2: todosReducer
});

export default rootReducer;
