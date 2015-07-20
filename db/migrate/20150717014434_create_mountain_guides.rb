class CreateMountainGuides < ActiveRecord::Migration
  def change
    create_table :mountain_guides do |t|
      t.string :name
      t.string :period
      t.integer :total_climb, default: 0
      t.integer :penalty, default: 0
      t.integer :incentive, default: 0 
      t.timestamps null: false
    end
  end
end
