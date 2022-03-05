class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.order(:created_at)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: 'Created new user'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params = user_params.clone

    if params[:password].length == 0 &&
         params[:password_confirmation].length == 0
      params[:password] = @user.password
      params[:password_confirmation] = @user.password
    end

    if @user.update(params)
      redirect_to users_path, notice: 'Updated user'
    else
      render :edit
    end
  end

  def approve
    @user = User.find(params[:id])
    @user.update(approved: true)
    redirect_to users_path, notice: 'Approved user'
  end

  private

  def user_params
    params
      .require(:user)
      .permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation,
      )
  end
end
