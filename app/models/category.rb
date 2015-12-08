class Category < ActiveRecord::Base
	has_many :items
	validates_presence_of :name
	belongs_to :admin

  	def self.number_of_categories
  		count
  	end
end
