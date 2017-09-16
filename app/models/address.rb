class Address < ApplicationRecord
  belongs_to :user, inverse_of: :address, autosave: true

  ###### Validations ######

  # street
    # Presença
    validates :street, presence: { message: 'Rua não deve ser vazia' }, if: :is_professional_user?

  # number
    # Presença
    # Apenas númenos positivos maiores que zero

  # zip_code
    # Presença
    # Verificar correios

  # complement
    # Presença
    # Máximo de 50 caracteres

  # district
    # Presença
    # Apenas letras

  # city
    # Presença
    # Apenas letras

  # state
    # Presença
    # Apenas letras

    private

    def is_professional_user?
      user.professional
    end
end
