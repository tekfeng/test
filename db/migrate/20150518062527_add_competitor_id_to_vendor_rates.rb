class AddCompetitorIdToVendorRates < ActiveRecord::Migration
  def change
    add_column :vendor_rates, :competitor_id, :integer
  end
end
