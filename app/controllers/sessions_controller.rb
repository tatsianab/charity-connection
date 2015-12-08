class SessionsController < ApplicationController

  def create
    if params[:provider] == "google_oauth2"

      @omni_user = GoogleOmniauthTable.from_omniauth(env["omniauth.auth"])
      session[:user_id] = @omni_user.id

      if !@omni_user.user_id 
        @organization = ['Business', 'Charity']
        @user = User.new(name: @omni_user.name, email: @omni_user.email)
        session[:user_id] = @omni_user.id
         render 'users/omni_user_new'

      else  
        session[:user_id] = @omni_user.user_id
        redirect_to user_path(@omni_user.user_id)
      end
    else 
      # redirect_to root_path 
        @user = User.find_by_email(params[:session][:email])

      if !GoogleOmniauthTable.find_by_email(params[:session][:email])  
        if @user && @user.authenticate(params[:session][:password])
          session[:user_id] = @user.id
          redirect_to @user
        else
          flash[:error] = "Invalid username or password"
          render "new"
        end
       else 
         flash[:error] = "Please,sign in with google"
         redirect_to '/login'
       end 
       
    end
  end

  def destroy
       log_out
       redirect_to root_url
  end

end
