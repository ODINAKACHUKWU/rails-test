class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(user_params[:username])
  
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      return redirect_to admin_messages_path, notice: "Signed in successfully." if @user.admin?
    
      redirect_to messages_path, notice: "Signed in successfully."
    else
      redirect_to new_session_path, alert: "Invalid username or password."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to messages_path, notice: "Signed out successfully."
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
