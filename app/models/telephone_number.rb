class TelephoneNumber < ApplicationRecord
  belongs_to :user, autosave: true
end
