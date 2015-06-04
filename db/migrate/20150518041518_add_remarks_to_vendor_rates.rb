class AddRemarksToVendorRates < ActiveRecord::Migration
  def change
    add_column :vendor_rates, :remarks, :string
  end
end
