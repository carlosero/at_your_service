require 'rails_helper'

RSpec.describe Food, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:food)).to be_valid
    expect(FactoryGirl.build(:drink)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:food, name: nil)).to be_invalid
  end

  it "is invalid without a description" do
    expect(FactoryGirl.build(:food, description: nil)).to be_invalid
  end

  it "is invalid without a food_type" do
    expect(FactoryGirl.build(:food, food_type: nil)).to be_invalid
  end

  it "has a valid food_type" do
    expect(FactoryGirl.build(:food, food_type: 'food')).to be_valid
  end

  it "wont allow invalid food_type" do
    expect(FactoryGirl.build(:food, food_type: 'car')).to be_invalid
  end

  it "is invalid without a price" do
    expect(FactoryGirl.build(:food, price: nil)).to be_invalid
  end

  it "is invalid with a price lower than 0.01" do
    expect(FactoryGirl.build(:food, price: 0)). to be_invalid
    expect(FactoryGirl.build(:food, price: -10)). to be_invalid
  end

  describe do
    before do
      @foods = []
      @drinks = []
      @foods << FactoryGirl.create(:food)
      @foods << FactoryGirl.create(:food)
      @drinks << FactoryGirl.create(:drink)
      @drinks << FactoryGirl.create(:drink)
    end
    context "#foods" do
      it "returns only foods" do
        expect(Food.foods).to eq(@foods)
      end
    end
    context "drinks" do
      it "returns only drinks" do
        expect(Food.drinks).to eq(@drinks)
      end
    end
  end

end
