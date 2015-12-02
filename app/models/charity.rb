class Charity < ActiveRecord::Base
  has_one :cart
  has_many :orders
  has_many :items, through: :orders
  belongs_to :user
end
