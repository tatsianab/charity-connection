class User < ActiveRecord::Base
  has_one :business
  has_one :charity
  has_one :admin
end
