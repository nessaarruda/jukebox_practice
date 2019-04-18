class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:danger] = "Login credentials were bad or missing"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
