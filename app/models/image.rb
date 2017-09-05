class Image < ApplicationRecord
  belongs_to :make

  mount_uploader :image_url, ImageUploader

  validates :image_url, presence: true
end





