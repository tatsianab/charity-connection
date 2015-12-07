module CartsHelper

	def initialize_cart
     	unless session[:cart_id]
     		charity = Charity.find_by(user_id: current_user.id)
            cart = Cart.create(charity_id: charity.id)
            session[:cart_id] = cart.id
     	end
        cart = Cart.find(session[:cart_id])
 	end

 	def current_cart
 		if session[:cart_id] != nil && !Cart.where(id: session[:cart_id]).empty?
 			if Cart.find(session[:cart_id]).charity_id == current_user.id
 				cart ||= Cart.find(session[:cart_id])
 			end
 		end
 	end

end
