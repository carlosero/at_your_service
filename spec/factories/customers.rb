FactoryGirl.define do
  factory :customer do
    name { Faker::Name.name }
    phone { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
  end

end
