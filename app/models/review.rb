class Review < ApplicationRecord
  belongs_to :make
  belongs_to :user

  validates :content, :score,  presence: true

end






