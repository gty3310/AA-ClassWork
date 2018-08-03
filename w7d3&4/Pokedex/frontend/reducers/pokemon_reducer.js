import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON,
  receiveAllPokemon, requestAllPokemon } from '../actions/pokemon_actions';
import React from 'react';
import ReactDOM from 'react-dom';
import merge from 'lodash/merge';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = merge({}, state);


  switch(action.type){
    case RECEIVE_ALL_POKEMON:
      return action.pokemon;
    case RECEIVE_SINGLE_POKEMON:
      return merge(nextState, {[action.payload.pokemon.id]: action.payload.pokemon});
    default:
      return state;
  }

};

export default pokemonReducer;
