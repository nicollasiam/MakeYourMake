class Image < ApplicationRecord
  belongs_to :make

  mount_uploader :image_url, ImageUploader
end
