import { combineReducers } from 'redux';
import entitiesReducer from './entities';
import sessionsReducer from './sessions';

export default combineReducers({
  entities: entitiesReducer,
  sessions: sessionsReducer
});
