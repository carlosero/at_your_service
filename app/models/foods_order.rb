class FoodsOrder < ActiveRecord::Base
  belongs_to :food
  belongs_to :order
end
