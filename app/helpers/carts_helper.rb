module CartsHelper

	def initialize_cart
     unless session[:cart_id]
            cart = Cart.create
            session[:cart_id] = cart.id
     end
        cart = Cart.find(session[:cart_id])
 	end

 	def current_cart
 		if session[:cart_id] != nil
 			cart ||= Cart.find(session[:cart_id])
 		end
 	end

end
