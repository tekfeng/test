class SeasonRoomPrice < ActiveRecord::Base
  belongs_to :season
  belongs_to :room
  belongs_to :competitor
  belongs_to :vendor_rate
  
  def self.find_price(season_id, room_id, rate_type, vendor_rate_id)    
    price = SeasonRoomPrice.find_or_create_by(season_id: season_id, room_id: room_id, rate_type: rate_type, vendor_rate_id: vendor_rate_id )
    price.price
  end
  
  def self.find_price_competitor(season_id, room_id, rate_type, vendor_rate_id, competitor_id)    
    price = SeasonRoomPrice.find_or_create_by(season_id: season_id, room_id: room_id, rate_type: rate_type, competitor_id: competitor_id, vendor_rate_id: vendor_rate_id)
    price.price
  end
  
end
