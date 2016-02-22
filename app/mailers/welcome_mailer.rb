class WelcomeMailer < ApplicationMailer
  layout false
  
  def welcome_email(user)
    @user = user
    mail(to: @user.email, from: 'info@fitbox.sourcingsociety.com', subject: 'Thank you for signing up!')
  end

end
