class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

   def welcome_email(user)
    @user = user
    @url  = 'https://mattvoorhees.com'
    mail(to: user.username, subject: 'Welcome to 99 cats, bro!')
   end

end
