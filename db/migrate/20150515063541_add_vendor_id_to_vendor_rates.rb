class AddVendorIdToVendorRates < ActiveRecord::Migration
  def change
    add_column :vendor_rates, :vendor_id, :integer
    add_column :vendor_rates, :effective, :date
    add_column :vendor_rates, :expired, :date
    add_column :vendor_rates, :rate_type, :integer
  end
end
