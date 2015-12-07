class Order < ActiveRecord::Base
	belongs_to :cart
	has_many :items, through: :cart
	belongs_to :charity

	def self.create_from_cart(cart, charity)
		@order = Order.find_or_create_by({id: cart.id, cart_id: cart.id, charity_id: charity.id})
	end

	def change_order_status
		self.status = "submitted"
		self.save
	end

	def change_inventory(cart)
		cart.items.each do |item|
			item.inventory -=1
			item.save
		end
	end

end
