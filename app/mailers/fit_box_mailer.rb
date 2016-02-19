class FitBoxMailer < ApplicationMailer
  layout false
  def new_fit_box(user, fit_box)
    @user = user
    @fitbox = fit_box
    mail(to: @user.email, from: 'info@fitbox.sourcingsociety.com', subject: 'New FitBox')
  end
end
