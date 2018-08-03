import { Link } from 'react-router-dom';
import React from 'react';

export default class PokemonIndexItem extends React.Component {

  render(){
    const poke = this.props.pokemon;
    return(
      <li className="pokemon-index-item">
    <Link to={`/pokemon/${poke.id}`}>
        <img className="poke-img" src={poke.image_url}></img>
        <span>{poke.name}</span>

    </Link>
    </li>
  );
  }
}
