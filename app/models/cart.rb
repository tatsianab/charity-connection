class Cart < ActiveRecord::Base
	belongs_to :charity
	has_one :order
	has_many :line_items
	has_many :items, through: :line_items

	def add_item(item_id)
		item = Item.find(item_id)
		if self.items.include?(item)
			line_item = LineItem.find_by({item_id: item_id, cart_id: self.id})
			line_item.quantity +=1
		else
			self.items << item
			line_item = LineItem.find_by({item_id: item_id, cart_id: self.id})
			line_item.quantity = 1
		end
		line_item.save
		line_item
	end

end
