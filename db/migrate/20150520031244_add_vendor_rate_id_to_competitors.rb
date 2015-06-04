class AddVendorRateIdToCompetitors < ActiveRecord::Migration
  def change
    add_column :competitors, :vendor_rate_id, :integer
  end
end
