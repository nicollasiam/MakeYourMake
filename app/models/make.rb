class Make < ApplicationRecord
  include FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :images, inverse_of: :make, dependent: :destroy
  has_many :make_types, dependent: :destroy
  has_many :types, through: :make_types, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :liked_makes, dependent: :destroy

  # This allows nested forms. We need it to be able
  # to load images on make creating.
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  validates :name, :description, presence: true

  ###### Validations ######

  # name
    # Presença
    # Máximo de 40 caracteres

  # description
    # Presença

  private

  def should_generate_new_friendly_id?
    name_changed?
  end
end





