class Table < ActiveRecord::Base
  scope :availables, -> { where(in_use: false) }
  scope :in_use, -> { where(in_use: true) }

  has_many :orders

  validates :in_use, :inclusion => [true, false]

  def current_order
    orders.last if in_use
  end

  def waiter
    current_order.waiter if current_order
  end

  def customer
    current_order.customer if current_order
  end

  def available
    !in_use
  end

end
