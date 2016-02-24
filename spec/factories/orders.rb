FactoryGirl.define do
  factory :order do
    waiter
    customer
    association :table, factory: :table_in_use
  end

end
