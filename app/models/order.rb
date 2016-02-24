class Order < ActiveRecord::Base
  has_many :foods_orders
  has_many :foods, :through => :foods_orders

  belongs_to :waiter
  belongs_to :customer
  belongs_to :table

  validates :waiter, :presence => true
  validates :customer, :presence => true
  validates :table, :presence => true

  def total_price
    foods.sum(:price)
  end
end
