class SoftwareInstance < ApplicationRecord
  include PgSearch::Model
  multisearchable against: %i[
    product
    provider
    name
    description
    packages
  ]

  belongs_to :organisation

  # Target validation. At this stage supplied data is incomplete
  # TODO re-enable this validation
  # validates :organisation_group, :team, :product, :provider, :description, :status, presence: true
end
