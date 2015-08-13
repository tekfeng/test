class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.string :name
      t.integer :center_id
      t.integer :item_category_id
      t.integer :current_balance
      t.timestamps null: false
    end
  end
end
