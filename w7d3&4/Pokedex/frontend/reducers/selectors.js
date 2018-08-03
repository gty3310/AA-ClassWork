

export const selectAllPokemon = (state) => {
  const pokemon = [];
  // debugger
  Object.keys(state.entities.pokemon).forEach(pokeId => {
    const poke = state.entities.pokemon[pokeId];
    pokemon.push(poke);
  });
  return pokemon;
};
