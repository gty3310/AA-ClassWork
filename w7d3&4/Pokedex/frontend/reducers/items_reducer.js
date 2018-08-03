import React from 'react';
import ReactDOM from 'react-dom';
import merge from 'lodash/merge';
import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON,
  receiveAllPokemon, requestAllPokemon } from '../actions/pokemon_actions';

const itemsReducer = (state = {}, action) => {
  switch(action.type){
    case RECEIVE_SINGLE_POKEMON:
      return action.payload.items;
    default:
      return state;
    }
};

export default itemsReducer;
