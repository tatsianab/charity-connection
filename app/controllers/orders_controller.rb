class OrdersController < ApplicationController

  before_action :validate_charity?, only: [:new,:create, :edit]
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
             
            respond_to do |format|
	            # Tell the UserMailer to send a welcome email after save
	            UserMailer.order_email(@user,@cart_items).deliver_later
	            
	            format.html { redirect_to(@user, notice: 'Your order was confirmed.') }
	            format.json { render json: @user, status: :created, location: @user }
         	end
         	@cart.checkout(@order)
	        session.delete(:cart_id)
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
