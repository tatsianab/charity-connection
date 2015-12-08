class Addemailtogoogleomniauthtable < ActiveRecord::Migration
  def change
    add_column :google_omniauth_tables, :email, :string 
  end
end
