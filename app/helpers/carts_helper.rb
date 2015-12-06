module CartsHelper

	def initialize_cart
     	unless session[:cart_id]
     		charity = Charity.find_by(user_id: 295)
            cart = Cart.create(charity_id: charity.id)
            session[:cart_id] = cart.id
     	end
        cart = Cart.find(session[:cart_id])
 	end

 	def current_cart
 		if session[:cart_id] != nil && !Cart.where(id: session[:cart_id]).empty?
 			cart ||= Cart.find(session[:cart_id])
 		end
 	end

end
