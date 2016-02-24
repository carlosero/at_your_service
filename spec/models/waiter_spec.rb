require 'rails_helper'

RSpec.describe Waiter, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:waiter)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:waiter, name: nil)).to be_invalid
  end

  it "is invalid without email" do
    expect(FactoryGirl.build(:waiter, email: nil)).to be_invalid
  end

  it "is invalid with a wrong email" do
    expect(FactoryGirl.build(:waiter, email: 'test.com')).to be_invalid
  end

  it "doest not allow duplicated email" do
    waiter = FactoryGirl.create(:waiter)
    expect(FactoryGirl.build(:waiter, email: waiter.email)).to be_invalid
  end
end
