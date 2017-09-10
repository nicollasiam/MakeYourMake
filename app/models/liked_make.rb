class LikedMake < ApplicationRecord
  belongs_to :user
  belongs_to :make
end
