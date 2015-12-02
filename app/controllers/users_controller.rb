class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
				@user = User.new(user_params)

				if !params['organization']
					# raise
						flash[:notice] = "Please select organization"
						render 'new'

				elsif @user.save
							if params['organization'] == 'business'
								Business.create(user_id: @user.id)
							elsif params['organization'] == 'charity'
								Charity.create(user_id: @user.id)
							end
							# raise
							redirect_to '/'
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
