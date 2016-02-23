require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { FactoryGirl.create('customer') }
  it "should initialize" do
    puts "customer = #{customer.inspect}"
  end
  it "should be valid" do
    puts "customer = #{customer.inspect}"
  end
end
