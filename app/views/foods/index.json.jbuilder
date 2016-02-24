json.array!(@foods) do |food|
  json.extract! food, :id, :name, :description, :food_type, :price
  json.url food_url(food, format: :json)
end
