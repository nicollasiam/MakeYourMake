class Make < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :make_types
  has_many :types, through: :make_types
  has_many :reviews
end
