class Item < ActiveRecord::Base
	belongs_to :category
	has_many :line_items
	delegate :cart, :to => :line_item
	belongs_to :business

	validates_presence_of :title, :inventory, :description, :category_id, :business_id

	def self.number_of_businesses_making_donations
  		select(:business_id).distinct.count
  	end


end
