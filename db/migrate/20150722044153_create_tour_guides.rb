class CreateTourGuides < ActiveRecord::Migration
  def change
    create_table :tour_guides do |t|
      t.string :name
      t.string :period
      t.string :tour_type
      t.integer :allowance, default: 0
      t.integer :total_tours, default: 0
      t.integer :total_allowances, default: 0
      t.string :remark
      t.timestamps null: false
    end
    
    add_column :mountain_guides, :remark, :string 
  end
end
