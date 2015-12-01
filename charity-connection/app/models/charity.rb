class Charity < ActiveRecord::Base
	has_many :items, through: :orders
	has_one :cart
end
