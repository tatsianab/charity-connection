class Item < ActiveRecord::Base
	belongs_to :category
	has_many :line_items
	delegate :cart, :to => :line_item
	belongs_to :business

	validates_presence_of :title, :inventory, :description, :category_id, :business_id

	def self.number_of_businesses_making_donations
  		select(:business_id).distinct.count
  	end

  	def self.total_sold_by_item_id(item_id)
 
		item = ActiveRecord::Base.connection.execute("SELECT i.title, SUM(li.quantity) FROM orders JOIN carts c ON c.id = orders.cart_id JOIN line_items li ON c.id = li.cart_id JOIN items i ON li.item_id = i.id WHERE i.id = #{item_id} GROUP BY i.title")
		if item.count != 0
			item[0]["sum"].to_i
		else
			0
		end
	end

	def self.all_items_sold
		items = ActiveRecord::Base.connection.execute("SELECT i.title, SUM(li.quantity) FROM orders JOIN carts c ON c.id = orders.cart_id JOIN line_items li ON c.id = li.cart_id JOIN items i ON li.item_id = i.id GROUP BY i.id")
	end

	def self.highest_sales_item
		items = ActiveRecord::Base.connection.execute("SELECT i.title, SUM(li.quantity) FROM orders JOIN carts c ON c.id = orders.cart_id JOIN line_items li ON c.id = li.cart_id JOIN items i ON li.item_id = i.id GROUP BY i.id")

		highest = 0
		product = ""

		items.each do |item| 
			if item["sum"].to_i > highest
				highest = item["sum"].to_i 
				product = item["title"]
			end

		end

		return "#{product}, number sold: #{highest}"
	end

	def self.total_sold(item_id)
		self.total_sold_by_item_id(item_id) + Item.find(item_id).inventory
	end

	def self.ratio_sold(item_id)
		self.total_sold_by_item_id(item_id) / self.total_sold(item_id).to_f
	end

	def self.highest_ratio_sold
		highest_ratio = 0
		highest_id = 0


		Item.ids.each do |id|
			if self.ratio_sold(id) > highest_ratio
				highest_ratio = self.ratio_sold(id)
				highest_id = id
			end
		end
	
		highest_id
	end

	def self.name_of_highest_ratio_sold
		id_of_highest_ratio_sold = self.highest_ratio_sold
		Item.find(id_of_highest_ratio_sold).title
	end

	def self.sort_by_name
	   self.all.sort_by { |item| item.title }
	end 

	def capital_letter
	  self.title.capitalize

	end
end