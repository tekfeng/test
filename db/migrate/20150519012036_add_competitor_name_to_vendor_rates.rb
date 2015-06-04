class AddCompetitorNameToVendorRates < ActiveRecord::Migration
  def change
    add_column :vendor_rates, :competitor_name, :string
  end
end
