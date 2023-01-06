class Organisation < ApplicationRecord
  has_many :users
  has_many :software_instances

  validates :name, :tag, presence: true
  validates(
    :tag,
    uniqueness: true,
    format: {
      with: /\A[a-zA-Z0-9][\w\-]*[a-zA-Z0-9]\z/,
      message: 'must not have spaces but can be split with hyphens or underscores'
    }
  )

  def to_param
    tag
  end
end
