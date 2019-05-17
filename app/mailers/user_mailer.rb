class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Koala Farm!')
  end

  def pw_reset_email(user)
    @user = user
    mail(to: @user.email, subject: 'Koala Farm password reset')
  end

end
