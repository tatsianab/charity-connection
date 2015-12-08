class Item < ActiveRecord::Base
	belongs_to :category
	has_many :line_items
	delegate :cart, :to => :line_item
	belongs_to :business

	validates_presence_of :title, :inventory, :description, :category_id# :business_id


def self.sort_by_name
   self.all.sort_by { |item| item.title }
end 

def capital_letter
  self.title.capitalize
end
end