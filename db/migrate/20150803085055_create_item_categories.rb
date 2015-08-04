class CreateItemCategories < ActiveRecord::Migration
  def change
    create_table :item_categories do |t|
      t.string :name
      t.string :code
      t.timestamps null: false
    end
  end
end
