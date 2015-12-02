class User < ActiveRecord::Base
  has_one :business
  has_one :charity
  has_one :admin
  validates_presence_of :name, :email, :address, :zip, :phone, :city, :state
  validates_uniquness_of :email
  validates :email, format: {:with => /@/}
  has_secure_password
  validates :
end
