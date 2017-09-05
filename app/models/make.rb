class Make < ApplicationRecord
  belongs_to :user
  has_many :images, inverse_of: :make
  has_many :make_types
  has_many :types, through: :make_types
  has_many :reviews

  # This allows nested forms. We need it to be able
  # to load images on make creating.
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  validates :name, :description, presence: true

end





