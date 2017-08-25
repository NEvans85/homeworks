class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url = 'http://default.duh/login'
    mail(to: "#{user.username} <#{user.email}>",
         subject: 'Generic welcome message!!')
  end
end
