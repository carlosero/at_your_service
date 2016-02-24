json.array!(@waiters) do |waiter|
  json.extract! waiter, :id, :name, :phone, :email
  json.url waiter_url(waiter, format: :json)
end
