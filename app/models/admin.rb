class Admin < ActiveRecord::Base
  	belongs_to :user
    belongs_to :googleomniauthtable

  	has_many :categories


end
