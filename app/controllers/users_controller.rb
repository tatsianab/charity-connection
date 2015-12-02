class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			if params['organization'] == 'business'
				Business.create(user_id: @user.id)
			elsif params['organization'] == 'charity'
				Charity.create(user_id: @user.id)
			else
				redirect_to new_user_path
			end
			redirect_to '/'
		else
			raise
			redirect_to new_user_path
		end
		# {"utf8"=>"✓", "authenticity_token"=>"VoeegM8xi7cfOt9xUohynuzS0ilOtr9871yjo3Ee0LYrXTPKqu5e8VX+JlQIL7Sf4jSUNXkPbiVmGVZ6c2ZNPg==", "user"=>{"name"=>"", "email"=>"", "password"=>"", "password_confirmation"=>"", "phone"=>"", "address"=>"", "city"=>"", "state"=>"", "zip"=>""}, "organization"=>"business", "commit"=>"Sign Up", "controller"=>"users", "action"=>"create"}
	end	

	private
		def user_params
	      params.require(:user).permit(:name, :email, :address, :zip, :phone, :city, :state, :organization, :password, :password_confirmation)
	    end
end
