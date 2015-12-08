class User < ActiveRecord::Base
	has_one :business
	has_one :charity
	has_one :admin
	validates_presence_of :name, :email, :address, :zip, :phone, :city, :state
	validates :email, format: {:with => /@/}
	has_secure_password



	def create_business_or_charity(user, organization)
		Object.const_get(organization).create(user_id: user.id)
	end

end
