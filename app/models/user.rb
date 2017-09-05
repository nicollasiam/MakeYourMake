class User < ApplicationRecord
  has_many :makes
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :email, presence: true
  validates :telephone_number, presence: { message: "O seu contato é importante para o usuário :)" }
  validates :email, :telephone_number, uniqueness: true

end




