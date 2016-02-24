class FoodsOrder < ActiveRecord::Base
  belongs_to :food
  belongs_to :order

  def total_price
    food.price * amount
  end
end
