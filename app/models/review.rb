class Review < ApplicationRecord
  belongs_to :make
  belongs_to :user

  validates :content, :score,  presence: true

  ###### Validations ######

  # title
    # Máximo de 20 caracteres

  # content
    # Presença

end






