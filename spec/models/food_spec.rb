require 'rails_helper'

RSpec.describe Food, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:food)).to be_valid
    expect(FactoryGirl.build(:dish)).to be_valid
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

  it "is invalid without a price" do
    expect(FactoryGirl.build(:food, price: nil)).to be_invalid
  end

  it "is invalid with a price lower than 0.01" do
    expect(FactoryGirl.build(:food, price: 0)). to be_invalid
    expect(FactoryGirl.build(:food, price: -10)). to be_invalid
  end

  describe do
    before do
      @dishes = []
      @drinks = []
      @dishes << FactoryGirl.create(:dish)
      @dishes << FactoryGirl.create(:dish)
      @drinks << FactoryGirl.create(:drink)
      @drinks << FactoryGirl.create(:drink)
    end
    context "dishes" do
      it "returns only dishes" do
        expect(Food.dishes).to eq(@dishes)
      end
    end
    context "drinks" do
      it "returns only drinks" do
        expect(Food.drinks).to eq(@drinks)
      end
    end
  end

end
