class Address < ApplicationRecord
  belongs_to :user, inverse_of: :address, autosave: true

  ###### Validations ######

  # street
    # Presença
    validates :street, presence: { message: 'Rua não deve ser vazia' }, if: :is_professional_user?

  # number
    # Presença
    validates :number, presence: { message: 'Por favor, informe o número do endereço' }, if: :is_professional_user?
    # Apenas númenos positivos maiores que zero
    validates :number, numericality: { greater_than: 0, message: 'Número de endereço inválido' }, if: :is_professional_user?

  # zip_code
    # Presença
    validates :zip_code, presence: { message: 'Por favor, informe o CEP' }, if: :is_professional_user?
    # Verificar correios
    # Verificado no javascript

  # complement
    # Máximo de 50 caracteres
    validates :complement, length: { maximum: 50, message: 'complemento deve ter no máximo 50 caracteres' }, if: :is_professional_user?

  # district
    # Presença
    validates :district, presence: { message: 'Por favor, informe o seu bairro' }, if: :is_professional_user?

  # city
    # Presença
    validates :city, presence: { message: 'Por favor, informe a sua cidade' }, if: :is_professional_user?

  # state
    # Presença
    validates :state, presence: { message: 'Por favor, informe o seu Estado' }, if: :is_professional_user?
    # Apenas letras
    validates :state, inclusion: { in: %w(AC RO RR AP AM PA TO
                                          MT MS DF GO
                                          RJ ES MG SP
                                          SC PR RS
                                          AL BA CE MA PB PE PI RN SE),
                                   message: 'Estado inválido' }, if: :is_professional_user?

    private

    def is_professional_user?
      user.professional
    end
end
