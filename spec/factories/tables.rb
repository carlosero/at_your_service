FactoryGirl.define do
  factory :table do
    in_use false
    factory :empty_table do
      in_use false
    end
    factory :table_in_use do
      in_use true
    end
  end

end
