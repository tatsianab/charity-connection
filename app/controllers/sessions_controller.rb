class SessionsController < ApplicationController

  def create

    @user = GoogleOmniauthTable.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id
    redirect_to root_path


    # @user = User.find_by_email(params[:session][:email])
    # if @user && @user.authenticate(params[:session][:password])
    #   session[:user_id] = @user.id
    #   redirect_to @user
    # else
    #   flash[:error] = "Invalid username or password"
    #   render "new"
    # end
  end

  def destroy
       log_out
       redirect_to root_url
  end

end
