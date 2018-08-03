
export const fetchAllPokemon = () => (
  $.ajax({
    url: '/api/pokemon',
    method: 'GET',
    dataType: 'JSON'
  })
);

export const fetchSinglePokemon = (id) => (
  $.ajax({
    url: `/api/pokemon/${id}`,
    method: 'GET',
    dataType: 'JSON'
  })
);
