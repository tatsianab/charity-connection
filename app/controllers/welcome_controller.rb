class WelcomeController < ApplicationController

  def index
     # @current_cart = Cart.find(session[:cart_id])
     @current_cart = current_cart
     rescue ActiveRecord::RecordNotFound
       @current = nil
  end


end
