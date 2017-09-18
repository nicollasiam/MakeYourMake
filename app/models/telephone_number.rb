class TelephoneNumber < ApplicationRecord
  belongs_to :user, inverse_of: :telephone_number, autosave: true

  ###### Validations ######

  # ddd
    # Presença
    validates :ddd, presence: { message: 'Por favor, informe o seu DDD' }, if: :is_professional_user?
    # Ser um  na lista fornecida
    validates :ddd, inclusion: { in: [11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22, 24, 27, 28, 31,
                                      32, 33, 34, 35, 37, 38, 41, 42, 43, 44, 45, 46, 47, 48, 49,
                                      51, 53, 54, 55, 61, 62, 63, 64, 65, 66, 67, 68, 69, 71, 73,
                                      74, 75, 77, 79, 81, 82, 83, 84, 85, 86, 87, 88, 89, 91, 92,
                                      93, 94, 95, 96, 97, 98, 99],
                                 message: 'O DDD fornecido não é válido' }, if: :is_professional_user?

  # number
    # Presença
    validates :number, presence: { message: 'Deve ser fornecido um número para contato' }, if: :is_professional_user?
    # Único
    validates :number, uniqueness: { message: 'Número de telefone já cadastrado' }, if: :is_professional_user?
    # Apenas números
    validates :number, format: { with: /\A[0-9]+\Z/, message: 'Telefone deve contar apenas números' }, if: :is_professional_user?
    # 8 dígitos (tel fixo) ou 9 dígitos (celular)
    validates :number, length: { in: 8..9, message: 'O telefone deve ter entre 8 e 9 dígitos' }, if: :is_professional_user?


    private

    def is_professional_user?
      user.professional
    end
end
