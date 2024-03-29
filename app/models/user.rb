class User < ActiveRecord::Base
	has_one :business
	has_one :charity
	has_one :admin
  has_one :googleomniauthtable
	validates_presence_of :name, :email, :address, :zip, :phone, :city, :state
	validates :email, format: {:with => /@/}
	has_secure_password



	def create_business_or_charity(user, organization)
		Object.const_get(organization).create(user_id: user.id)
	end

	def self.number_of_users
  		count
  	end

  	def self.number_of_business_users
  		joins(:business).count
  	end

  	def self.number_of_charity_users
  		joins(:charity).count
  	end

end
