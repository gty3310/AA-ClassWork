import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './pokemon/pokemon_index_container';
import PokemonIndex from './pokemon/pokemon_index';
import PokemonDetailContainer from './pokemon/pokemon_detail_container';
import PokemonDetail from './pokemon/pokemon_detail';
import { Route, Switch, Redirect, HashRouter } from 'react-router-dom';


const Root = ({ store }) => (
  <Provider store={store}>
    <HashRouter>
      <div className="pokedex">
        <Route path="/" component={PokemonIndexContainer} />
        <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
      </div>
    </HashRouter>
  </Provider>
);

export default Root;
