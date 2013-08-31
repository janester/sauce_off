class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(root_path)
    else
      flash[:alert] = "Username or Password Is Incorrect"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end
end
