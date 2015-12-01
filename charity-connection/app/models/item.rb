class Item < ActiveRecord::Base
	belongs_to :category
	has_many :line_items
	delegate :cart, :to => :line_item
	belongs_to :business
end
