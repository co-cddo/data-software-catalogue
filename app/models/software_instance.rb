class SoftwareInstance < ApplicationRecord
  belongs_to :organisation

  # Target validation. At this stage supplied data is incomplete
  # TODO re-enable this validation
  # validates :organisation_group, :team, :product, :provider, :description, :status, presence: true
end
