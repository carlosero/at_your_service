class Order < ActiveRecord::Base
  scope :active,   -> { where(status: 'active')   }
  scope :finished, -> { where(status: 'finished') }
  scope :canceled, -> { where(status: 'canceled') }

  has_many :foods_orders
  has_many :foods, :through => :foods_orders

  belongs_to :waiter
  belongs_to :customer
  belongs_to :table

  validates :waiter, :presence => true
  validates :customer, :presence => true
  validates :table, :presence => true
  validates :status, :presence => true, :inclusion => ['active', 'finished', 'canceled']

  def total_price
    foods.sum(:price)
  end

  def close
    self.status = 'finished'
    table.in_use = false
    table.save
  end
end
