class Order < ActiveRecord::Base
  belongs_to :waiter
  belongs_to :customer
  belongs_to :table

  validates :waiter, :presence => true
  validates :customer, :presence => true
  validates :table, :presence => true

  def total_price
    0
  end
end
