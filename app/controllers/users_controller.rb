class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.alert = "Fire fire fire"
      redirect_to root_path
    end
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
