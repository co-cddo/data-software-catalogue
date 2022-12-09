class SoftwareInstance < ApplicationRecord
  belongs_to :organisation

  validates :organisation_group, :team, :product, :provider, :description, :status, presence: true
end
