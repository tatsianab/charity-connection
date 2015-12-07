class OrdersController < ApplicationController

  before_action :validate_charity?, only: [:new,:create, :edit]

	def new
		@order = Order.new
	end

	def create
		@user = User.find(session[:user_id])
		@charity = @user.charity
		@cart = Cart.find_by(charity_id: @charity.id)
		binding.pry
		@order = Order.create_from_cart(@cart, @charity)

		if @order
			session.delete(:cart_id)
			@order.change_inventory(@cart)
			@order.change_order_status
			redirect_to @user
		else
			flash[:notice] = "I'm sorry, this order could not be checked out."
		end
	end

	def show
		@user = User.find(session[:user_id])
		@orders = @user.charity.orders
	end

	private

	def order_params
		params.require(:order).permit(:status, :cart_id)
	end

end
