import React from 'react';


export default class PokemonDetail extends React.Component {

  componentDidMount(){
    this.props.requestSinglePokemon(this.props.pokeId);
  }

  componentWillReceiveProps(newProps){
    if (newProps.pokeId !== this.props.pokeId){
      this.props.requestSinglePokemon(newProps.match.params.pokemonId);
    }
  }

  render(){
    if (this.props.pokemon === 'undefined') return;
    return(
      <div class="pokemon-detail">
        <figure>
          <img src={this.props.pokemon.image_url}></img>
        </figure>
        <ul>
          <li>
            <h2>{this.props.pokemon.name}</h2>
          </li>
          <li>Type: {this.props.pokemon.poke_type}</li>
          <li>Attack: {this.props.pokemon.attack}</li>
          <li>Defense: {this.props.pokemon.defense}</li>
        </ul>

      </div>
    );
  }
}
