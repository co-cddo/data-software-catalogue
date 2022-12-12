class Organisation < ApplicationRecord
  has_many :users
  has_many :software_instances

  validates :name, presence: true
end
