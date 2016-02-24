class FoodsOrder < ActiveRecord::Base
  belongs_to :food
  belongs_to :order

  before_save { |foods_order| foods_order.amount = 1 unless foods_order.amount }

  def total_price
    food.price * amount
  end
end
