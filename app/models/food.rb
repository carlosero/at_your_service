class Food < ActiveRecord::Base

  scope :active, -> { where(active: true) }
  scope :deactivated, -> { where(active: false) }
  scope :foods, -> { where(food_type: 'food') }
  scope :drinks, -> { where(food_type: 'drink') }

  has_many :foods_orders
  has_many :orders, :through => :foods_orders

  validates :name, :presence => true
  validates :description, :presence => true
  validates :food_type, :presence => true, :inclusion => ['food', 'drink']
  validates :price, :presence => true, numericality: {:greater_than => 0}

  def deactivate!
    self.active = false
    save
  end
end
