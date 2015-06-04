class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :vendor_type
      t.string :email
      t.string :contact
      t.string :fax
      t.integer :city_id

      t.timestamps null: false
    end
  end
end
