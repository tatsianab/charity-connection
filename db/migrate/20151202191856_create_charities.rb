class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
