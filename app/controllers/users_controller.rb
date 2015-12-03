class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def show
		@user = User.where(id: params[:id])
		if @user.empty?
			flash[:notice] = "User was not found, please login or sign up"
			redirect_to signup_path
		end

	end

	def create
		user = User.new(user_params)

		if !params['organization']
			flash[:notice] = "Please select organization"
			render 'new'

		elsif user.save
			session[:user_id] = user.id
			if params['organization'] == 'business'
				Business.create(user_id: user.id)
			elsif params['organization'] == 'charity'
				Charity.create(user_id: user.id)
			end
			redirect_to user
		else
			flash[:notice]
			render 'new'
		end
	end

	private

	def user_params
      params.require(:user).permit(:name, :email, :address, :zip, :phone, :city, :state, :organization, :password, :password_confirmation)
    end
end
