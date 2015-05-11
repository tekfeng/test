class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :code
      t.string :name
      t.integer :tour_category_id
      t.timestamps
    end
  end
end
