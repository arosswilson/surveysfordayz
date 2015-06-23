class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to login_path
  end

  def new
    @user = User.new()
  end

  def show
    @user = User.find(session[:user_id])
  end

  def login
  end
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
