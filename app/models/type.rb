class Type < ApplicationRecord
  include FriendlyId
  friendly_id :name

  has_many :make_types
end
