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
  it "has a status" do
    expect(FactoryGirl.build(:order, status: nil)).to be_invalid
  end
  it "has a valid status" do
    expect(FactoryGirl.build(:order, status: :test)).to be_invalid
  end
  it "knows its total price" do
    foods = []
    foods << FactoryGirl.create(:food)
    foods << FactoryGirl.create(:food)
    foods << FactoryGirl.create(:drink)

    order = FactoryGirl.create(:order)
    order.foods << foods

    expect(order.total_price).to eq(foods.map(&:price).sum)
  end
  context "knows which orders" do
    before do
      @orders_active = []; @orders_canceled = []; @orders_finished = []
      @orders_canceled << FactoryGirl.create(:order, status: 'canceled')
      @orders_active << FactoryGirl.create(:order, status: 'active')
      @orders_active << FactoryGirl.create(:order, status: 'active')
      @orders_canceled << FactoryGirl.create(:order, status: 'canceled')
      @orders_finished << FactoryGirl.create(:order, status: 'finished')
      @orders_finished << FactoryGirl.create(:order, status: 'finished')
      @orders_finished << FactoryGirl.create(:order, status: 'finished')
    end
    it "are active" do
      expect(Order.active).to eq (@orders_active)
    end
    it "are canceled" do
      expect(Order.canceled).to eq (@orders_canceled)
    end
    it "are finished" do
      expect(Order.finished).to eq (@orders_finished)
    end
  end
end
