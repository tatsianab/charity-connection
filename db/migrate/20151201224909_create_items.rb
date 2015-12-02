class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :business_id
      t.integer :category_id
      t.string :title
      t.integer :inventory
      t.string :description
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
