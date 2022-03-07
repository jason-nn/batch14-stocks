class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Example!')
  end

  def approved_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Your Example account has been approved!')
  end
end
