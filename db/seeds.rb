4.times do
  FactoryGirl.create(:order)
  2.times { FactoryGirl.create(:food) }
  FactoryGirl.create(:drink)
end
3.times { FactoryGirl.create(:order_with_foods) }
2.times { FactoryGirl.create(:empty_table) }
Admin.create(email: "admin@example.com", password: "12345678")