class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user

    mail(to: @user.email, subject: 'Bem-vindo(a) ao MakeYourMake')
  end
end
