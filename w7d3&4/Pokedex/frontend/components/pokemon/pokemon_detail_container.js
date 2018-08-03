import React from 'react';
import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { requestSinglePokemon } from '../../actions/pokemon_actions';

const mapStateToProps = (state, myProps) => {
  const pokeId = myProps.match.params.pokemonId;
  return {
    pokeId,
    pokemon: state.entities.pokemon[pokeId],
    items: state.entities.items
  };
};

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: (pokeId) => dispatch(requestSinglePokemon(pokeId))
});


export default connect(mapStateToProps,
  mapDispatchToProps)(PokemonDetail);
