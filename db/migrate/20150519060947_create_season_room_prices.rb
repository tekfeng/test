class CreateSeasonRoomPrices < ActiveRecord::Migration
  def change
    create_table :season_room_prices do |t|
      t.integer :season_id
      t.integer :room_id
      t.float :price

      t.timestamps null: false
    end
  end
end
