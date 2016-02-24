class Food < ActiveRecord::Base
  scope :dishes, -> { where(food_type: 'dish') }
  scope :drinks, -> { where(food_type: 'drink') }

  validates :name, :presence => true
  validates :description, :presence => true
  validates :food_type, :presence => true
  validates :price, :presence => true, numericality: {:greater_than => 0}
end
