class AdminController < ApplicationController

	def index
		@users = User.all
		@businesses = Business.all
		@charities = Charity.all
		@carts = Cart.all
		@categories = Category.all
		@items = Item.all
		@line_items = LineItem.all
		@orders = Order.all
		@users = User.all
	end

	def show
		@user = User.find_by_id(params[:id])

		if @user.nil?
			flash[:notice] = "User was not found, please login or sign up."
			redirect_to signup_path
		elsif !@user.admin
			flash[:alert] = "I'm sorry, you must be registered as an admin to view this page."
			redirect_to signup_path	
		end
	end
end
