class User < ApplicationRecord
  include FriendlyId
  friendly_id :artistic_name, use: :slugged

  after_create :send_welcome_email

  has_many :makes
  has_many :reviews
  has_many :liked_makes
  has_one :address, inverse_of: :user
  has_one :telephone_number, inverse_of: :user
  delegate :is_professional, to: :address

  # We need this becouse addresses and telephone numbers are in another model
  # They are not a column in users table
  accepts_nested_attributes_for :address, :telephone_number, update_only: true, allow_destroy: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook]

  validates :first_name, :last_name, :email, presence: true


  ###### Validations ######

  # email
    # Unico
    validates :email, uniqueness: { case_sensitive: false, message: ' Email já cadastrado' }
    # Válido
    validates :email, email_format: { message: 'Email inválido' }
    # Presença
    validates :email, presence: { message: 'Por favor, informe o email' }

  # password
    # Mínimo de 6 caracteres
    validates :password, length: { minimum: 6, message: 'A senha deve conter pelo menos 6 caracteres' }, on: :create
    # Presença
    validates :password, presence: { message: 'A senha não deve ser vazia'}, on: :create

  # first_name
    # Ser válido (apenas letras)
    validates :first_name, format: { with: /\A[a-zA-Z\s\u00ED\u00CD\u00E1\u00C1\u00E3\u00E2\u00E9\u00C9\u00EA\u00F3\u00D3\u00F5\u00F4\u00D4\u00FA\u00DA]+\Z/,
                                      message: 'Não são permitidos caracteres especiais' }
    # á: \u00E1
    # Á: \u00C1
    # ã: \u00E3
    # â: \u00E2
    # é: \u00E9
    # É: \u00C9
    # ê: \u00EA
    # í: \u00ED
    # Í: \u00CD
    # ó: \u00F3
    # Ó: \u00D3
    # õ: \u00F5
    # ô: \u00F4
    # Ô: \u00D4
    # ú: \u00FA
    # Ú: \u00DA
    # Presença
    validates :first_name, presence: { message: 'O Nome não deve ser vazio' }

  # last_name
    # Ser válido (apenas letras)
    validates :last_name, format: { with: /\A[a-zA-Z\s\u00ED\u00CD\u00E1\u00C1\u00E3\u00E2\u00E9\u00C9\u00EA\u00F3\u00D3\u00F5\u00F4\u00D4\u00FA\u00DA]+\Z/,
                                      message: 'Não são permitidos caracteres especiais' }
    # Presença
    validates :last_name, presence: { message: 'O Sobrenome não deve ser vazio' }

  # artistic_name
    # Ser válido (apenas letras e números)
    validates :artistic_name, format: { with: /\A[a-zA-Z0-9\s\u00ED\u00CD\u00E1\u00C1\u00E3\u00E2\u00E9\u00C9\u00EA\u00F3\u00D3\u00F5\u00F4\u00D4\u00FA\u00DA]+\Z/,
                                      message: 'Não são permitidos caracteres especiais' }, if: :is_professional?
    # Presença apenas se professional: true
    validates :artistic_name, presence: { message: 'Você deve escolher um nome artístico' }, if: :is_professional?
    # Limitar a 20 caracteres
    validates :artistic_name, length: { maximum: 20, message: 'O nome artístico deve ter no máximo 20 caracteres' }, if: :is_professional?
    # Único
    validates :artistic_name, uniqueness: { message: 'O nome artístico que você escolheu já existe' }, if: :is_professional?

  # address (validação normal de presence)
    # Presença apenas se professional: true
    validates :address, presence: { message: 'Deve ser informado um endereço' }, if: :is_professional?
    validates_associated :address, message: 'Um profissional deve cadastrar um endereço', if: :is_professional?

  # telephone_number (validação normal de presence)
    # Presença apenas se professional: true
    validates :telephone_number, presence: { message: 'Deve ser informado um telefone' }, if: :is_professional?
    validates_associated :telephone_number, message: 'Um profissional deve cadastrar um telefone', if: :is_professional?

  # Facebook login

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end




 private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  def is_professional?
    professional
  end

  def should_generate_new_friendly_id?
    artistic_name_changed?
  end
end




