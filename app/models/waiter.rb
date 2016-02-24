class Waiter < ActiveRecord::Base
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates_format_of :email, with: /\A[^@]+@[^@]+\z/
end
