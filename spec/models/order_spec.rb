require 'rails_helper'

RSpec.describe Order, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:order)).to be_valid
  end
  it "has a customer" do
    expect(FactoryGirl.build(:order, customer: nil)).to be_invalid
  end
  it "has a waiter" do
    expect(FactoryGirl.build(:order, waiter: nil)).to be_invalid
  end
  it "has a table" do
    expect(FactoryGirl.build(:order, table: nil)).to be_invalid
  end
  it "knows its total price" do
    foods = []
    foods << FactoryGirl.create(:food)
    foods << FactoryGirl.create(:dish)
    foods << FactoryGirl.create(:drink)

    order = FactoryGirl.create(:order)
    order.foods << foods

    expect(order.total_price).to eq(foods.sum{ |food|food.price })
  end
end
