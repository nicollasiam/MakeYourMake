class Type < ApplicationRecord
  include FriendlyId
  friendly_id :name, use: :slugged

  has_many :make_types

  private

  # def should_generate_new_friendly_id?
  #   name_changed?
  # end
end
