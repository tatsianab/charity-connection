class CartsController < ApplicationController
    
    def show
        @current_cart = Cart.find(session[:cart_id])
    end

    def checkout
        @current_cart = Cart.find(session[:cart_id])
        @order = Order.create_from_cart(@current_cart)
        @order.change_order_status
        @order.change_inventory

        session.delete(:cart_id)
        session.clear
        redirect_to(store_path)
    end


end
