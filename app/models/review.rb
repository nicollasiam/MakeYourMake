class Review < ApplicationRecord
  belongs_to :make
  belongs_to :user
end
