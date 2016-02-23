class Customer < ActiveRecord::Base
  validates :name,  presence:   true, length: { minimum: 4 }
  validates :email, uniqueness: { case_sensitive: true }
  validates_format_of :email, with: /\A[^@]+@[^@]+\z/
end
