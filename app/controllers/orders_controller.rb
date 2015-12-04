class OrdersController < ApplicationController

	def index
	end

	def new
		@order = Order.new
	end

	def create
		@user = User.find(session[:user_id])
		@charity = @user.charity
		@cart = Cart.find_by(charity_id: @charity.id)
		@order = Order.create(status: "submitted", cart:@cart)

		if @order
			redirect_to @order
		end
	end

	def show
		@user = User.find(session[:user_id])
		@charity = @user.charity
		@cart = Cart.find_by(charity_id: @charity.id)
		@order = Order.where(cart_id: @cart.id)
	end

	private

	def order_params
		params.require(:order).permit(:status, :cart_id)
	end

end
