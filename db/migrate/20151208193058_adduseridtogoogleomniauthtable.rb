class Adduseridtogoogleomniauthtable < ActiveRecord::Migration
  def change
    add_column :google_omniauth_tables, :user_id, :integer 
  end
end
