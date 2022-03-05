class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :first_name, :last_name)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :first_name, :last_name)
    end
  end

  private

  def admin_only
    redirect_to stocks_path if !current_user.admin
  end

  def trader_only
    redirect_to users_path if current_user.admin
  end

  def approved_only
    redirect_to blocked_path if !current_user.approved
  end
end
