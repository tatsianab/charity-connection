class OrdersController < ApplicationController

  before_action :validate_charity?, only: [:new,:create, :edit, :show]
	def index
		@user = User.find(session[:user_id])
		@orders = @user.charity.orders
	end

	def new
		@order = Order.new
	end

	def create
		@user = User.find(session[:user_id])
		@charity = @user.charity
		@cart = Cart.where(charity_id: @charity.id).last
		@order = Order.create_from_cart(@cart, @charity)

		if @order
            @cart_items = []
            @cart.items.each do |item|
            	@cart_items << item.title
        	end
            UserMailer.order_email(@user,@cart_items).deliver_later

         	@cart.checkout(@order)
	        session.delete(:cart_id)
		else
			flash[:notice] = "I'm sorry, this order could not be checked out."
		end
	end

	def show
    	@order = Order.find(params[:id])
	end

	private

	def order_params
		params.require(:order).permit(:status, :cart_id)
	end

end
