class AddCompetitorIdToSeasonRoomPrices < ActiveRecord::Migration
  def change
    add_column :season_room_prices, :competitor_id, :integer
  end
end
