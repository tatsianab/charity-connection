class UsersController < ApplicationController
	def new
		@user = User.new
		@organization = ['Business', 'Charity']
	end

	def create
		organization = params[:organization]
	    @user = User.new(user_params)
	    if @user.save
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

	private

	def user_params
    	params.require(:user).permit(:name, :email, :address, :zip, :phone, :city, :state, :organization, :password, :password_confirmation)
    end

end
