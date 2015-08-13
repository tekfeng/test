class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :vehicle_no
      t.string :type
      t.string :center
      t.date :last_mantenance
      t.string :licence_validity
      t.timestamps null: false
      t.text :remarks
    end
  end
end
