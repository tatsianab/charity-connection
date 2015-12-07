class AddCharityIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :charity_id, :integer
  end
end
