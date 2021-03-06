FactoryGirl.define do
  factory :food do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    price { Faker::Commerce.price }
    food_type :food
    factory :drink do
      food_type :drink
    end
  end

end
