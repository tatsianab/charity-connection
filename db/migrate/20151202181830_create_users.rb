class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone

      t.timestamps null: false
    end
  end
end
