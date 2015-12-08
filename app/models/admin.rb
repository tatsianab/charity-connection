class Admin < ActiveRecord::Base
  	belongs_to :user
    belongs_to :googleomniauthtable

  	has_many :categories

  	def number_of_users(users)
  		users.count
  	end

  	def number_of_business_users(users)
  		users.joins(:business).count
  	end

  	def number_of_charity_users(users)
  		users.joins(:charity).count
  	end

  	def number_of_businesses_making_donations(items)
  		items.select(:business_id).distinct.count
  	end

  	def number_of_charities_accepting_donations(orders)
  		orders.select(:charity_id).distinct.count
  	end

  	def number_of_categories(categories)
  		categories.count
  	end
end
