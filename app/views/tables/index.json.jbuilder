json.array!(@tables) do |table|
  json.extract! table, :id, :in_use
  json.url table_url(table, format: :json)
end
