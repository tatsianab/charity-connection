class Order < ActiveRecord::Base
	belongs_to :cart
	has_many :items, through: :cart

	def self.create_from_cart(cart)
		@order = Order.find_or_create_by({id: cart.id, total: cart.items.count, cart_id: cart.id})
	end

	def change_order_status
		self.status = "submitted"
	end

	def change_inventory
		cart.items.each do |item|
			item = Item.find(item.id)
			item.inventory -=1
			item.save
		end
	end
end
