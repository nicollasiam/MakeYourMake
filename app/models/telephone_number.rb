class TelephoneNumber < ApplicationRecord
  belongs_to :user, autosave: true

  ###### Validations ######

  # ddd
    # Presença
    # Ser um ddd na lista fornecida
    # Validação de formato de apenas 2 números

  # number
    # Presença
    # Apenas números


end
