class AddVendorRateIdToSeasonRoomPrices < ActiveRecord::Migration
  def change
    add_column :season_room_prices, :vendor_rate_id, :integer
  end
end
