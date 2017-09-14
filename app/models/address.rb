class Address < ApplicationRecord
  belongs_to :user, autosave: true
end
