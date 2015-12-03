class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
 def initialize_cart
     unless session[:cart_id]
            cart = Cart.create
            session[:cart_id] = cart.id
    end
        cart = Cart.find(session[:cart_id])
 end

 def current_cart
        cart ||= Cart.find(session[:cart_id])
 end

end
