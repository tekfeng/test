class CreateTourCategories < ActiveRecord::Migration
  def change
    create_table :tour_categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
