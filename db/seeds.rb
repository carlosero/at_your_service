9.times { FactoryGirl.create(:table) }

15.times { FactoryGirl.create(:food) }
5.times { FactoryGirl.create(:drink) }

10.times { FactoryGirl.create(:waiter); FactoryGirl.create(:customer) }

tables = Table.all
foods = Food.foods
drinks = Food.drinks
waiters = Waiter.all
customers = Customer.all

1.upto(70) do |day|
  1.upto(rand(10)) do
    table = tables.sample
    foods_to_add = foods.sample(rand(foods.count))
    drinks_to_add = drinks.sample(rand(drinks.count))
    order = FactoryGirl.create(:order, table: table, status: 'finished', waiter: waiters.sample, customer: customers.sample)
    order.foods << foods_to_add
    order.foods << drinks_to_add
    FoodsOrder.where(id: order.foods_orders.pluck(:id)).update_all(created_at: Time.now - day.days)
    order.created_at = Time.now - day.days
    order.save
  end
end

1.upto(5) do
  table = tables.sample
  foods_to_add = foods.sample(rand(foods.count))
  drinks_to_add = drinks.sample(rand(drinks.count))
  order = FactoryGirl.create(:order, table: table, waiter: waiters.sample)
  order.foods << foods_to_add
  order.foods << drinks_to_add
  order.save
  table.in_use = true
  table.save
end

Admin.create(email: "admin@example.com", password: "12345678")
