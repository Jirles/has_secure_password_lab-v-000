class UsersController < ApplicationController
  before_action :require_login, only: [:welcome]

  def welcome
    @user = current_user
  end

  def new
    @user = User.new
    @controller = 'users'
  end

  def create
    @user = User.new(user_params)
    if name_present? && @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to signup_path
    end
  end

  private

  def current_user
    User.find(session[:user_id])
  end

  def require_login
    !!session[:user_id]
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def name_present?
    params[:user][:name] && !params[:user][:name].empty?
  end
end
