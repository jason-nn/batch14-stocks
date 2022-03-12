class UserMailer < ApplicationMailer
  default from: 'notifications@banana.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Banana!')
  end

  def approved_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Your Banana account has been approved!')
  end
end
