class UsersController < ApplicationController
	def new
		@user = User.new
		@organization = ['Business', 'Charity']
	end

	def create
	    @user = User.new(user_params)
	    if @user.save
	       log_in(@user)
	       redirect_to @user
	    else
	       render 'new'
	    end
  	end

	def show
		@user = User.find_by_id(params[:id])

		if @user.nil?
			flash[:notice] = "User was not found, please login or sign up"
			redirect_to signup_path
		end

	end

	private

	def user_params
      params.require(:user).permit(:name, :email, :address, :zip, :phone, :city, :state, :organization, :password, :password_confirmation)
    end
end
