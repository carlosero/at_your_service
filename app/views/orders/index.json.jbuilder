json.array!(@orders) do |order|
  json.extract! order, :id, :waiter_id, :customer_id, :table_id
  json.url order_url(order, format: :json)
end
