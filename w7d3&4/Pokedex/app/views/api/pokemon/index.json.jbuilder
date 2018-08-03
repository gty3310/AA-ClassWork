@pokemon.each do |pk|
  json.set! pk.id do
    json.extract! pk, :id, :name
    json.image_url asset_path(pk.image_url)
  end
end
