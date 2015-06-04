class AddRateTypeToSeasonRoomPrices < ActiveRecord::Migration
  def change
    add_column :season_room_prices, :rate_type, :integer
  end
end
