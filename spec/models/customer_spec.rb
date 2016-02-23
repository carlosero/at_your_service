require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "#initialize" do
    it "should generate invalid customer" do
      customer = Customer.new
      expect(customer).to be_invalid
    end
  end

  it "should be valid with a valid data" do
    customer = FactoryGirl.create('customer')
    expect(customer.id).to eq(Customer.last.id)
  end

  it "should have a valid email" do
    customer = FactoryGirl.create('customer')
    customer.email = 'test'
    expect(customer).to be_invalid
  end

  it "should have unique email" do
    customer = FactoryGirl.create('customer')
    expect(Customer.new(name: 'Foo Bar', email: customer.email)).to be_invalid
  end

end
