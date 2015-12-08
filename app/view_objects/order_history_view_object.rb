class OrderHistoryViewObject
	attr_accessor :orders

	def initialize(orders)
		@orders = orders
	end

	def no_order?
		orders.empty?
	end

	def users_orders
		return_string = ""
		orders.each do |order|
			return_string << (order.created_at.to_s)
			order.items.each do |item|
				return_string << (" - " + item.title)
			end
		end
		return_string

	end

	def display_orders
		if no_order?
			"It looks like you don't have any orders!"
		else
			users_orders
		end
	end

end