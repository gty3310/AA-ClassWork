import React from 'react';
import ReactDOM from 'react-dom';
import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON,
  receiveSinglePokemon, requestSinglePokemon,
  receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
import { fetchAllPokemon, fetchSinglePokemon } from './util/api_util';
import configureStore from './store/store';
import { selectAllPokemon } from './reducers/selectors';
import Root from './components/root';
import { HashRouter, Route } from 'react-router-dom';

document.addEventListener('DOMContentLoaded', () => {
  window.RECEIVE_ALL_POKEMON = RECEIVE_ALL_POKEMON;
  window.receiveAllPokemon = receiveAllPokemon;
  window.fetchAllPokemon = fetchAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.selectAllPokemon = selectAllPokemon;
  window.requestSinglePokemon = requestSinglePokemon;
  window.fetchSinglePokemon = fetchSinglePokemon;
  window.receiveSinglePokemon = receiveSinglePokemon;



  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;


  const root = document.getElementById('root');
 ReactDOM.render(<Root store={store}/>, root);
});
