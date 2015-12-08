class UsersController < ApplicationController
	before_action :require_login, only: [:edit]

	def new
		@user = User.new
		@organization = ['Business', 'Charity']
	end

	def create
		organization = params[:organization]
     if @omni_user = GoogleOmniauthTable.find_by(id: session[:user_id])
     	  @user = User.new(name: @omni_user.name, email: @omni_user.email)
        @user.phone = user_params[:phone]
        @user.address = user_params[:address]
        @user.city = user_params[:city]  
        @user.state = user_params[:state]
        @user.zip = user_params[:zip]
        @user.password_digest = @omni_user.oauth_token
     else	  
	    @user = User.new(user_params)
    end
	    if @user.save
	    	 session[:user_id] = @user.id
		     if @omni_user 
			    	 @omni_user.user = @user
			    	 @omni_user.save
		     end 
	       @user.create_business_or_charity(@user, organization)
	       log_in(@user)
	       redirect_to @user
	    else
	       flash[:alert] = "Sorry, your account could not be created."
	       render 'new'
	    end
  	end
 
	def show
		@user = User.find_by_id(params[:id])

		if @user.nil?
			flash[:notice] = "User was not found, please login or sign up."
			redirect_to signup_path
		end

	end

	def edit
		@user = User.find_by_id(params[:id])
	end

	def update
		@user = User.find_by_id(params[:id])
		@user.update_attributes(user_params)
		if @user.save
			redirect_to @user
		else
			flash[:notice] = "I'm sorry, your account could not be updated."
			render 'edit'
		end
	end

	private

	def user_params
    	params.require(:user).permit(:name, :email, :address, :zip, :phone, :city, :state, :organization, :password, :password_confirmation)
    end

end
