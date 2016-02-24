FactoryGirl.define do
  factory :order do
    waiter
    customer
    association :table, factory: :table_in_use
    status :active
    factory :order_with_foods do
      transient do
        foods_count 5
      end

      after(:create) do |order, evaluator|
        create_list(:foods_order, evaluator.foods_count, order: order)
      end
    end
  end

end
