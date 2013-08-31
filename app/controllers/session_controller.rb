class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    session[:user_id] = user.id if user.present? && user.authenticate(params[:password])
    redirect_to(root_path)
  end

  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end
end
