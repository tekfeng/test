class CreateVendorRates < ActiveRecord::Migration
  def change
    create_table :vendor_rates do |t|
      t.string :name
      t.integer :vendor_category_id
      t.integer :city_id

      t.timestamps null: false
    end
  end
end
