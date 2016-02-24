class Customer < ActiveRecord::Base
  scope :active, -> { where(active: true) }
  scope :deactivated, -> { where(active: false) }

  validates :name,  presence:   true, length: { minimum: 4 }
  validates :email, uniqueness: { case_sensitive: true }
  validates_format_of :email, with: /\A[^@]+@[^@]+\z/, :allow_nil => true

  def deactivate!
    self.active = false
    save
  end
end
