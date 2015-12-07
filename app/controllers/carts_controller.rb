class CartsController < ApplicationController
    
    def show
        @current_cart = Cart.find(session[:cart_id])
    end

    def destroy
        @current_cart = Cart.find(session[:cart_id])
        session.delete(:cart_id)
        @current_cart.destroy
        redirect_to(items)
    end
end
