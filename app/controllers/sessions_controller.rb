class SessionsController < ApplicationController
  def index

  end

  def new
  	render 'login'
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:notice] = "Invalid username or password"
      render "login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
