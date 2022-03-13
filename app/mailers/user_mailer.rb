class UserMailer < ApplicationMailer
  default from: 'notifications@banana.com'

  def welcome_email
    @user = params[:user]
    attachments.inline['doodle-135.png'] =
      File.read("#{Rails.root}/app/assets/images/doodle-135.png")
    mail(to: @user.email, subject: 'Welcome to Banana!')
  end

  def approved_email
    @user = params[:user]
    attachments.inline['doodle-72.png'] =
      File.read("#{Rails.root}/app/assets/images/doodle-72.png")
    mail(to: @user.email, subject: 'Your Banana account has been approved!')
  end

  def new_user_email
    @user = params[:user]
    attachments.inline['doodle-97.png'] =
      File.read("#{Rails.root}/app/assets/images/doodle-97.png")
    mail(
      to: 'jason.ho@obf.ateneo.edu',
      subject: 'Your have a new user on Banana!',
    )
  end
end
