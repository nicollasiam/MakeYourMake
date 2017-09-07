require 'file_size_validator'

class Image < ApplicationRecord
  belongs_to :make

  mount_uploader :image_url, ImageUploader

  validates :image_url, presence: true, file_size: { maximum: 0.5.megabytes.to_i, message: 'O tamanho da imagem não deve ultrapassar 500kb' }
end





