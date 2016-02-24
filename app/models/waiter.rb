class Waiter < ActiveRecord::Base
  has_many :orders
  has_many :tables, :through => :orders

  scope :active, -> { where(active: true) }
  scope :deactivated, -> { where(active: false) }

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates_format_of :email, with: /\A[^@]+@[^@]+\z/

  def current_tables
    orders.active.map(&:table)
  end

  def deactivate!
    self.active = false
    save
  end
end
