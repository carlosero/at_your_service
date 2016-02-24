class Table < ActiveRecord::Base
  scope :availables, -> { where(in_use: false) }
  scope :in_use, -> { where(in_use: true) }

  validates :in_use, :inclusion => [true, false]
end
