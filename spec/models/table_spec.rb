require 'rails_helper'

RSpec.describe Table, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:table)).to be_valid
    expect(FactoryGirl.build(:table_in_use)).to be_valid
    expect(FactoryGirl.build(:empty_table)).to be_valid
  end
  describe "knows" do
    before do
      FactoryGirl.create(:empty_table)
      FactoryGirl.create(:table_in_use)
      FactoryGirl.create(:table_in_use)
    end
    it "the available tables" do
      expect(Table.availables.count).to eq(1)
    end
    it "the tables in use" do
      expect(Table.in_use.count).to eq(2)
    end
  end

  describe "in use" do
    before do
      @table = FactoryGirl.create(:table_in_use)
      @order = FactoryGirl.create(:order, {table: @table})
      @table.current_order
    end

    it "knows it's order" do
      expect(@table.current_order).to eq(@order)
    end

    it "knows it's customer" do
      expect(@table.customer).to eq(@order.customer)
    end

    it "knows it's waiter" do
      expect(@table.waiter).to eq(@order.waiter)
    end
  end
end
