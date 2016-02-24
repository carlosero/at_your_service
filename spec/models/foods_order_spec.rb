require 'rails_helper'

RSpec.describe FoodsOrder, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:foods_order)).to be_valid
  end
end
