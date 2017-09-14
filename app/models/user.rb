class User < ApplicationRecord
  include FriendlyId
  friendly_id :artistic_name

  after_create :send_welcome_email

  has_many :makes
  has_many :reviews
  has_many :liked_makes
  has_one :address
  has_one :telephone_number

  # We need this becouse addresses and telephone numbers are in another model
  # They are not a column in users table
  accepts_nested_attributes_for :address, :telephone_number

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

 private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end




