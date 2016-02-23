require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:customer)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:customer, name: nil)).to be_invalid
  end

  it "is invalid without email" do
    expect(FactoryGirl.build(:customer, email: nil)).to be_invalid
  end

  it "is invalid with a wrong email" do
    expect(FactoryGirl.build(:customer, email: 'test.com')).to be_invalid
  end

  it "doest not allow duplicated email" do
    customer = FactoryGirl.create(:customer)
    expect(FactoryGirl.build(:customer, email: customer.email)).to be_invalid
  end

end
