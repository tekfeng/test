class CreateVehicleTypes < ActiveRecord::Migration
  def change
    create_table :vehicle_types do |t|
      t.string :name
      t.timestamps null: false
    end
    
    add_column :vehicles, :vehicle_category_id, :integer
  end
end
