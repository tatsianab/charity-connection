class OrdersController < ApplicationController

  before_action :validate_charity?, only: [:new,:create, :edit, :show]

	def new
		@order = Order.new
	end

	def create
		@user = User.find(session[:user_id])
		@charity = @user.charity
		@cart = Cart.find_by(charity_id: @charity.id)
		@order = Order.create_from_cart(@cart, @charity)

		if @order
        @cart_items = []
        @cart.items.each do |item|
              @cart_items << item.title
        end

        UserMailer.order_email(@user,@cart_items).deliver_later

  			session.delete(:cart_id)
  			@order.change_inventory(@cart)
  			@order.change_order_status

        redirect_to @order

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
