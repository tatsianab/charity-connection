class Category < ActiveRecord::Base
	has_many :items
	validates_presence_of :name
	belongs_to :admin
end
