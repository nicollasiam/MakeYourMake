class User < ApplicationRecord
  after_create :send_welcome_email

  has_many :makes
  has_many :reviews
  has_many :liked_makes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :email, presence: true


 private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end




