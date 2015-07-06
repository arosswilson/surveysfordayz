class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: user_params[:email])
    if @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.alert = "Fire fire fire"
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def destroy
      session[:user_id] = nil
      redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
